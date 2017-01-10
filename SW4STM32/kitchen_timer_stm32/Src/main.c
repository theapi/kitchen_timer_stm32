/**
 * @file main.c
 *
 * Functional description:
 *  - After power on, LCD will display 00:00
 *  - After 2 minutes of no action, it turns off the display
 *  - Minutes are increased by pressing the "M" button.
 *  - Minutes are decreased by pressing the "S" button.
 *  - The timer will reset to 00:00 if "M" & "S"
 *  are pressed simultaneously
 *  - After the time has been set, the "ST/SP" button will start the timer
 *  ...
 */

#include "main.h"
#include "stm32l0xx_hal.h"
#include "lcd.h"
#include "rtc.h"
#include "gpio.h"
#include "tim.h"
#include "system_clock_conf.h"
#include "eeprom.h"
#include "screen.h"
#include "kt.h"
#include "button.h"


volatile uint32_t alarm_duration_timer = 0x00U;
volatile uint32_t alarm_pulse_timer = 0x00U;


int main(void) {
    /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialize all configured peripherals */
    MX_GPIO_Init();
    MX_LCD_Init();
    MX_RTC_Init();
    MX_TIM2_Init();

    /* Enable Ultra low power mode */
    HAL_PWREx_EnableUltraLowPower();
    HAL_PWR_EnableWakeUpPin(PWR_WAKEUP_PIN1);


    while (1) {

        /* Handle the buttons. */
        Button_StateMachineRun();

        /* Main kitchen timer state machine */
        KT_StateMachineRun();

        Screen_Process(&hlcd, &kt);

        ///@todo check for & handle a button interrupt before sleeping

        if (kt.state != KT_STATE_OFF && (button.down == 0) && (alarm_duration_timer == 0)) {
            //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);

            /* Disable the systick interrupt to not wake up every millisecond */
            /* WHY though?? Stop mode should be stopping the MSI clock */
            HAL_SuspendTick();
//            SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
//                       SysTick_CTRL_ENABLE_Msk;

            /* Enter Stop Mode */
            __HAL_RCC_WAKEUPSTOP_CLK_CONFIG(RCC_STOP_WAKEUPCLOCK_MSI);
            __HAL_PWR_CLEAR_FLAG(PWR_FLAG_WU);
            HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);

            /* Enable the systick interrupt */
//            SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
//                       SysTick_CTRL_TICKINT_Msk   |
//                       SysTick_CTRL_ENABLE_Msk;
            HAL_ResumeTick();

            //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
       }



    }
}

/**
 * Callback for HAL_GPIO_EXTI_IRQHandler() in EXTI4_15_IRQHandler().
 *
 * Handles the interrupts which occur on button press.
 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
    Button_IRQHandler(GPIO_Pin);
}

/**
 * Callback for RTC_IRQHandler()
 */
void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc) {
    KT_RTCEx_WakeUpTimerEventCallback();
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
void Error_Handler(void) {
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
    while (1) {
    }
}

