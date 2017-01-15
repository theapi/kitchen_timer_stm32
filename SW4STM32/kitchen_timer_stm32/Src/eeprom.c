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
 * So with this each data needs 15 words.
 * The counter is kept in the word previous to the data word, so that's another 15 words.
 * In total the data with it's counter needs 30 words.
 * 30 words for 1 word, we only save a byte, so 30 words for 1 byte!!!
 *
 * EEPROM memory is then:
 * counter | data | counter | data etc...
 *
 * Flash Data EEPROM can hold 2 Kbytes
 *
 * The way it works:
 * - Each save, add 1 to the counter.
 * - Use the counter_address of (id * (32*4)) + (least significant 4 bits of the counter * 8).
 * then the data address is counter_address + 4
 *
 * eg.
 * - First save of data id 0:
 *  id = 0, counter = 0, address = 0 + 0b0000 = 0 + (0 * 8) = 0
 * - Second save:
 *  id = 0, counter = 1, address = 0 + 0b0001 = 0 + (1 * 8) = 8
 * - 15th save:
 *  id = 0, counter = 15, address = 0 + 0b1111 = 0 + (15 * 8) = 120
 * - 123456th save:
 * id = 0, counter = 123456, address = 0 + 0b0000 = 0 + (0 * 8) = 0
 * - 856473564th save:
 * id = 0, counter = 856473564, address = 0 + 0b1100 = 0 + (12 * 8) = 96
 *
 * - First save of data id 1:
 *  id = 1, counter = 0, address = (1 * 128) + 0b0000 = 128 + (0 * 8) = 128
 * - Second save:
 *  id = 1, counter = 1, address = (1 * 128) + 0b0001 = 128 + (1 * 8) = 136
 * - 15th save:
 *  id = 1, counter = 15, address = (1 * 128) + 0b1111 = 128 + (15 * 8) = 248
 * - 123456th save:
 *  id = 1, counter = 123456, address = (1 * 128) + 0b0000 = 128 + (0 * 8) = 128
 * - 856473564th save:
 *  id = 0, counter = 856473564, address = (1 * 128) + 0b1100 = 128 + (12 * 8) = 224
 *
 *  - First save of data id 2:
 *  id = 2, counter = 0, address = (2 * 128) + 0b0000 = 128 + (0 * 4) = 256
 */

#include "eeprom.h"

EEPROM_TypeDef eeprom;

/**
 * Initialize all the counters.
 */
void EEPROM_init(void) {
    uint32_t address = 0;
    uint32_t counter = 0;

    for (uint8_t id = 0; id < NUM_DATA_IDS; id++) {
        /* Check each possible address for the data id */
        address = (id * 128);
        for (uint8_t j = 0; j < 16; j++) {
            counter = EEPROM_WordRead(address + (j * 8));
            if (counter > eeprom.counters[id]) {
                eeprom.counters[id] = counter;
            }
        }
    }
}

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
    uint32_t counter_address = EEPROM_GetCounterAddress(id);
    uint32_t data_address = EEPROM_GetDataAddress(id);

    /* Save in the next memory */
    counter_address += 8;
    data_address += 8;

    /* Update the counter for this id */
    ++eeprom.counters[id];
    //eeprom.debug = data;
    /* Save both the counter & the data */
    status = EEPROM_WordWrite(data_address, data);
    status = EEPROM_WordWrite(counter_address, eeprom.counters[id]);
    return status;
}

/**
 * The current counter address for the given id.
 */
uint32_t EEPROM_GetCounterAddress(uint8_t id) {
    /* Counter_address of (id * (32*4)) + (least significant 4 bits of the counter * 8) */
    uint32_t address = id * 128;
    uint32_t counter = eeprom.counters[id];
    return address + ((0x0000000F & counter) * 8);
}

/**
 * The current data address for the given id.
 */
uint32_t EEPROM_GetDataAddress(uint8_t id) {
    /* The data address is counter_address + 4 */
    uint32_t address = EEPROM_GetCounterAddress(id);
    return address + 4;
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
