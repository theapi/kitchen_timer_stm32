/**
 * @file main.c
 *
 * Functional description:
 *  - After power on, LCD will display 00:00
 *  - Time is set by the "M" & "S" buttons.
 *  - The timer will reset to 00:00 is "M" & "S"
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

    /* Enable Ultra low power mode */
    HAL_PWREx_EnableUltraLowPower();

    /* Stop the RTC clock initially */
    HAL_RTC_MspDeInit(&hrtc);

    /* After power on, LCD will display 00:00 */
    LCD_display(&hlcd, minutes, seconds, ampm);

    while (1) {

        if (update_display == 1) {
            update_display = 0;
            /* Update the screen */
            LCD_display(&hlcd, minutes, seconds, ampm);
        }

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
        minutes = 0;
        update_display = 1;
    } else if (GPIO_Pin == GPIO_PIN_5) {
        seconds = 0;
        update_display = 1;
    } else if (GPIO_Pin == GPIO_PIN_6) {
        if (state == 0x0) {
            // Stopped so start.
            state = 0x1;
            HAL_RTC_MspInit(&hrtc);
            ampm = 0;
        } else {
            // Running so stop
            state = 0x0;
            HAL_RTC_MspDeInit(&hrtc);
            ampm = 1;
        }
        update_display = 1;
    }
}

/**
 * Callback for RTC_IRQHandler()
 */
void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc) {
    seconds++;
    if (seconds > 59) {
        seconds = 0;
        minutes++;
        if (minutes > 99) {
            minutes = 0;
            seconds = 0;
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

