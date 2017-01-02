EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:lcd_kitchen_timer
LIBS:stm32l053c-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Kitchen Timer"
Date ""
Rev "v1.0"
Comp "theapi"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Earth #PWR01
U 1 1 58021BE1
P 4900 7200
F 0 "#PWR01" H 4900 6950 50  0001 C CNN
F 1 "Earth" H 4900 7050 50  0001 C CNN
F 2 "" H 4900 7200 50  0000 C CNN
F 3 "" H 4900 7200 50  0000 C CNN
	1    4900 7200
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR02
U 1 1 58021C2A
P 4900 6900
F 0 "#PWR02" H 4900 6750 50  0001 C CNN
F 1 "VDD" H 4900 7050 50  0000 C CNN
F 2 "" H 4900 6900 50  0000 C CNN
F 3 "" H 4900 6900 50  0000 C CNN
	1    4900 6900
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 58021E64
P 4900 7050
F 0 "C1" H 4925 7150 50  0000 L CNN
F 1 "100nF" H 4925 6950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4938 6900 50  0001 C CNN
F 3 "" H 4900 7050 50  0000 C CNN
	1    4900 7050
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR03
U 1 1 58021F75
P 5100 6300
F 0 "#PWR03" H 5100 6050 50  0001 C CNN
F 1 "GNDA" H 5100 6150 50  0000 C CNN
F 2 "" H 5100 6300 50  0000 C CNN
F 3 "" H 5100 6300 50  0000 C CNN
	1    5100 6300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR04
U 1 1 58021F89
P 5600 6300
F 0 "#PWR04" H 5600 6050 50  0001 C CNN
F 1 "Earth" H 5600 6150 50  0001 C CNN
F 2 "" H 5600 6300 50  0000 C CNN
F 3 "" H 5600 6300 50  0000 C CNN
	1    5600 6300
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR05
U 1 1 58022154
P 5150 5800
F 0 "#PWR05" H 5150 5550 50  0001 C CNN
F 1 "GNDA" H 5150 5650 50  0000 C CNN
F 2 "" H 5150 5800 50  0000 C CNN
F 3 "" H 5150 5800 50  0000 C CNN
	1    5150 5800
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR06
U 1 1 580221FA
P 5650 5800
F 0 "#PWR06" H 5650 5550 50  0001 C CNN
F 1 "Earth" H 5650 5650 50  0001 C CNN
F 2 "" H 5650 5800 50  0000 C CNN
F 3 "" H 5650 5800 50  0000 C CNN
	1    5650 5800
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR07
U 1 1 5802295B
P 5450 1050
F 0 "#PWR07" H 5450 900 50  0001 C CNN
F 1 "VDD" H 5450 1200 50  0000 C CNN
F 2 "" H 5450 1050 50  0000 C CNN
F 3 "" H 5450 1050 50  0000 C CNN
	1    5450 1050
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58032557
P 4950 1750
F 0 "C4" V 5100 1700 50  0000 L CNN
F 1 "100nF" V 4800 1650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4988 1600 50  0001 C CNN
F 3 "" H 4950 1750 50  0000 C CNN
	1    4950 1750
	0    -1   -1   0   
$EndComp
$Comp
L Earth #PWR08
U 1 1 5803310F
P 4800 1800
F 0 "#PWR08" H 4800 1550 50  0001 C CNN
F 1 "Earth" H 4800 1650 50  0001 C CNN
F 2 "" H 4800 1800 50  0000 C CNN
F 3 "" H 4800 1800 50  0000 C CNN
	1    4800 1800
	1    0    0    -1  
$EndComp
Text GLabel 4050 3700 0    60   Input ~ 0
SWCLK
Text GLabel 4050 3600 0    60   Input ~ 0
SWDIO
Text GLabel 6550 5000 2    60   Input ~ 0
NRST
$Comp
L CONN_01X05 P1
U 1 1 58036840
P 1450 1400
F 0 "P1" H 1450 1750 50  0000 C CNN
F 1 "SWD" V 1550 1400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 1450 1400 50  0001 C CNN
F 3 "" H 1450 1400 50  0000 C CNN
	1    1450 1400
	-1   0    0    -1  
