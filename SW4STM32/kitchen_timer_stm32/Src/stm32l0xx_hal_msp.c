/**
 * @file stm32l0xx_hal_msp.c
 * Description : This file provides code for the MSP Initialization
 *     and de-Initialization codes.
 */

#include "stm32l0xx_hal.h"

/**
 * Initializes the Global MSP.
 */
void HAL_MspInit(void) {

    __HAL_RCC_SYSCFG_CLK_ENABLE();
    __HAL_RCC_PWR_CLK_ENABLE();

    /* System interrupt init*/
    /* SVC_IRQn interrupt configuration */
    HAL_NVIC_SetPriority(SVC_IRQn, 0, 0);
    /* PendSV_IRQn interrupt configuration */
    HAL_NVIC_SetPriority(PendSV_IRQn, 0, 0);
    /* SysTick_IRQn interrupt configuration */
    HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);

}

