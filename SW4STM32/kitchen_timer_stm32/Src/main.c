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
#include "system_clock_conf.h"
#include "lcd_dl1178.h"

volatile enum main_states state = STATE_SETUP;
volatile enum button_states button_state = BUTT_NONE;
enum button_flags button_flag = 0;
volatile uint8_t minutes = 0;
volatile uint8_t seconds = 0;
volatile uint8_t ampm = 1;
volatile uint8_t update_display = 1;

int main(void) {
    /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialize all configured peripherals */
    MX_GPIO_Init();
    MX_LCD_Init();
    MX_RTC_Init();

    /* Stop the RTC clock initially */
    HAL_RTC_MspDeInit(&hrtc);

    /* After power on, LCD will display 00:00 */
    LCD_display(&hlcd, minutes, seconds, ampm);

    while (1) {

        /**
         * Handle the buttons.
         *
         * Buttons are read as interrupts so the system can sleep most of the time.
         */
        switch (button_state) {
        case BUTT_M_DOWN:
            /* Update time once per press */
            if (!(button_flag & BUTTON_M)) {
                /* Set this button's flag */
                button_flag |= BUTTON_M;
                /* Increase time */
                ++minutes;
                if (minutes > 99) {
                    minutes = 99;
                }
                update_display = 1;
            }
            break;
        case BUTT_M_UP:
            /* Unset this button's flag */
            button_flag &= ~(BUTTON_M);
            break;
        case BUTT_S_DOWN:
            /* Update time once per press */
            if (!(button_flag & BUTTON_S)) {
                /* Set this button's flag */
                button_flag |= BUTTON_S;
                /* Decrease time */
                if (minutes > 0) {
                    --minutes;
                }
                update_display = 1;
            }
            break;
        case BUTT_S_UP:
            /* Unset this button's flag */
            button_flag &= ~(BUTTON_S);
            break;
        case BUTT_MS:
            /* Reset time */

            break;
        case BUTT_STSP_DOWN:
            if (state == STATE_SETUP || state == STATE_STOPPED) {
                /* Time setting mode || stopped so start pressed */
                state = STATE_COUNTDOWN;
                /* start pressed */
                HAL_RTC_MspInit(&hrtc);
            } else if (state == STATE_COUNTDOWN) {
                /* Counting down so stop pressed */
                state = STATE_STOPPED;
                /* stop pressed */
                HAL_RTC_MspDeInit(&hrtc);
            }
            update_display = 1;
            button_state = BUTT_NONE;
            break;
        default:
            break;
        }

        /* Main state machine */
        switch (state) {
        case STATE_SETUP:
            /* time setting mode */

            break;

        case STATE_COUNTDOWN:
            /* counting down */
            ampm = 0;
            break;

        case STATE_STOPPED:
            /* stopped */
            ampm = 1;
            break;

        case STATE_ALARM:
            /* alarm sounding */
            HAL_RTC_MspDeInit(&hrtc);
            ampm = 1;

            state = STATE_STOPPED;
            break;

        default:
            break;

        }

        if (update_display == 1) {
            update_display = 0;
            /* Update the screen */
            LCD_display(&hlcd, minutes, seconds, ampm);
        }

        /* Enable Ultra low power mode */
        HAL_PWREx_EnableUltraLowPower();


        //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);
        /* Disable the systick interrupt to not wake up every millisecond */
        SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
                   SysTick_CTRL_ENABLE_Msk;

        /* Enter Stop Mode */
        HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);

        /* Enable the systick interrupt */
        SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
                   SysTick_CTRL_TICKINT_Msk   |
                   SysTick_CTRL_ENABLE_Msk;


        //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);

    }
}

/**
 * Callback for HAL_GPIO_EXTI_IRQHandler() in EXTI4_15_IRQHandler().
 *
 * Handles the interrupts which occur on button press.
 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
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
    if (seconds > 0) {
        --seconds;
    }
    else {
        if (minutes == 0 && seconds == 0) {
            /* Sound the alarm */
            state = STATE_ALARM;
        }
        else {
            seconds = 59;
            if (minutes > 0) {
                --minutes;
            }
        }
    }

    update_display = 1;
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