$EndComp
$Comp
L Earth #PWR09
U 1 1 580369A9
P 2150 1400
F 0 "#PWR09" H 2150 1150 50  0001 C CNN
F 1 "Earth" H 2150 1250 50  0001 C CNN
F 2 "" H 2150 1400 50  0000 C CNN
F 3 "" H 2150 1400 50  0000 C CNN
	1    2150 1400
	1    0    0    -1  
$EndComp
Text GLabel 1650 1300 2    60   Input ~ 0
SWCLK
Text GLabel 1650 1500 2    60   Input ~ 0
SWDIO
Text GLabel 1650 1600 2    60   Input ~ 0
NRST
$Comp
L VDD #PWR010
U 1 1 5803734F
P 1650 1200
F 0 "#PWR010" H 1650 1050 50  0001 C CNN
F 1 "VDD" H 1650 1350 50  0000 C CNN
F 2 "" H 1650 1200 50  0000 C CNN
F 3 "" H 1650 1200 50  0000 C CNN
	1    1650 1200
	1    0    0    -1  
$EndComp
Text Label 4050 2400 0    60   ~ 0
LCD_SEG0
Text Label 4050 2500 0    60   ~ 0
LCD_SEG1
Text Label 4050 2600 0    60   ~ 0
LCD_SEG2
Text Label 4050 2900 0    60   ~ 0
LCD_SEG3
Text Label 4050 3000 0    60   ~ 0
LCD_SEG4
Text Label 4050 3100 0    60   ~ 0
LCD_COM0
Text Label 4050 3200 0    60   ~ 0
LCD_COM1
Text Label 4050 3300 0    60   ~ 0
LCD_COM2
Text Label 7100 2300 2    60   ~ 0
LCD_SEG5
Text Label 7100 2400 2    60   ~ 0
LCD_SEG6
Text Label 7100 2700 2    60   ~ 0
BUTTON0
Text Label 7100 2800 2    60   ~ 0
BUTTON1
Text Label 7100 2900 2    60   ~ 0
BUTTON2
Text Label 7100 3200 2    60   ~ 0
LCD_COM3
$Comp
L C C2
U 1 1 5803B990
P 5200 7050
F 0 "C2" H 5225 7150 50  0000 L CNN
F 1 "100nF" H 5225 6950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5238 6900 50  0001 C CNN
F 3 "" H 5200 7050 50  0000 C CNN
	1    5200 7050
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5803BA4A
P 5950 7050
F 0 "C3" H 5975 7150 50  0000 L CNN
F 1 "100nF" H 5975 6950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5988 6900 50  0001 C CNN
F 3 "" H 5950 7050 50  0000 C CNN
	1    5950 7050
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR011
U 1 1 5803BDC8
P 5950 7200
F 0 "#PWR011" H 5950 6950 50  0001 C CNN
F 1 "Earth" H 5950 7050 50  0001 C CNN
F 2 "" H 5950 7200 50  0000 C CNN
F 3 "" H 5950 7200 50  0000 C CNN
	1    5950 7200
	1    0    0    -1  
$EndComp
Text Label 5950 6800 0    60   ~ 0
VDDA
Text Label 5300 2000 1    60   ~ 0
VDDA
Text Label 5200 2000 1    60   ~ 0
VLCD
Text Label 5450 2000 1    60   ~ 0
VDD
Text Label 5900 2000 1    60   ~ 0
VDD_USB
Text Label 5550 2000 1    60   ~ 0
VDD
$Comp
L STM32L053C8_LQFP48 U1
U 1 1 580631B3
P 5450 4100
F 0 "U1" H 6100 6100 60  0000 C CNN
F 1 "STM32L053C8_LQFP48" H 5550 4100 60  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 5250 2200 60  0001 C CNN
F 3 "" H 5250 2200 60  0000 C CNN
	1    5450 4100
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5806575A
P 6550 5250
F 0 "R2" V 6630 5250 50  0000 C CNN
F 1 "10K" V 6550 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6480 5250 50  0001 C CNN
F 3 "" H 6550 5250 50  0000 C CNN
	1    6550 5250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR012
