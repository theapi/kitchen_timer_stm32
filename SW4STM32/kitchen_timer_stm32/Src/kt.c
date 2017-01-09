/*
 * @file kt.c
 *
 */

#include "kt.h"
#include "eeprom.h"

KT_TypeDef kt;
KT_StateTypeDef state;

void KT_Init() {
    kt.minutes = 0;
    kt.seconds = 0;
    kt.ampm = 1;
    kt.update = 1;
    kt.idle_time = 0;
    kt.button_flag = 0;
    kt.button_down = 0;
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
void KT_IdleTimeout(void) {
    if (kt.idle_time > MAX_IDLE_TIME) {
        state = KT_STATE_OFF;
    }
}

/**
 * Callback for HAL_RTCEx_WakeUpTimerEventCallback which is a calllback for RTC_IRQHandler().
 */
void KT_RTCEx_WakeUpTimerEventCallback() {
    //HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
    if (state == KT_STATE_COUNTDOWN) {
        kt.idle_time = 0;
        if (kt.seconds > 0) {
            --kt.seconds;
        }
        else {
            if (kt.minutes == 0 && kt.seconds == 0) {
                /* Sound the alarm */
                state = KT_STATE_ALARM_START;
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
    kt.minutes = EEPROM_ByteRead(EEPROM_ADDRESS);

    button_state = BUTT_NONE;
    return KT_STATE_SETUP;
}

KT_StateTypeDef KT_StateReset(KT_StateTypeDef state) {
    KT_Init();
    button_state = BUTT_NONE;
    return KT_STATE_SETUP;
}

KT_StateTypeDef KT_StateOff(KT_StateTypeDef state) {
    return state;
}

KT_StateTypeDef KT_StateSetup(KT_StateTypeDef state) {
    kt.ampm = 1;
    //KT_IdleTimeout(); // this doesn't time out
    return KT_STATE_SETUP;
}

KT_StateTypeDef KT_StateCountdown(KT_StateTypeDef state) {
    kt.ampm = 0;
    return KT_STATE_COUNTDOWN;
}

KT_StateTypeDef KT_StateStopped(KT_StateTypeDef state) {
    return state;
}

KT_StateTypeDef KT_StateAlarmStart(KT_StateTypeDef state) {
    return state;
}

KT_StateTypeDef KT_StateAlarmOnHigh(KT_StateTypeDef state) {
    return state;
}

KT_StateTypeDef KT_StateAlarmOnLow(KT_StateTypeDef state) {
    return state;
}

KT_StateTypeDef KT_StateAlarmStop(KT_StateTypeDef state) {
    return state;
}

