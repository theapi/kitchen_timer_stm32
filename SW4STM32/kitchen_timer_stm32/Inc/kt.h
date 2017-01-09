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

extern RTC_HandleTypeDef hrtc;

//extern volatile enum main_states state;
extern volatile enum button_states button_state;

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
    uint32_t button_down;
    enum button_flags button_flag;
} KT_TypeDef;

extern KT_TypeDef kt;

typedef enum {
    KT_STATE_INIT,
    KT_STATE_RESET,
    KT_STATE_OFF,
    KT_STATE_SETUP,
    KT_STATE_COUNTDOWN,
    KT_STATE_STOPPED,
    KT_STATE_ALARM_START,
    KT_STATE_ALARM_ON_HIGH,
    KT_STATE_ALARM_ON_LOW,
    KT_STATE_ALARM_STOP,
} KT_StateTypeDef;
extern KT_StateTypeDef state;

void KT_Init();
void KT_IncreaseTime(void);
void KT_DecreaseTime(void);
void KT_IdleTimeout(void);
void KT_IdleTimeout(void);
void KT_RTCEx_WakeUpTimerEventCallback(void);

/* State functions */
KT_StateTypeDef KT_StateInit(KT_StateTypeDef state);
KT_StateTypeDef KT_StateReset(KT_StateTypeDef state);
KT_StateTypeDef KT_StateOff(KT_StateTypeDef state);
KT_StateTypeDef KT_StateSetup(KT_StateTypeDef state);
KT_StateTypeDef KT_StateCountdown(KT_StateTypeDef state);
KT_StateTypeDef KT_StateStopped(KT_StateTypeDef state);
KT_StateTypeDef KT_StateAlarmStart(KT_StateTypeDef state);
KT_StateTypeDef KT_StateAlarmOnHigh(KT_StateTypeDef state);
KT_StateTypeDef KT_StateAlarmOnLow(KT_StateTypeDef state);
KT_StateTypeDef KT_StateAlarmStop(KT_StateTypeDef state);

#ifdef __cplusplus
}
#endif
#endif /*__kt_H */