U 1 1 58065816
P 6550 5400
F 0 "#PWR012" H 6550 5150 50  0001 C CNN
F 1 "Earth" H 6550 5250 50  0001 C CNN
F 2 "" H 6550 5400 50  0000 C CNN
F 3 "" H 6550 5400 50  0000 C CNN
	1    6550 5400
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 5806648B
P 3750 5400
F 0 "C7" H 3775 5500 50  0000 L CNN
F 1 "20pF" H 3775 5300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3788 5250 50  0001 C CNN
F 3 "" H 3750 5400 50  0000 C CNN
	1    3750 5400
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 580665CF
P 3450 5400
F 0 "C6" H 3475 5500 50  0000 L CNN
F 1 "20pF" H 3475 5300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3488 5250 50  0001 C CNN
F 3 "" H 3450 5400 50  0000 C CNN
	1    3450 5400
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR013
U 1 1 5806680D
P 3600 5700
F 0 "#PWR013" H 3600 5450 50  0001 C CNN
F 1 "Earth" H 3600 5550 50  0001 C CNN
F 2 "" H 3600 5700 50  0000 C CNN
F 3 "" H 3600 5700 50  0000 C CNN
	1    3600 5700
	1    0    0    -1  
$EndComp
Text Label 7100 2600 2    60   ~ 0
LCD_SEG7
NoConn ~ 4600 5000
NoConn ~ 4600 5100
Text GLabel 3950 2800 0    60   Input ~ 0
PA5
NoConn ~ 6550 2500
NoConn ~ 6550 3000
NoConn ~ 6550 3100
NoConn ~ 6550 3300
NoConn ~ 6550 3500
NoConn ~ 6550 3600
NoConn ~ 6550 3700
NoConn ~ 4600 2700
NoConn ~ 4600 3400
NoConn ~ 4600 3500
NoConn ~ 4600 3800
$Comp
L Crystal Y1
U 1 1 584DF533
P 3600 5050
F 0 "Y1" H 3600 5200 50  0000 C CNN
F 1 "Crystal" H 3600 4900 50  0000 C CNN
F 2 "Crystals:ABM3" H 3600 5050 50  0001 C CNN
F 3 "" H 3600 5050 50  0000 C CNN
	1    3600 5050
	-1   0    0    1   
$EndComp
Text Label 3900 4800 0    60   ~ 0
OSC32_IN
Text Label 3900 4900 0    60   ~ 0
OSC32_OUT
NoConn ~ 4600 4700
Text Label 8700 4650 0    60   ~ 0
LCD_COM0
Text Label 8700 4750 0    60   ~ 0
LCD_COM1
Text Label 8700 4850 0    60   ~ 0
LCD_COM2
Text Label 8700 5150 0    60   ~ 0
LCD_SEG0
Text Label 8700 5250 0    60   ~ 0
LCD_SEG1
Text Label 8700 5350 0    60   ~ 0
LCD_SEG2
Text Label 8700 5450 0    60   ~ 0
LCD_SEG3
Text Label 8700 5550 0    60   ~ 0
LCD_SEG4
Text Label 8700 5650 0    60   ~ 0
LCD_SEG5
Text Label 8700 5750 0    60   ~ 0
LCD_SEG6
Text Label 8700 5850 0    60   ~ 0
LCD_SEG7
Text Label 8700 4950 0    60   ~ 0
LCD_COM3
$Comp
L LCD_KITCHEN_TIMER DS1
U 1 1 584F1C3C
P 9700 5250
F 0 "DS1" V 9700 5500 60  0000 C CNN
F 1 "LCD_KITCHEN_TIMER" H 9700 5350 60  0000 C CNN
F 2 "theapi:ZEBRA-12" H 9700 5250 60  0001 C CNN
F 3 "" H 9700 5250 60  0000 C CNN
	1    9700 5250
	0    1    1    0   
