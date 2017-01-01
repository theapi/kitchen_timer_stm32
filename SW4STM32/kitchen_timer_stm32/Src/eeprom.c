/*
 * @file eeprom.c
 *
 */

#include "eeprom.h"

/**
 * Write to the EEPROM (well flash actually, EEPROM is emulated in STM32).
 */
HAL_StatusTypeDef EEPROM_byte_write(uint32_t address, uint8_t data) {
    HAL_StatusTypeDef  status;
    /* Data EEPROM address see reference manual 3.3.1 addresses: 0x0808 0000 - 0x0808 07FF */
    address = address + 0x08080000;
    /* Unprotect the EEPROM to allow writing */
    HAL_FLASHEx_DATAEEPROM_Unlock();
    /* Write the data */
    status = HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_BYTE, address, data);
    /* Reprotect the EEPROM */
    HAL_FLASHEx_DATAEEPROM_Lock();
    return status;
}

/**
 * Read a byte from an address in the "EEPROM"
 */
uint8_t EEPROM_byte_read(uint32_t address) {
    uint8_t tmp = 0;
    address = address + 0x08080000;
    tmp = *(__IO uint32_t*)address;

    return tmp;
}
