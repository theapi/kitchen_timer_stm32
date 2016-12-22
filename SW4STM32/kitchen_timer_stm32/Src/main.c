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

volatile uint8_t state = 0;
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

        switch (state) {
        case 0x0:
            /* time setting mode */

            break;

        case 0x1:
            /* counting down */

            break;

        case 0x2:
            /* stopped */

            break;

        case 0x3:
            /* alarm sounding */

            break;

        case 0x4:
            /* start pressed */
            HAL_RTC_MspInit(&hrtc);
            ampm = 0;
            state = 0x1;
            break;

        case 0x5:
            /* stop pressed */
            HAL_RTC_MspDeInit(&hrtc);
            ampm = 1;
            state = 0x2;
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

        /* Enter Stop Mode */
        HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);

    }
}

/**
 * Callback for HAL_GPIO_EXTI_IRQHandler() in EXTI4_15_IRQHandler().
 *
 * Handles the interrupts which occur on button press.
 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
    if (GPIO_Pin == GPIO_PIN_4) {
        ++minutes;
        seconds = 0;
        if (minutes > 99) {
            minutes = 99;
        }
        update_display = 1;
    } else if (GPIO_Pin == GPIO_PIN_5) {
        seconds = 0;
        if (minutes > 0) {
            --minutes;
        }
        update_display = 1;
    } else if (GPIO_Pin == GPIO_PIN_6) {
        if (state == 0x0 || state == 0x2) {
            /* Time setting mode || stopped so start pressed */
            state = 0x4;
        } else if (state == 0x1) {
            /* Counting down so stop pressed */
            state = 0x5;
        }
        update_display = 1;
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
            state = 0x3;
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