$EndComp
$Comp
L TLV61225 U2
U 1 1 584F21B9
P 2150 6500
F 0 "U2" H 2150 6650 60  0000 C CNN
F 1 "TLV61225" H 2150 5950 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SC-70-6" H 2150 6550 60  0001 C CNN
F 3 "" H 2150 6550 60  0001 C CNN
	1    2150 6500
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 584F2321
P 1400 6550
F 0 "L1" V 1350 6550 50  0000 C CNN
F 1 "INDUCTOR" V 1500 6550 50  0000 C CNN
F 2 "Inductors:Inductor_Taiyo-Yuden_NR-30xx_HandSoldering" H 1400 6550 50  0001 C CNN
F 3 "" H 1400 6550 50  0000 C CNN
	1    1400 6550
	0    -1   -1   0   
$EndComp
$Comp
L +BATT #PWR014
U 1 1 584F2368
P 850 6750
F 0 "#PWR014" H 850 6600 50  0001 C CNN
F 1 "+BATT" H 850 6890 50  0000 C CNN
F 2 "" H 850 6750 50  0000 C CNN
F 3 "" H 850 6750 50  0000 C CNN
	1    850  6750
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 584F23EA
P 1250 6900
F 0 "C9" H 1275 7000 50  0000 L CNN
F 1 "10uF" H 1275 6800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1288 6750 50  0001 C CNN
F 3 "" H 1250 6900 50  0000 C CNN
	1    1250 6900
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 584F24D0
P 2850 6700
F 0 "C8" H 2875 6800 50  0000 L CNN
F 1 "10uF" H 2875 6600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2888 6550 50  0001 C CNN
F 3 "" H 2850 6700 50  0000 C CNN
	1    2850 6700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR015
U 1 1 584F287E
P 2850 6850
F 0 "#PWR015" H 2850 6600 50  0001 C CNN
F 1 "Earth" H 2850 6700 50  0001 C CNN
F 2 "" H 2850 6850 50  0000 C CNN
F 3 "" H 2850 6850 50  0000 C CNN
	1    2850 6850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR016
U 1 1 584F28E3
P 1700 6850
F 0 "#PWR016" H 1700 6600 50  0001 C CNN
F 1 "Earth" H 1700 6700 50  0001 C CNN
F 2 "" H 1700 6850 50  0000 C CNN
F 3 "" H 1700 6850 50  0000 C CNN
	1    1700 6850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR017
U 1 1 584F2924
P 1250 7050
F 0 "#PWR017" H 1250 6800 50  0001 C CNN
F 1 "Earth" H 1250 6900 50  0001 C CNN
F 2 "" H 1250 7050 50  0000 C CNN
F 3 "" H 1250 7050 50  0000 C CNN
	1    1250 7050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR018
U 1 1 584F2A51
P 3700 6400
F 0 "#PWR018" H 3700 6250 50  0001 C CNN
F 1 "VDD" H 3700 6550 50  0000 C CNN
F 2 "" H 3700 6400 50  0000 C CNN
F 3 "" H 3700 6400 50  0000 C CNN
	1    3700 6400
	1    0    0    -1  
$EndComp
Text Notes 3800 6350 0    60   ~ 0
3V3
Text Notes 750  6850 0    60   ~ 0
1V5
$Comp
L SW_PUSH SW1
U 1 1 5850680E
P 1700 2850
F 0 "SW1" H 1850 2960 50  0000 C CNN
F 1 "SW_PUSH" H 1700 2770 50  0000 C CNN
F 2 "theapi:SW_PCB" H 1700 2850 50  0001 C CNN
F 3 "" H 1700 2850 50  0000 C CNN
	1    1700 2850
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR019
U 1 1 585069C3
P 1300 2700
F 0 "#PWR019" H 1300 2550 50  0001 C CNN
F 1 "VDD" H 1300 2850 50  0000 C CNN
F 2 "" H 1300 2700 50  0000 C CNN
F 3 "" H 1300 2700 50  0000 C CNN
	1    1300 2700
	1    0    0    -1  
