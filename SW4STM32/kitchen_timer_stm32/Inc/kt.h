/**
 * @file kt.h
 *
 */

#ifndef __kt_H
#define __kt_H
#ifdef __cplusplus
 extern "C" {
#endif

#include "stm32l0xx_hal.h"
#include "main.h"
#include "stdint.h"

extern volatile enum main_states state;

void KT_Init();
void KT_IncreaseTime(void);
void KT_DecreaseTime(void);
void KT_IdleTimeout(void);
void KT_IdleTimeout(void);
void KT_RTCEx_WakeUpTimerEventCallback(void);

/**
  * @brief KT
  */
typedef struct
{
    uint8_t minutes;
    uint8_t seconds;
    uint8_t ampm;
    uint8_t update;
    uint32_t idle_time;
} KT_TypeDef;

extern KT_TypeDef kt;

#ifdef __cplusplus
}
#endif
#endif /*__kt_H */

