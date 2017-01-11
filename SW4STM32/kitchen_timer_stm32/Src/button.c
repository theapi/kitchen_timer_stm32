/*
 * @file kt.c
 *
 */

#include "button.h"
#include "eeprom.h"
#include "kt.h"

Button_TypeDef button;

void Button_Init(void) {
    button.state = BUTT_NONE;
    button.flag = 0;
    button.down = 0;
}

/**
 * Handles the interrupts which occur on button press.
 * Called by HAL_GPIO_EXTI_Callback().
 */
void Button_IRQHandler(uint16_t GPIO_Pin){
    kt.idle_time = 0;
    if (HAL_GPIO_ReadPin(GPIOB, GPIO_Pin) == 0x01) {
        /* Rising edge, button pushed */
        if (GPIO_Pin == GPIO_PIN_4) {
            button.state = BUTT_M_DOWN;
        } else if (GPIO_Pin == GPIO_PIN_5) {
            button.state = BUTT_S_DOWN;
        } else if (GPIO_Pin == GPIO_PIN_6) {
            button.state = BUTT_STSP_DOWN;
        }
    }
    else {
        /* Falling edge, button released */
        if (GPIO_Pin == GPIO_PIN_4) {
            button.state = BUTT_M_UP;
        } else if (GPIO_Pin == GPIO_PIN_5) {
            button.state = BUTT_S_UP;
        } else if (GPIO_Pin == GPIO_PIN_6) {
            button.state = BUTT_STSP_UP;
        }
    }
}

/**
 * Buttons are read as interrupts so the system can sleep most of the time.
 */
void Button_StateMachineRun(void) {
    switch (button.state) {
    case BUTT_M_DOWN:
        /* Check for Both M & S being pressed */
        if (button.flag & BUTTON_S) {
            button.state = BUTT_MS;
            button.down = 1; /* prevent sleep so next state happens quickly */
        } else {
            /* Update time once per press */
            if (!(button.flag & BUTTON_M)) {
                /* Start a timer to see if it's a long press */
                button.down = HAL_GetTick();
                /* Set this button's flag */
                button.flag |= BUTTON_M;
                KT_IncreaseTime();
            } else {
                /* Check for long press, sleep is disabled during the button press. */
                if ((HAL_GetTick() - button.down) > LONG_PRESS) {
                    KT_IncreaseTime();
                    button.down = HAL_GetTick();
                }
            }
        }
        break;
    case BUTT_M_UP:
        /* Unset this button's flag */
        button.flag &= ~(BUTTON_M);
        /* Reset the button timer */
        button.down = 0x00U;
        button.state = BUTT_NONE;
        break;
    case BUTT_S_DOWN:
        /* Check for Both M & S being pressed */
        if (button.flag & BUTTON_M) {
            button.state = BUTT_MS;
            button.down = 1; /* prevent sleep so next state happens quickly */
        } else {
            /* Update time once per press */
            if (!(button.flag & BUTTON_S)) {
                /* Start a timer to see if it's a long press */
                button.down = HAL_GetTick();
                /* Set this button's flag */
                button.flag |= BUTTON_S;
                KT_DecreaseTime();
            } else {
                /* Check for long press, sleep is disabled during the button press. */
                if ((HAL_GetTick() - button.down) > LONG_PRESS) {
                    KT_DecreaseTime();
                    button.down = HAL_GetTick();
                }
            }
        }
        break;
    case BUTT_S_UP:
        /* Unset this button's flag */
        button.flag &= ~(BUTTON_S);
        /* Reset the button timer */
        button.down = 0x00U;
        button.state = BUTT_NONE;
        break;
    case BUTT_MS:
        /* Reset time */
        kt.state = KT_STATE_RESET;
        button.state = BUTT_NONE;
        break;
    case BUTT_STSP_DOWN:
        if (kt.state == KT_STATE_SETUP || kt.state == KT_STATE_STOPPED) {
            /* Time setting mode || stopped so start pressed */
            kt.state = KT_STATE_COUNTDOWN;
            /* Store this value for retrieval after shutdown */
            if (EEPROM_ByteRead(EEPROM_ADDRESS) != kt.minutes) {
                EEPROM_ByteWrite(EEPROM_ADDRESS, kt.minutes);
            }
        } else if (kt.state == KT_STATE_COUNTDOWN) {
            /* Counting down so stop pressed */
            kt.state = KT_STATE_STOPPED;
        } else if (alarm_duration_timer > 0) {
            /* If alarm is on, stop it */
            kt.state = KT_STATE_ALARM_STOP;
        }
        kt.update = 1;
        button.state = BUTT_NONE;
        break;
    default:
        break;
    }
}