$EndComp
Text Label 3000 2850 2    60   ~ 0
BUTTON0
$Comp
L SW_PUSH SW2
U 1 1 58506BDE
P 1700 3450
F 0 "SW2" H 1850 3560 50  0000 C CNN
F 1 "SW_PUSH" H 1700 3370 50  0000 C CNN
F 2 "theapi:SW_PCB" H 1700 3450 50  0001 C CNN
F 3 "" H 1700 3450 50  0000 C CNN
	1    1700 3450
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR020
U 1 1 58506BE4
P 1300 3300
F 0 "#PWR020" H 1300 3150 50  0001 C CNN
F 1 "VDD" H 1300 3450 50  0000 C CNN
F 2 "" H 1300 3300 50  0000 C CNN
F 3 "" H 1300 3300 50  0000 C CNN
	1    1300 3300
	1    0    0    -1  
$EndComp
Text Label 3000 3450 2    60   ~ 0
BUTTON1
$Comp
L SW_PUSH SW3
U 1 1 58506C80
P 1700 4050
F 0 "SW3" H 1850 4160 50  0000 C CNN
F 1 "SW_PUSH" H 1700 3970 50  0000 C CNN
F 2 "theapi:SW_PCB" H 1700 4050 50  0001 C CNN
F 3 "" H 1700 4050 50  0000 C CNN
	1    1700 4050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR021
U 1 1 58506C86
P 1300 3900
F 0 "#PWR021" H 1300 3750 50  0001 C CNN
F 1 "VDD" H 1300 4050 50  0000 C CNN
F 2 "" H 1300 3900 50  0000 C CNN
F 3 "" H 1300 3900 50  0000 C CNN
	1    1300 3900
	1    0    0    -1  
$EndComp
Text Label 3000 4050 2    60   ~ 0
BUTTON2
$Comp
L R R3
U 1 1 58519B61
P 2300 2850
F 0 "R3" V 2380 2850 50  0000 C CNN
F 1 "1K" V 2300 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2230 2850 50  0001 C CNN
F 3 "" H 2300 2850 50  0000 C CNN
	1    2300 2850
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 58519D14
P 2300 3450
F 0 "R4" V 2380 3450 50  0000 C CNN
F 1 "1K" V 2300 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2230 3450 50  0001 C CNN
F 3 "" H 2300 3450 50  0000 C CNN
	1    2300 3450
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 58519D86
P 2300 4050
F 0 "R5" V 2380 4050 50  0000 C CNN
F 1 "1K" V 2300 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2230 4050 50  0001 C CNN
F 3 "" H 2300 4050 50  0000 C CNN
	1    2300 4050
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 5851A24C
P 2450 3000
F 0 "C5" H 2475 3100 50  0000 L CNN
F 1 "100nF" H 2475 2900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 2850 50  0001 C CNN
F 3 "" H 2450 3000 50  0000 C CNN
	1    2450 3000
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR022
U 1 1 5851A35F
P 2450 3150
F 0 "#PWR022" H 2450 2900 50  0001 C CNN
F 1 "Earth" H 2450 3000 50  0001 C CNN
F 2 "" H 2450 3150 50  0000 C CNN
F 3 "" H 2450 3150 50  0000 C CNN
	1    2450 3150
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 5851A3FF
P 2450 3600
F 0 "C10" H 2475 3700 50  0000 L CNN
F 1 "100nF" H 2475 3500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 3450 50  0001 C CNN
F 3 "" H 2450 3600 50  0000 C CNN
	1    2450 3600
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 5851A470
P 2450 4200
F 0 "C11" H 2475 4300 50  0000 L CNN
F 1 "100nF" H 2475 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 4050 50  0001 C CNN
F 3 "" H 2450 4200 50  0000 C CNN
	1    2450 4200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR023
