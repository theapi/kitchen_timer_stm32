/**
 * @file    system_clock_conf.h
 * @brief   system clock configuration file.
 */

#ifndef __SYSTEM_CLOCK_CONF_H
#define __SYSTEM_CLOCK_CONF_H

#ifdef __cplusplus
 extern "C" {
#endif

#include "stm32l0xx_hal.h"
#include "main.h"

extern void Error_Handler(void);

    /**
     * System Clock Configuration
     */
    void SystemClock_Config(void);

#ifdef __cplusplus
}
#endif
#endif /* __SYSTEM_CLOCK_CONF_H */
