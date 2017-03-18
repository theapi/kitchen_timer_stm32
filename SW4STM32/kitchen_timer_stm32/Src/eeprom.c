/*
 * @file eeprom.c
 *
 */

#include "eeprom.h"

/**
 * Loads the specified data.
 */
uint32_t EEPROM_DataLoad(uint8_t id) {
    uint32_t data_address = EEPROM_GetDataAddress(id);
    uint32_t word = EEPROM_WordRead(data_address);

    return word;
}

/**
 * @brief Saves a byte with flash wear protection.
 * @note The date is saved with a counter to a different location each time.
 * The location is determined by the saved counter.
 */
HAL_StatusTypeDef EEPROM_DataSave(uint8_t id, uint32_t data) {
    HAL_StatusTypeDef status;
    uint32_t data_address = EEPROM_GetDataAddress(id);
    /* Save both the counter & the data */
    status = EEPROM_WordWrite(data_address, data);

    return status;
}

/**
 * The current data address for the given id.
 */
uint32_t EEPROM_GetDataAddress(uint8_t id) {
    uint32_t address = 0; // HARD CODED.
    return address;
}

/**
 * Write to the EEPROM (well flash actually, EEPROM is emulated in STM32).
 */
HAL_StatusTypeDef EEPROM_WordWrite(uint32_t address, uint32_t data) {
    HAL_StatusTypeDef  status;
    /* Data EEPROM address see reference manual 3.3.1 addresses: 0x0808 0000 - 0x0808 07FF */
    address = address + 0x08080000;
    /* Unprotect the EEPROM to allow writing */
    HAL_FLASHEx_DATAEEPROM_Unlock();
    /* Write the data */
    status = HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_WORD, address, data);
    /* Reprotect the EEPROM */
    HAL_FLASHEx_DATAEEPROM_Lock();
    return status;
}

/**
 * Read a byte from an address in the "EEPROM"
 */
uint32_t EEPROM_WordRead(uint32_t address) {
    uint8_t tmp = 0;
    address = address + 0x08080000;
    tmp = *(__IO uint32_t*)address;

    return tmp;
}