U 1 1 5851A4F4
P 2450 3750
F 0 "#PWR023" H 2450 3500 50  0001 C CNN
F 1 "Earth" H 2450 3600 50  0001 C CNN
F 2 "" H 2450 3750 50  0000 C CNN
F 3 "" H 2450 3750 50  0000 C CNN
	1    2450 3750
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR024
U 1 1 5851A54D
P 2450 4350
F 0 "#PWR024" H 2450 4100 50  0001 C CNN
F 1 "Earth" H 2450 4200 50  0001 C CNN
F 2 "" H 2450 4350 50  0000 C CNN
F 3 "" H 2450 4350 50  0000 C CNN
	1    2450 4350
	1    0    0    -1  
$EndComp
$Comp
L BUZZER LS1
U 1 1 5851ABB3
P 9100 2950
F 0 "LS1" H 9100 3200 60  0000 C CNN
F 1 "BUZZER" H 9500 2950 60  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 9250 3200 60  0001 C CNN
F 3 "" H 9250 3200 60  0001 C CNN
	1    9100 2950
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5851ADE5
P 8350 3650
F 0 "R6" V 8430 3650 50  0000 C CNN
F 1 "1K" V 8350 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8280 3650 50  0001 C CNN
F 3 "" H 8350 3650 50  0000 C CNN
	1    8350 3650
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR025
U 1 1 5851B22D
P 8900 3850
F 0 "#PWR025" H 8900 3600 50  0001 C CNN
F 1 "Earth" H 8900 3700 50  0001 C CNN
F 2 "" H 8900 3850 50  0000 C CNN
F 3 "" H 8900 3850 50  0000 C CNN
	1    8900 3850
	1    0    0    -1  
$EndComp
Text Label 7100 3400 2    60   ~ 0
BUZZER
$Comp
L R R7
U 1 1 5857A47C
P 3250 6550
F 0 "R7" V 3330 6550 50  0000 C CNN
F 1 "0" V 3250 6550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3180 6550 50  0001 C CNN
F 3 "" H 3250 6550 50  0000 C CNN
	1    3250 6550
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 5857BC53
P 950 5700
F 0 "P2" H 950 5850 50  0000 C CNN
F 1 "PWR" V 1050 5700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 950 5700 50  0001 C CNN
F 3 "" H 950 5700 50  0000 C CNN
	1    950  5700
	-1   0    0    -1  
$EndComp
$Comp
L +BATT #PWR027
U 1 1 5857BD0C
P 1150 5650
F 0 "#PWR027" H 1150 5500 50  0001 C CNN
F 1 "+BATT" H 1150 5790 50  0000 C CNN
F 2 "" H 1150 5650 50  0000 C CNN
F 3 "" H 1150 5650 50  0000 C CNN
	1    1150 5650
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR028
U 1 1 5857BE4D
P 1150 5750
F 0 "#PWR028" H 1150 5500 50  0001 C CNN
F 1 "Earth" H 1150 5600 50  0001 C CNN
F 2 "" H 1150 5750 50  0000 C CNN
F 3 "" H 1150 5750 50  0000 C CNN
	1    1150 5750
	1    0    0    -1  
$EndComp
Text Label 3900 2300 0    60   ~ 0
WAKEUP_PIN1
Text Label 2600 1700 0    60   ~ 0
BUTTON0
Text Label 2600 2000 0    60   ~ 0
BUTTON1
Text Label 2600 2300 0    60   ~ 0
BUTTON2
$Comp
L Q_PNP_BEC Q1
U 1 1 586901C2
P 8800 3650
F 0 "Q1" H 9000 3700 50  0000 L CNN
F 1 "Q_PNP_BEC" H 9000 3600 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 9000 3750 50  0001 C CNN
F 3 "" H 8800 3650 50  0000 C CNN
	1    8800 3650
	1    0    0    -1  
$EndComp
Text Label 7100 3800 2    60   ~ 0
MELODY
Wire Wire Line
	5150 5650 5150 5800
Wire Wire Line
	5650 5650 5650 5800
Connection ~ 5550 5650
Connection ~ 5450 5650
Wire Wire Line
	5450 1050 5450 2000
