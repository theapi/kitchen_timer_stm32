/**
 * @file eeprom.h
 *
 */

#ifndef __eeprom_H
#define __eeprom_H
#ifdef __cplusplus
 extern "C" {
#endif

#include "stm32l0xx_hal.h"
#include "main.h"
#include "stdint.h"

HAL_StatusTypeDef EEPROM_byte_write(uint32_t address, uint8_t data);
uint8_t EEPROM_byte_read(uint32_t address);


#ifdef __cplusplus
}
#endif
#endif /*__eeprom_H */

