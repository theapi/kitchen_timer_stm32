/*
 * @file kt.c
 *
 */

#include "kt.h"
#include "button.h"
#include "eeprom.h"
#include "screen.h"

KT_TypeDef kt;

void KT_Init() {
    kt.minutes = 0;
    kt.seconds = 0;
    kt.ampm = 1;
    kt.update = 1;
    kt.idle_time = 0;
    kt.state = KT_STATE_INIT;
    EEPROM_init();
}

/**
 * Load the save minutes setting.
 */
uint8_t KT_MinutesLoad(void) {
    return EEPROM_DataLoad(0);
}

/**
 * Save the minutes setting
 */
HAL_StatusTypeDef KT_MinutesSave(uint8_t minutes) {
    return EEPROM_DataSave(0, minutes);
}
/**
 *  Increase the countdown time.
 */
void KT_IncreaseTime() {
    ++kt.minutes;
    if (kt.minutes > 99) {
        kt.minutes = 0;
    }
    kt.update = 1;
}

/**
 *  Decrease the countdown time.
 */
void KT_DecreaseTime() {
    if (kt.minutes > 0) {
        --kt.minutes;
    }
    else {
        kt.minutes = 99;
    }
    kt.update = 1;
}

/**
 * If nothing has happened for a while, turn off.
 */
uint8_t KT_IdleTimeout(void) {
    if (kt.idle_time > MAX_IDLE_TIME) {
        return 1;
    }
    return 0;
}

/**
 * Callback for HAL_RTCEx_WakeUpTimerEventCallback which is a calllback for RTC_IRQHandler().
 */
void KT_RTCEx_WakeUpTimerEventCallback() {
    //HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
    if (kt.state == KT_STATE_COUNTDOWN) {
        kt.idle_time = 0;
        if (kt.seconds > 0) {
            --kt.seconds;
        }
        else {
            if (kt.minutes == 0 && kt.seconds == 0) {
                /* Sound the alarm */
                kt.state = KT_STATE_ALARM_START;
            }
            else {
                kt.seconds = 59;
                if (kt.minutes > 0) {
                    --kt.minutes;
                }
            }
        }
        kt.update = 1;
    }
    else {
        ++kt.idle_time;
    }
}

/**
 * Initial state.
 */
KT_StateTypeDef KT_StateInit(KT_StateTypeDef state) {
    /* Low on the alarm triggered pin */
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);
    /* Start the RTC */
    HAL_RTC_MspInit(&hrtc);
    /* Initialise the kitchen timer structure */
    KT_Init();

    /* Use the stored minutes */
    kt.minutes = KT_MinutesLoad();

    button.state = BUTT_NONE;
    return KT_STATE_SETUP;
}

KT_StateTypeDef KT_StateReset(KT_StateTypeDef state) {
    KT_Init();
    button.state = BUTT_NONE;
    return KT_STATE_SETUP;
}

KT_StateTypeDef KT_StateOff(KT_StateTypeDef state) {
    HAL_RTC_MspDeInit(&hrtc);
    __HAL_PWR_CLEAR_FLAG(PWR_FLAG_WU);
    HAL_PWR_EnterSTANDBYMode();

    /* Woke up via PWR_WAKEUP_PIN1 */
    return KT_STATE_INIT;
}

KT_StateTypeDef KT_StateSetup(KT_StateTypeDef state) {
    kt.ampm = 1;
    if (KT_IdleTimeout()) {
        return KT_STATE_OFF;
    }
    return KT_STATE_SETUP;
}

KT_StateTypeDef KT_StateCountdown(KT_StateTypeDef state) {
    kt.ampm = 0;
    return KT_STATE_COUNTDOWN;
}

KT_StateTypeDef KT_StateStopped(KT_StateTypeDef state) {
    kt.ampm = 1;
    if (KT_IdleTimeout()) {
        return KT_STATE_OFF;
    }
    return KT_STATE_STOPPED;
}

KT_StateTypeDef KT_StateAlarmStart(KT_StateTypeDef state) {
    kt.ampm = 1;
    alarm_duration_timer = HAL_GetTick();
    /* 62 ms pulses of 2048Hz */
    HAL_TIM_Base_MspInit(&htim2);

    alarm_pulse_timer = 0;
    /* High on the alarm triggered pin */
    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Pin = GPIO_PIN_12;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);

    /* Blink the display */
    Screen_BlinkStart(&hlcd);

    return KT_STATE_ALARM_ON_HIGH;
}

KT_StateTypeDef KT_StateAlarmOnHigh(KT_StateTypeDef state) {
    if (alarm_pulse_timer == 0) {
        alarm_pulse_timer = HAL_GetTick();
        /* PB11 buzzing */
        HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_4);
    }
    else if ((HAL_GetTick() - alarm_pulse_timer ) > ALARM_PULSE) {
        HAL_TIM_PWM_Stop(&htim2, TIM_CHANNEL_4);
        state = KT_STATE_ALARM_ON_LOW;
    }

    if ((HAL_GetTick() - alarm_duration_timer ) > ALARM_DURATION) {
        state = KT_STATE_ALARM_STOP;
    }
    return state;
}

KT_StateTypeDef KT_StateAlarmOnLow(KT_StateTypeDef state) {
    if ((HAL_GetTick() - alarm_pulse_timer ) > ALARM_PULSE * 2) {
        state = KT_STATE_ALARM_ON_HIGH;
        alarm_pulse_timer = 0;
    }
    return state;
}

KT_StateTypeDef KT_StateAlarmStop(KT_StateTypeDef state) {
    Screen_BlinkStop(&hlcd);
    HAL_TIM_Base_MspDeInit(&htim2);
    /* Low on the alarm triggered pin */
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);
    /* Put the pin back to analog mode, stops noise to the buzzer */
    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Pin = GPIO_PIN_12;
    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
    alarm_duration_timer = 0;
    return KT_STATE_OFF;
}

/**
 * The main kitchen timer state machine processor.
 */
void KT_StateMachineRun() {
    switch (kt.state) {
    case KT_STATE_INIT:
        kt.state = KT_StateInit(kt.state);
        break;
    case KT_STATE_RESET:
        kt.state = KT_StateReset(kt.state);
        break;
    case KT_STATE_OFF:
        /* Go into very low power mode */
        kt.state = KT_StateOff(kt.state);
        break;
    case KT_STATE_SETUP:
        /* time setting mode */
        kt.state = KT_StateSetup(kt.state);
        break;
    case KT_STATE_COUNTDOWN:
        /* counting down */
        kt.state = KT_StateCountdown(kt.state);
        break;
    case KT_STATE_STOPPED:
        /* stopped */
        kt.state = KT_StateStopped(kt.state);
        break;
    case KT_STATE_ALARM_START:
        /* start alarm sounding */
        kt.state = KT_StateAlarmStart(kt.state);
        break;
    case KT_STATE_ALARM_ON_HIGH:
        kt.state = KT_StateAlarmOnHigh(kt.state);
        break;
    case KT_STATE_ALARM_ON_LOW:
        kt.state = KT_StateAlarmOnLow(kt.state);
        break;
    case KT_STATE_ALARM_STOP:
        kt.state = KT_StateAlarmStop(kt.state);
        break;
    default:
        if (KT_IdleTimeout()) {
            kt.state = KT_STATE_OFF;
        }
        break;
    }
}