Wire Wire Line
	5550 1250 5550 2000
Wire Wire Line
	5300 1250 5300 2000
Wire Wire Line
	5300 1250 5900 1250
Connection ~ 5450 1250
Wire Wire Line
	4800 1800 4800 1750
Wire Wire Line
	5900 1250 5900 2000
Wire Wire Line
	4050 3600 4600 3600
Wire Wire Line
	4050 3700 4600 3700
Wire Wire Line
	2150 1400 1650 1400
Wire Wire Line
	5600 6300 5100 6300
Wire Wire Line
	4050 3300 4600 3300
Wire Wire Line
	4050 3200 4600 3200
Wire Wire Line
	4050 3100 4600 3100
Wire Wire Line
	4050 3000 4600 3000
Wire Wire Line
	4050 2900 4600 2900
Wire Wire Line
	3950 2800 4600 2800
Wire Wire Line
	4050 2600 4600 2600
Wire Wire Line
	4050 2500 4600 2500
Wire Wire Line
	4050 2400 4600 2400
Wire Wire Line
	6550 2300 7100 2300
Wire Wire Line
	6550 2400 7100 2400
Wire Wire Line
	6550 2700 7100 2700
Wire Wire Line
	6550 2800 7100 2800
Wire Wire Line
	6550 2900 7100 2900
Wire Wire Line
	6550 3200 7100 3200
Wire Wire Line
	5950 6800 5950 6900
Wire Wire Line
	5100 1750 5200 1750
Connection ~ 5550 1250
Wire Wire Line
	5200 6900 4900 6900
Wire Wire Line
	5200 7200 4900 7200
Wire Wire Line
	5200 1750 5200 2000
Wire Wire Line
	6550 2600 7100 2600
Wire Wire Line
	5450 5650 5650 5650
Wire Wire Line
	3450 4800 4600 4800
Wire Wire Line
	3450 4800 3450 5250
Connection ~ 3450 5050
Wire Wire Line
	3750 4900 4600 4900
Wire Wire Line
	3750 4900 3750 5250
Connection ~ 3750 5050
Wire Wire Line
	3750 5700 3750 5550
Wire Wire Line
	3450 5700 3750 5700
Wire Wire Line
	3450 5550 3450 5700
Connection ~ 3600 5700
Wire Wire Line
	850  6750 1700 6750
Connection ~ 1250 6750
Wire Wire Line
	1100 6550 1100 6750
Connection ~ 1100 6750
Wire Wire Line
	1700 6650 1600 6650
Wire Wire Line
	1600 6650 1600 6750
Connection ~ 1600 6750
Wire Wire Line
	2600 6550 3100 6550
Connection ~ 2850 6550
Wire Wire Line
	2600 6650 2700 6650
Wire Wire Line
	2700 6650 2700 6550
Connection ~ 2700 6550
Wire Wire Line
	8700 4650 9250 4650
Wire Wire Line
	9250 4750 8700 4750
Wire Wire Line
	8700 4850 9250 4850
Wire Wire Line
	8700 4950 9250 4950
Wire Wire Line
	8700 5150 9250 5150
Wire Wire Line
	8700 5250 9250 5250
Wire Wire Line
	8700 5350 9250 5350
Wire Wire Line
	8700 5450 9250 5450
Wire Wire Line
	8700 5550 9250 5550
Wire Wire Line
	8700 5650 9250 5650
Wire Wire Line
	8700 5750 9250 5750
Wire Wire Line
	8700 5850 9250 5850
Wire Wire Line
	1300 2700 1300 2850
Wire Wire Line
	1300 2850 1400 2850
Wire Wire Line
	1300 3300 1300 3450
Wire Wire Line
	1300 3450 1400 3450
Wire Wire Line
	1300 3900 1300 4050
Wire Wire Line
	1300 4050 1400 4050
Wire Wire Line
	2150 2850 2000 2850
Wire Wire Line
	2000 3450 2150 3450
Wire Wire Line
	2000 4050 2150 4050
Wire Wire Line
	2450 3450 3000 3450
