/**
 * @file TIM.h
 */

#ifndef __tim_H
#define __tim_H
#ifdef __cplusplus
extern "C" {
#endif

#include "stm32l0xx_hal.h"
#include "main.h"

extern TIM_HandleTypeDef htim2;

extern void Error_Handler(void);

void MX_TIM2_Init(void);

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

#ifdef __cplusplus
}
#endif
#endif /*__ tim_H */

