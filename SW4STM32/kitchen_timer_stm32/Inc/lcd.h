/**
 * @fileLCD.h
 * Description: This file provides code for the configuration
 *    of the LCD instances.
 */

#ifndef __lcd_H
#define __lcd_H
#ifdef __cplusplus
extern "C" {
#endif

#include "stm32l0xx_hal.h"
#include "main.h"

extern LCD_HandleTypeDef hlcd;
extern void Error_Handler(void);

void MX_LCD_Init(void);

#ifdef __cplusplus
}
#endif
#endif /*__ lcd_H */