Wire Wire Line
	2450 4050 3000 4050
Wire Wire Line
	2450 2850 3000 2850
Wire Wire Line
	8900 3000 8900 3450
Wire Wire Line
	8600 3650 8500 3650
Wire Wire Line
	8200 3650 7800 3650
Wire Wire Line
	3400 6550 3700 6550
Wire Wire Line
	3700 6550 3700 6400
Wire Wire Line
	6550 3400 7250 3400
Wire Wire Line
	6550 3800 7100 3800
$Comp
L R R1
U 1 1 58691698
P 7400 3400
F 0 "R1" V 7480 3400 50  0000 C CNN
F 1 "0" V 7400 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7330 3400 50  0001 C CNN
F 3 "" H 7400 3400 50  0000 C CNN
	1    7400 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 3400 7800 3400
$Comp
L D_Schottky D3
U 1 1 586A426D
P 3350 2300
F 0 "D3" H 3350 2400 50  0000 C CNN
F 1 "D_Schottky" H 3350 2200 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 3350 2300 50  0001 C CNN
F 3 "" H 3350 2300 50  0000 C CNN
	1    3350 2300
	-1   0    0    1   
$EndComp
$Comp
L D_Schottky D2
U 1 1 586A45B0
P 3350 2000
F 0 "D2" H 3350 2100 50  0000 C CNN
F 1 "D_Schottky" H 3350 1900 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 3350 2000 50  0001 C CNN
F 3 "" H 3350 2000 50  0000 C CNN
	1    3350 2000
	-1   0    0    1   
$EndComp
$Comp
L D_Schottky D1
U 1 1 586A4698
P 3350 1700
F 0 "D1" H 3350 1800 50  0000 C CNN
F 1 "D_Schottky" H 3350 1600 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 3350 1700 50  0001 C CNN
F 3 "" H 3350 1700 50  0000 C CNN
	1    3350 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 2300 3200 2300
Wire Wire Line
	2600 2000 3200 2000
Wire Wire Line
	2600 1700 3200 1700
Wire Wire Line
	3500 2300 4600 2300
Wire Wire Line
	3500 1700 3800 1700
Wire Wire Line
	3800 1700 3800 2300
Wire Wire Line
	3500 2000 3800 2000
Connection ~ 3800 2000
Connection ~ 3800 2300
$Comp
L um66t U3
U 1 1 586A536C
P 7400 3700
F 0 "U3" H 7400 3700 60  0000 C CNN
F 1 "um66t" H 7400 3300 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 7400 3700 60  0001 C CNN
F 3 "" H 7400 3700 60  0001 C CNN
	1    7400 3700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR029
U 1 1 586A57FA
P 7100 3900
F 0 "#PWR029" H 7100 3650 50  0001 C CNN
F 1 "Earth" H 7100 3750 50  0001 C CNN
F 2 "" H 7100 3900 50  0000 C CNN
F 3 "" H 7100 3900 50  0000 C CNN
	1    7100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 4000 7700 4000
Wire Wire Line
	7800 3400 7800 4000
Connection ~ 7800 3650
Text Notes 6750 4350 0    60   ~ 0
Either BUZZER or MELODY
$Comp
L D D4
U 1 1 586A5FCA
P 8550 2950
F 0 "D4" H 8550 3050 50  0000 C CNN
F 1 "D" H 8550 2850 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 8550 2950 50  0001 C CNN
F 3 "" H 8550 2950 50  0000 C CNN
	1    8550 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 2900 8900 2650
Wire Wire Line
	8550 2800 8900 2800
Connection ~ 8900 2800
Wire Wire Line
	8550 3100 8900 3100
Connection ~ 8900 3100
$Comp
L +BATT #PWR?
U 1 1 586A907B
P 8900 2650
F 0 "#PWR?" H 8900 2500 50  0001 C CNN
F 1 "+BATT" H 8900 2790 50  0000 C CNN
F 2 "" H 8900 2650 50  0000 C CNN
F 3 "" H 8900 2650 50  0000 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
