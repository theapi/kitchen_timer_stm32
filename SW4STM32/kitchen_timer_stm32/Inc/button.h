/**
 * @file button.h
 *
 */

#ifndef __button_H
#define __button_H
#ifdef __cplusplus
 extern "C" {
#endif

#include "stm32l0xx_hal.h"
#include "main.h"
#include "stdint.h"

enum button_flags {
    BUTTON_M    = 1,
    BUTTON_S    = 2,
    BUTTON_STSP = 4,
};

typedef enum {
    BUTT_NONE,
    BUTT_M_DOWN,
    BUTT_S_DOWN,
    BUTT_MS,
    BUTT_STSP_DOWN,
    BUTT_M_UP,
    BUTT_S_UP,
    BUTT_STSP_UP,
} Button_StateTypeDef;

/**
  * @brief Button
  */
typedef struct
{
    uint32_t down;              /* Time since last time update */
    enum button_flags flag;     /* Register of all the button positions */
    Button_StateTypeDef state;  /* Current state of the button state machine */
    uint32_t long_press;        /* How many milliseconds until a press is considered long */
    uint32_t press_time;        /* When the button was pressed */
} Button_TypeDef;


extern Button_TypeDef button;
extern volatile uint32_t alarm_duration_timer;


void Button_Init(void);
void Button_StateMachineRun(void);
void Button_IRQHandler(uint16_t GPIO_Pin);

#ifdef __cplusplus
}
#endif
#endif /*__button_H */

