/**
 * @file RTC.c
 */

#include "rtc.h"

RTC_HandleTypeDef hrtc;

/* RTC init function */
void MX_RTC_Init(void) {
    RTC_TimeTypeDef sTime;
    RTC_DateTypeDef sDate;

    /**Initialize RTC Only 
     */
    hrtc.Instance = RTC;
    hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
    hrtc.Init.AsynchPrediv = 127;
    hrtc.Init.SynchPrediv = 255;
    hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
    hrtc.Init.OutPutRemap = RTC_OUTPUT_REMAP_NONE;
    hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
    hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
    if (HAL_RTC_Init(&hrtc) != HAL_OK) {
        Error_Handler();
    }

    /**Initialize RTC and set the Time and Date 
     */
    sTime.Hours = 0x0;
    sTime.Minutes = 0x0;
    sTime.Seconds = 0x0;
    sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
    sTime.StoreOperation = RTC_STOREOPERATION_RESET;
    if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK) {
        Error_Handler();
    }

    sDate.WeekDay = RTC_WEEKDAY_MONDAY;
    sDate.Month = RTC_MONTH_JANUARY;
    sDate.Date = 0x1;
    sDate.Year = 0x0;

    if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK) {
        Error_Handler();
    }

    /**Enable the WakeUp 
     */
    if (HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, 0, RTC_WAKEUPCLOCK_CK_SPRE_16BITS)
            != HAL_OK) {
        Error_Handler();
    }

}

void HAL_RTC_MspInit(RTC_HandleTypeDef* rtcHandle) {

    if (rtcHandle->Instance == RTC) {

        /* Peripheral clock enable */
        __HAL_RCC_RTC_ENABLE();

        /* Peripheral interrupt init */
        HAL_NVIC_SetPriority(RTC_IRQn, 0, 0);
        HAL_NVIC_EnableIRQ(RTC_IRQn);

    }
}

void HAL_RTC_MspDeInit(RTC_HandleTypeDef* rtcHandle) {

    if (rtcHandle->Instance == RTC) {

        /* Peripheral clock disable */
        __HAL_RCC_RTC_DISABLE();

        /* Peripheral interrupt Deinit*/
        HAL_NVIC_DisableIRQ(RTC_IRQn);

    }

}
