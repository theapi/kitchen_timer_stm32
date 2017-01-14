/*
 * @file eeprom.c
 *
 * Address can be one of 15 ( a 4 bit number) addresses.
 * So the data gets saved in 15 different locations,
 * meaning 15 times the normal wear, 150,000 saves instead of 10,000.
 * 1 save a day ~= 411 years
 * 10 saves a day _= 41 years
 * 100 saves a day _= 4 years
 * Should be enough :)
 *
 * So with this each data needs 15 words
 * Flash Data EEPROM can hold 2 Kbytes
 *
 * The way it works:
 * - Each save, add 1 to the counter.
 * - Use the address of (id * (16*4)) + (least significant 4 bits of the counter * 4).
 *
 * eg.
 * - First save of data id 0:
 *  id = 0, counter = 0, address = 0 + 0b0000 = 0 + (0 * 4) = 0
 * - Second save:
 *  id = 0, counter = 1, address = 0 + 0b0001 = 0 + (1 * 4) = 4
 * - 15th save:
 *  id = 0, counter = 15, address = 0 + 0b1111 = 0 + (15 * 4) = 60
 * - 123456th save:
 * id = 0, counter = 123456, address = 0 + 0b0000 = 0 + (0 * 4) = 0
 * - 856473564th save:
 * id = 0, counter = 856473564, address = 0 + 0b1100 = 0 + (12 * 4) = 48
 *
 * - First save of data id 1:
 *  id = 1, counter = 0, address = (1 * 64) + 0b0000 = 64 + (0 * 4) = 64
 * - Second save:
 *  id = 1, counter = 1, address = (1 * 64) + 0b0001 = 64 + (1 * 4) = 68
 * - 15th save:
 *  id = 1, counter = 15, address = (1 * 64) + 0b1111 = 64 + (15 * 4) = 60
 * - 123456th save:
 *  id = 1, counter = 123456, address = (1 * 64) + 0b0000 = 64 + (0 * 4) = 64
 * - 856473564th save:
 *  id = 0, counter = 856473564, address = (1 * 64) + 0b1100 = 64 + (12 * 4) = 112
 *
 *  - First save of data id 2:
 *  id = 2, counter = 0, address = (2 * 64) + 0b0000 = 128 + (0 * 4) = 128
 */

#include "eeprom.h"

EEPROM_TypeDef eeprom;

/**
 * Initialize all the counters.
 *
 * NOPE always gets optimised out :(
 */
void EEPROM_init(void) {
    uint8_t tmp = 0;
    uint32_t address = 0;
    uint32_t word = 0;
    uint32_t count = 0;

    for (uint8_t id = 0; id < NUM_DATA_IDS; id++) {
        count = eeprom.counters[id];
        /* Check each possible address for the data id */
        for (uint8_t j = 0; j < 16; j++) {
            address = (id * 64) + (j * 4);
            word = EEPROM_WordRead(address);
            tmp = EEPROM_GetCounterFromWord(word);
            if (tmp > count) {
                eeprom.counters[id] = tmp;
            }
        }
    }

}

/**
 * @brief Saves a byte with flash wear protection.
 * @note The date is saved with a counter to a different location each time.
 * The location is determined by the saved counter.
 */
HAL_StatusTypeDef EEPROM_DataSave(uint8_t id, uint8_t data) {
    uint32_t address;
    uint32_t word;

    address = EEPROM_GetDataWriteAddress(id);
    /* Update the counter for this id */
    ++eeprom.counters[id];

    /* Join the counter & the data into the word */
    word = (eeprom.counters[id] << 4) | data;
    return EEPROM_WordWrite(address, word);
}

/**
 * Loads the specified data.
 */
uint8_t EEPROM_DataLoad(uint8_t id) {
    uint32_t address = EEPROM_GetDataReadAddress(id);
    uint32_t word = EEPROM_WordRead(address);
    eeprom.debug = EEPROM_GetDataFromWord(word);
    eeprom.counters[id] = EEPROM_GetCounterFromWord(word);
    return EEPROM_GetDataFromWord(word);
}

uint32_t EEPROM_GetCounterFromWord(uint32_t word) {
    /* Counter is the word, with the least significant 8 bits removed */
    return (word >> 4);
}

uint8_t EEPROM_GetDataFromWord(uint32_t word) {
    /* Data is the least significant 8 bits */
    return (0x0F & word);
}

/**
 * The current read address for the given id.
 */
uint32_t EEPROM_GetDataReadAddress(uint8_t id) {
    /* Use the address of (id * (16*4)) + (least significant 4 bits of the counter * 4) */
    uint32_t address = id * 64;
    uint32_t counter = eeprom.counters[id];
    return address + ((0x0000000F & counter) * 4);
}

/**
 * The next write address for the given id.
 */
uint32_t EEPROM_GetDataWriteAddress(uint8_t id) {
    /* Use the address of (id * (16*4)) + (least significant 4 bits of the counter * 4) */
    uint32_t address = id * 64;
    uint32_t counter = eeprom.counters[id] + 1;
    return address + ((0x0000000F & counter) * 4);
}

/**
 * Write to the EEPROM (well flash actually, EEPROM is emulated in STM32).
 */
HAL_StatusTypeDef EEPROM_ByteWrite(uint32_t address, uint8_t data) {
    HAL_StatusTypeDef  status;
    /* Data EEPROM address see reference manual 3.3.1 addresses: 0x0808 0000 - 0x0808 07FF */
    address = address + 0x08080000;

    if (address > 0x080807FF) {
        /* Don't try to write outside of the Data EEPROM memory */
        return HAL_ERROR;
    }

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
uint8_t EEPROM_ByteRead(uint32_t address) {
    uint8_t tmp = 0;
    address = address + 0x08080000;
    tmp = *(__IO uint32_t*)address;

    return tmp;
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
