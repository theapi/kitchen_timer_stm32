/**
 * @file LCD.c
 * Description: This file provides code for the configuration
 *    of the LCD instances.
 */

#include "lcd.h"
#include "gpio.h"

LCD_HandleTypeDef hlcd;

/* LCD init function 64Hz */
void MX_LCD_Init(void) {

    hlcd.Instance = LCD;
    hlcd.Init.Prescaler = LCD_PRESCALER_4;
    hlcd.Init.Divider = LCD_DIVIDER_16;
    hlcd.Init.Duty = LCD_DUTY_1_4;
    hlcd.Init.Bias = LCD_BIAS_1_4;
    hlcd.Init.VoltageSource = LCD_VOLTAGESOURCE_INTERNAL;
    hlcd.Init.Contrast = LCD_CONTRASTLEVEL_7;
    hlcd.Init.DeadTime = LCD_DEADTIME_1;
    hlcd.Init.PulseOnDuration = LCD_PULSEONDURATION_1;
    hlcd.Init.HighDrive = LCD_HIGHDRIVE_1;
    hlcd.Init.BlinkMode = LCD_BLINKMODE_OFF;
    hlcd.Init.BlinkFrequency = LCD_BLINKFREQUENCY_DIV8;
    hlcd.Init.MuxSegment = LCD_MUXSEGMENT_DISABLE;
    if (HAL_LCD_Init(&hlcd) != HAL_OK) {
        Error_Handler();
    }

    /**Enable the High Driver 
     */
    __HAL_LCD_HIGHDRIVER_ENABLE(&hlcd);

}

void HAL_LCD_MspInit(LCD_HandleTypeDef* lcdHandle) {

    GPIO_InitTypeDef GPIO_InitStruct;
    if (lcdHandle->Instance == LCD) {
        /* USER CODE BEGIN LCD_MspInit 0 */

        /* USER CODE END LCD_MspInit 0 */
        /* Peripheral clock enable */
        __HAL_RCC_LCD_CLK_ENABLE();

        /**LCD GPIO Configuration
         PA1     ------> LCD_SEG0
         PA2     ------> LCD_SEG1
         PA3     ------> LCD_SEG2
         PA6     ------> LCD_SEG3
         PA7     ------> LCD_SEG4
         PB0     ------> LCD_SEG5
         PB1     ------> LCD_SEG6
         PA8     ------> LCD_COM0
         PA9     ------> LCD_COM1
         PA10     ------> LCD_COM2
         PB3     ------> LCD_SEG7
         PB9     ------> LCD_COM3
         */
        GPIO_InitStruct.Pin = GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6
                | GPIO_PIN_7 | GPIO_PIN_8 | GPIO_PIN_9 | GPIO_PIN_10;
        GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        GPIO_InitStruct.Alternate = GPIO_AF1_LCD;
        HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

        GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_3 | GPIO_PIN_9;
        GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        GPIO_InitStruct.Alternate = GPIO_AF1_LCD;
        HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

        /* USER CODE BEGIN LCD_MspInit 1 */

        /* USER CODE END LCD_MspInit 1 */
    }
}

void HAL_LCD_MspDeInit(LCD_HandleTypeDef* lcdHandle) {

    if (lcdHandle->Instance == LCD) {
        /* USER CODE BEGIN LCD_MspDeInit 0 */

        /* USER CODE END LCD_MspDeInit 0 */
        /* Peripheral clock disable */
        __HAL_RCC_LCD_CLK_DISABLE();

        /**LCD GPIO Configuration
         PA1     ------> LCD_SEG0
         PA2     ------> LCD_SEG1
         PA3     ------> LCD_SEG2
         PA6     ------> LCD_SEG3
         PA7     ------> LCD_SEG4
         PB0     ------> LCD_SEG5
         PB1     ------> LCD_SEG6
         PA8     ------> LCD_COM0
         PA9     ------> LCD_COM1
         PA10     ------> LCD_COM2
         PB3     ------> LCD_SEG7
         PB9     ------> LCD_COM3
         */
        HAL_GPIO_DeInit(GPIOA,
                GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_7
                        | GPIO_PIN_8 | GPIO_PIN_9 | GPIO_PIN_10);

        HAL_GPIO_DeInit(GPIOB,
                GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_3 | GPIO_PIN_9);

    }

}

