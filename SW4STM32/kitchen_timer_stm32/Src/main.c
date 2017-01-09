/**
 * @file main.c
 *
 * Functional description:
 *  - After power on, LCD will display 00:00
 *  - After 2 minutes of no action, it turns off the display
 *  - Minutes are increased by pressing the "M" button.
 *  - Minutes are decreased by pressing the "S" button.
 *  - The timer will reset to 00:00 if "M" & "S"
 *  are pressed simultaneously
 *  - After the time has been set, the "ST/SP" button will start the timer
 *  ...
 */

#include "main.h"
#include "stm32l0xx_hal.h"
#include "lcd.h"
#include "rtc.h"
#include "gpio.h"
#include "tim.h"
#include "system_clock_conf.h"
#include "eeprom.h"
#include "screen.h"
#include "kt.h"

volatile enum button_states button_state = BUTT_NONE;

volatile uint32_t alarm_duration_timer = 0x00U;
volatile uint32_t alarm_pulse_timer = 0x00U;


int main(void) {
    /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialize all configured peripherals */
    MX_GPIO_Init();
    MX_LCD_Init();
    MX_RTC_Init();
    MX_TIM2_Init();

    /* Enable Ultra low power mode */
    HAL_PWREx_EnableUltraLowPower();
    HAL_PWR_EnableWakeUpPin(PWR_WAKEUP_PIN1);


    while (1) {

        /**
         * Handle the buttons.
         *
         * Buttons are read as interrupts so the system can sleep most of the time.
         */
        switch (button_state) {
        case BUTT_M_DOWN:
            /* Check for Both M & S being pressed */
            if (kt.button_flag & BUTTON_S) {
                button_state = BUTT_MS;
                kt.button_down = 1; /* prevent sleep so next state happens quickly */
            }
            else {
                /* Update time once per press */
                if (!(kt.button_flag & BUTTON_M)) {
                    /* Start a timer to see if it's a long press */
                    kt.button_down = HAL_GetTick();
                    /* Set this button's flag */
                    kt.button_flag |= BUTTON_M;
                    KT_IncreaseTime();
                }
                else {
                    /* Check for long press, sleep is disabled during the button press. */
                    if ((HAL_GetTick() - kt.button_down ) > LONG_PRESS) {
                        KT_IncreaseTime();
                        kt.button_down = HAL_GetTick();
                    }
                }
            }
            break;
        case BUTT_M_UP:
            /* Unset this button's flag */
            kt.button_flag &= ~(BUTTON_M);
            /* Reset the button timer */
            kt.button_down = 0x00U;
            break;
        case BUTT_S_DOWN:
            /* Check for Both M & S being pressed */
            if (kt.button_flag & BUTTON_M) {
                button_state = BUTT_MS;
                kt.button_down = 1; /* prevent sleep so next state happens quickly */
            }
            else {
                /* Update time once per press */
                if (!(kt.button_flag & BUTTON_S)) {
                    /* Start a timer to see if it's a long press */
                    kt.button_down = HAL_GetTick();
                    /* Set this button's flag */
                    kt.button_flag |= BUTTON_S;
                    KT_DecreaseTime();
                }
                else {
                    /* Check for long press, sleep is disabled during the button press. */
                    if ((HAL_GetTick() - kt.button_down ) > LONG_PRESS) {
                        KT_DecreaseTime();
                        kt.button_down = HAL_GetTick();
                    }
                }
            }
            break;
        case BUTT_S_UP:
            /* Unset this button's flag */
            kt.button_flag &= ~(BUTTON_S);
            /* Reset the button timer */
            kt.button_down = 0x00U;
            break;
        case BUTT_MS:
            /* Reset time */
            state = KT_STATE_RESET;
            break;
        case BUTT_STSP_DOWN:
            if (state == KT_STATE_SETUP || state == KT_STATE_STOPPED) {
                /* Time setting mode || stopped so start pressed */
                state = KT_STATE_COUNTDOWN;
                /* Store this value for retrieval after shutdown */
                if (EEPROM_ByteRead(EEPROM_ADDRESS) != kt.minutes) {
                   EEPROM_ByteWrite(EEPROM_ADDRESS, kt.minutes);
                }
            }
            else if (state == KT_STATE_COUNTDOWN) {
                /* Counting down so stop pressed */
                state = KT_STATE_STOPPED;
            }
            else if (alarm_duration_timer > 0) {
                /* If alarm is on, stop it */
                state = KT_STATE_ALARM_STOP;
            }
            kt.update = 1;
            button_state = BUTT_NONE;
            break;
        default:
            break;
        }

         /* Main kitchen timer state machine */
        switch (state) {
        case KT_STATE_INIT:
            state = KT_StateInit(state);
            break;
        case KT_STATE_RESET:
            state = KT_StateReset(state);
            break;
        case KT_STATE_OFF:
            /* Go into very low power mode */
            state = KT_StateOff(state);
            break;
        case KT_STATE_SETUP:
            /* time setting mode */
            state = KT_StateSetup(state);
            break;

        case KT_STATE_COUNTDOWN:
            /* counting down */
            state = KT_StateCountdown(state);
            break;

        case KT_STATE_STOPPED:
            /* stopped */
            state = KT_StateStopped(state);
            break;

        case KT_STATE_ALARM_START:
            /* start alarm sounding */
            state = KT_StateAlarmStart(state);
            break;

        case KT_STATE_ALARM_ON_HIGH:
            state = KT_StateAlarmOnHigh(state);
            break;

        case KT_STATE_ALARM_ON_LOW:
            state = KT_StateAlarmOnLow(state);
            break;

        case KT_STATE_ALARM_STOP:
            state = KT_StateAlarmStop(state);
            break;

        default:
            if (KT_IdleTimeout()) {
                state = KT_STATE_OFF;
            }
            break;

        }

        Screen_Process(&hlcd, &kt);

        if (state != KT_STATE_OFF && (kt.button_down == 0) && (alarm_duration_timer == 0)) {
            //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);

            /* Disable the systick interrupt to not wake up every millisecond */
            /* WHY though?? Stop mode should be stopping the MSI clock */
            HAL_SuspendTick();
//            SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
//                       SysTick_CTRL_ENABLE_Msk;

            /* Enter Stop Mode */
            __HAL_RCC_WAKEUPSTOP_CLK_CONFIG(RCC_STOP_WAKEUPCLOCK_MSI);
            __HAL_PWR_CLEAR_FLAG(PWR_FLAG_WU);
            HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);

            /* Enable the systick interrupt */
//            SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
//                       SysTick_CTRL_TICKINT_Msk   |
//                       SysTick_CTRL_ENABLE_Msk;
            HAL_ResumeTick();

            //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
       }



    }
}

