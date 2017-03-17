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


/**
 * @brief Saves a uint32_t with flash wear protection.
 * @note The date is saved with a counter to a different location each time.
 * The location is determined by the saved counter.
 */
HAL_StatusTypeDef EEPROM_DataSave(uint8_t id, uint32_t data);

/**
 * The current data address for the given id.
 */
uint32_t EEPROM_GetDataAddress(uint8_t id);

/**
 * Loads the specified data.
 */
uint32_t EEPROM_DataLoad(uint8_t id);

HAL_StatusTypeDef EEPROM_WordWrite(uint32_t address, uint32_t data);
uint32_t EEPROM_WordRead(uint32_t address);

#ifdef __cplusplus
}
#endif
#endif /*__eeprom_H */

