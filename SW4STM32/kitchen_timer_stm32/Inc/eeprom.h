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

#define NUM_DATA_IDS 2

/**
  * @brief EEPROM
  */
typedef struct
{
    /**
     * The counter for each data id that can be saved.
     * (actually only saving one data id (minutes), but imagine there are others)
     * NB: only 24 bits of the 32 bit counter will be usable.
     * 8 bits will be used for the byte of data being stored
     */
    uint32_t counters[NUM_DATA_IDS];
} EEPROM_TypeDef;

/**
 * Initialize all the counters.
 */
void EEPROM_init(void);

uint32_t EEPROM_GetCounterFromWord(uint32_t word);
uint8_t EEPROM_GetDataFromWord(uint32_t word);

/**
 * @brief Saves a byte with flash wear protection.
 * @note The date is saved with a counter to a different location each time.
 * The location is determined by the saved counter.
 */
HAL_StatusTypeDef EEPROM_DataSave(uint8_t id, uint8_t data);

/**
 * The current read address for the given id.
 */
uint32_t EEPROM_GetDataReadAddress(uint8_t id);

/**
 * The next write address for the given id.
 */
uint32_t EEPROM_GetDataWriteAddress(uint8_t id);

/**
 * Loads the specified data.
 */
uint8_t EEPROM_DataLoad(uint8_t id);

HAL_StatusTypeDef EEPROM_ByteWrite(uint32_t address, uint8_t data);
uint8_t EEPROM_ByteRead(uint32_t address);

HAL_StatusTypeDef EEPROM_WordWrite(uint32_t address, uint32_t data);
uint32_t EEPROM_WordRead(uint32_t address);

#ifdef __cplusplus
}
#endif
#endif /*__eeprom_H */