/**
 * Callback for HAL_GPIO_EXTI_IRQHandler() in EXTI4_15_IRQHandler().
 *
 * Handles the interrupts which occur on button press.
 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
    kt.idle_time = 0;
    if (HAL_GPIO_ReadPin(GPIOB, GPIO_Pin) == 0x01) {
        /* Rising edge, button pushed */
        if (GPIO_Pin == GPIO_PIN_4) {
            button_state = BUTT_M_DOWN;
        } else if (GPIO_Pin == GPIO_PIN_5) {
            button_state = BUTT_S_DOWN;
        } else if (GPIO_Pin == GPIO_PIN_6) {
            button_state = BUTT_STSP_DOWN;
        }
    }
    else {
        /* Falling edge, button released */
        if (GPIO_Pin == GPIO_PIN_4) {
            button_state = BUTT_M_UP;
        } else if (GPIO_Pin == GPIO_PIN_5) {
            button_state = BUTT_S_UP;
        } else if (GPIO_Pin == GPIO_PIN_6) {
            button_state = BUTT_STSP_UP;
        }
    }
}

/**
 * Callback for RTC_IRQHandler()
 */
void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc) {
    KT_RTCEx_WakeUpTimerEventCallback();
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
void Error_Handler(void) {
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
    while (1) {
    }
}

