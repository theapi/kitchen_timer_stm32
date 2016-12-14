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
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Earth #PWR24
U 1 1 58021BE1
P 4900 7200
F 0 "#PWR24" H 4900 6950 50  0001 C CNN
F 1 "Earth" H 4900 7050 50  0001 C CNN
F 2 "" H 4900 7200 50  0000 C CNN
F 3 "" H 4900 7200 50  0000 C CNN
	1    4900 7200
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR22
U 1 1 58021C2A
P 4900 6900
F 0 "#PWR22" H 4900 6750 50  0001 C CNN
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
L GNDA #PWR16
U 1 1 58021F75
P 5100 6300
F 0 "#PWR16" H 5100 6050 50  0001 C CNN
F 1 "GNDA" H 5100 6150 50  0000 C CNN
F 2 "" H 5100 6300 50  0000 C CNN
F 3 "" H 5100 6300 50  0000 C CNN
	1    5100 6300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR17
U 1 1 58021F89
P 5600 6300
F 0 "#PWR17" H 5600 6050 50  0001 C CNN
F 1 "Earth" H 5600 6150 50  0001 C CNN
F 2 "" H 5600 6300 50  0000 C CNN
F 3 "" H 5600 6300 50  0000 C CNN
	1    5600 6300
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR14
U 1 1 58022154
P 5150 5800
F 0 "#PWR14" H 5150 5550 50  0001 C CNN
F 1 "GNDA" H 5150 5650 50  0000 C CNN
F 2 "" H 5150 5800 50  0000 C CNN
F 3 "" H 5150 5800 50  0000 C CNN
	1    5150 5800
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR15
U 1 1 580221FA
P 5650 5800
F 0 "#PWR15" H 5650 5550 50  0001 C CNN
F 1 "Earth" H 5650 5650 50  0001 C CNN
F 2 "" H 5650 5800 50  0000 C CNN
F 3 "" H 5650 5800 50  0000 C CNN
	1    5650 5800
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR1
U 1 1 5802295B
P 5450 1050
F 0 "#PWR1" H 5450 900 50  0001 C CNN
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
L Earth #PWR4
U 1 1 5803310F
P 4800 1800
F 0 "#PWR4" H 4800 1550 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 1450 1400 50  0001 C CNN
F 3 "" H 1450 1400 50  0000 C CNN
	1    1450 1400
	-1   0    0    -1  
$EndComp
$Comp
L Earth #PWR3
U 1 1 580369A9
P 2150 1400
F 0 "#PWR3" H 2150 1150 50  0001 C CNN
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
L VDD #PWR2
U 1 1 5803734F
P 1650 1200
F 0 "#PWR2" H 1650 1050 50  0001 C CNN
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
L Earth #PWR25
U 1 1 5803BDC8
P 5950 7200
F 0 "#PWR25" H 5950 6950 50  0001 C CNN
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
L Earth #PWR12
U 1 1 58065816
P 6550 5400
F 0 "#PWR12" H 6550 5150 50  0001 C CNN
F 1 "Earth" H 6550 5250 50  0001 C CNN
F 2 "" H 6550 5400 50  0000 C CNN
F 3 "" H 6550 5400 50  0000 C CNN
	1    6550 5400
	1    0    0    -1  
$EndComp
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
L Earth #PWR13
U 1 1 5806680D
P 3600 5700
F 0 "#PWR13" H 3600 5450 50  0001 C CNN
F 1 "Earth" H 3600 5550 50  0001 C CNN
F 2 "" H 3600 5700 50  0000 C CNN
F 3 "" H 3600 5700 50  0000 C CNN
	1    3600 5700
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 58076AE7
P 9300 2200
F 0 "D1" H 9300 2300 50  0000 C CNN
F 1 "LED" H 9300 2100 50  0000 C CNN
F 2 "LEDs:LED_0805" H 9300 2200 50  0001 C CNN
F 3 "" H 9300 2200 50  0000 C CNN
	1    9300 2200
	-1   0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 580770D7
P 8950 2200
F 0 "R1" V 9030 2200 50  0000 C CNN
F 1 "820" V 8950 2200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8880 2200 50  0001 C CNN
F 3 "" H 8950 2200 50  0000 C CNN
	1    8950 2200
	0    -1   1    0   
$EndComp
$Comp
L Earth #PWR5
U 1 1 58077163
P 9600 2300
F 0 "#PWR5" H 9600 2050 50  0001 C CNN
F 1 "Earth" H 9600 2150 50  0001 C CNN
F 2 "" H 9600 2300 50  0000 C CNN
F 3 "" H 9600 2300 50  0000 C CNN
	1    9600 2300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9600 2300 9600 2200
Wire Wire Line
	9600 2200 9500 2200
Wire Wire Line
	8600 2200 8800 2200
Wire Wire Line
	5200 1750 5200 2000
Text Label 7100 2600 2    60   ~ 0
LCD_SEG7
Wire Wire Line
	6550 2600 7100 2600
Wire Wire Line
	5450 5650 5650 5650
NoConn ~ 4600 5000
NoConn ~ 4600 5100
Text GLabel 3950 2800 0    60   Input ~ 0
PA5
NoConn ~ 6550 2500
NoConn ~ 6550 3000
NoConn ~ 6550 3100
NoConn ~ 6550 3300
NoConn ~ 6550 3400
NoConn ~ 6550 3500
NoConn ~ 6550 3600
NoConn ~ 6550 3700
NoConn ~ 6550 3800
NoConn ~ 4600 2300
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
F 2 "" H 3600 5050 50  0000 C CNN
F 3 "" H 3600 5050 50  0000 C CNN
	1    3600 5050
	-1   0    0    1   
$EndComp
Text Label 3900 4800 0    60   ~ 0
OSC32_IN
Text Label 3900 4900 0    60   ~ 0
OSC32_OUT
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
NoConn ~ 4600 4700
Text GLabel 8600 2200 0    60   Input ~ 0
PA5
Text Label 8500 3350 0    60   ~ 0
LCD_COM0
Text Label 8500 3450 0    60   ~ 0
LCD_COM1
Text Label 8500 3550 0    60   ~ 0
LCD_COM2
Text Label 8500 3850 0    60   ~ 0
LCD_SEG0
Text Label 8500 3950 0    60   ~ 0
LCD_SEG1
Text Label 8500 4050 0    60   ~ 0
LCD_SEG2
Text Label 8500 4150 0    60   ~ 0
LCD_SEG3
Text Label 8500 4250 0    60   ~ 0
LCD_SEG4
Text Label 8500 4350 0    60   ~ 0
LCD_SEG5
Text Label 8500 4450 0    60   ~ 0
LCD_SEG6
Text Label 8500 4550 0    60   ~ 0
LCD_SEG7
Text Label 8500 3650 0    60   ~ 0
LCD_COM3
$Comp
L LCD_KITCHEN_TIMER DS1
U 1 1 584F1C3C
P 9500 3950
F 0 "DS1" V 9500 4200 60  0000 C CNN
F 1 "LCD_KITCHEN_TIMER" H 9500 4050 60  0000 C CNN
F 2 "" H 9500 3950 60  0000 C CNN
F 3 "" H 9500 3950 60  0000 C CNN
	1    9500 3950
	0    1    1    0   
$EndComp
$Comp
L TLV61225 U2
U 1 1 584F21B9
P 2150 6500
F 0 "U2" H 2150 6650 60  0000 C CNN
F 1 "TLV61225" H 2150 5950 60  0000 C CNN
F 2 "" H 2150 6550 60  0001 C CNN
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
F 2 "" H 1400 6550 50  0000 C CNN
F 3 "" H 1400 6550 50  0000 C CNN
	1    1400 6550
	0    -1   -1   0   
$EndComp
$Comp
L +BATT #PWR19
U 1 1 584F2368
P 850 6750
F 0 "#PWR19" H 850 6600 50  0001 C CNN
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
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1288 6750 50  0001 C CNN
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
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2888 6550 50  0001 C CNN
F 3 "" H 2850 6700 50  0000 C CNN
	1    2850 6700
	1    0    0    -1  
$EndComp
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
	2600 6550 3200 6550
Connection ~ 2850 6550
Wire Wire Line
	2600 6650 2700 6650
Wire Wire Line
	2700 6650 2700 6550
Connection ~ 2700 6550
$Comp
L Earth #PWR21
U 1 1 584F287E
P 2850 6850
F 0 "#PWR21" H 2850 6600 50  0001 C CNN
F 1 "Earth" H 2850 6700 50  0001 C CNN
F 2 "" H 2850 6850 50  0000 C CNN
F 3 "" H 2850 6850 50  0000 C CNN
	1    2850 6850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR20
U 1 1 584F28E3
P 1700 6850
F 0 "#PWR20" H 1700 6600 50  0001 C CNN
F 1 "Earth" H 1700 6700 50  0001 C CNN
F 2 "" H 1700 6850 50  0000 C CNN
F 3 "" H 1700 6850 50  0000 C CNN
	1    1700 6850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR23
U 1 1 584F2924
P 1250 7050
F 0 "#PWR23" H 1250 6800 50  0001 C CNN
F 1 "Earth" H 1250 6900 50  0001 C CNN
F 2 "" H 1250 7050 50  0000 C CNN
F 3 "" H 1250 7050 50  0000 C CNN
	1    1250 7050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR18
U 1 1 584F2A51
P 3200 6550
F 0 "#PWR18" H 3200 6400 50  0001 C CNN
F 1 "VDD" H 3200 6700 50  0000 C CNN
F 2 "" H 3200 6550 50  0000 C CNN
F 3 "" H 3200 6550 50  0000 C CNN
	1    3200 6550
	1    0    0    -1  
$EndComp
Text Notes 3150 6650 0    60   ~ 0
3V3
Text Notes 750  6850 0    60   ~ 0
1V5
Wire Wire Line
	8500 3350 9050 3350
Wire Wire Line
	9050 3450 8500 3450
Wire Wire Line
	8500 3550 9050 3550
Wire Wire Line
	8500 3650 9050 3650
Wire Wire Line
	8500 3850 9050 3850
Wire Wire Line
	8500 3950 9050 3950
Wire Wire Line
	8500 4050 9050 4050
Wire Wire Line
	8500 4150 9050 4150
Wire Wire Line
	8500 4250 9050 4250
Wire Wire Line
	8500 4350 9050 4350
Wire Wire Line
	8500 4450 9050 4450
Wire Wire Line
	8500 4550 9050 4550
$Comp
L SW_PUSH SW1
U 1 1 5850680E
P 1700 2850
F 0 "SW1" H 1850 2960 50  0000 C CNN
F 1 "SW_PUSH" H 1700 2770 50  0000 C CNN
F 2 "" H 1700 2850 50  0000 C CNN
F 3 "" H 1700 2850 50  0000 C CNN
	1    1700 2850
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR6
U 1 1 585069C3
P 1300 2700
F 0 "#PWR6" H 1300 2550 50  0001 C CNN
F 1 "VDD" H 1300 2850 50  0000 C CNN
F 2 "" H 1300 2700 50  0000 C CNN
F 3 "" H 1300 2700 50  0000 C CNN
	1    1300 2700
	1    0    0    -1  
$EndComp
Text Label 3000 2850 2    60   ~ 0
BUTTON0
Wire Wire Line
	1300 2700 1300 2850
Wire Wire Line
	1300 2850 1400 2850
$Comp
L SW_PUSH SW2
U 1 1 58506BDE
P 1700 3450
F 0 "SW2" H 1850 3560 50  0000 C CNN
F 1 "SW_PUSH" H 1700 3370 50  0000 C CNN
F 2 "" H 1700 3450 50  0000 C CNN
F 3 "" H 1700 3450 50  0000 C CNN
	1    1700 3450
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR8
U 1 1 58506BE4
P 1300 3300
F 0 "#PWR8" H 1300 3150 50  0001 C CNN
F 1 "VDD" H 1300 3450 50  0000 C CNN
F 2 "" H 1300 3300 50  0000 C CNN
F 3 "" H 1300 3300 50  0000 C CNN
	1    1300 3300
	1    0    0    -1  
$EndComp
Text Label 3000 3450 2    60   ~ 0
BUTTON1
Wire Wire Line
	1300 3300 1300 3450
Wire Wire Line
	1300 3450 1400 3450
$Comp
L SW_PUSH SW3
U 1 1 58506C80
P 1700 4050
F 0 "SW3" H 1850 4160 50  0000 C CNN
F 1 "SW_PUSH" H 1700 3970 50  0000 C CNN
F 2 "" H 1700 4050 50  0000 C CNN
F 3 "" H 1700 4050 50  0000 C CNN
	1    1700 4050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR10
U 1 1 58506C86
P 1300 3900
F 0 "#PWR10" H 1300 3750 50  0001 C CNN
F 1 "VDD" H 1300 4050 50  0000 C CNN
F 2 "" H 1300 3900 50  0000 C CNN
F 3 "" H 1300 3900 50  0000 C CNN
	1    1300 3900
	1    0    0    -1  
$EndComp
Text Label 3000 4050 2    60   ~ 0
BUTTON2
Wire Wire Line
	1300 3900 1300 4050
Wire Wire Line
	1300 4050 1400 4050
$Comp
L R R3
U 1 1 58519B61
P 2300 2850
F 0 "R3" V 2380 2850 50  0000 C CNN
F 1 "1K" V 2300 2850 50  0000 C CNN
F 2 "" V 2230 2850 50  0000 C CNN
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
F 2 "" V 2230 3450 50  0000 C CNN
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
F 2 "" V 2230 4050 50  0000 C CNN
F 3 "" H 2300 4050 50  0000 C CNN
	1    2300 4050
	0    1    1    0   
$EndComp
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
$Comp
L C C5
U 1 1 5851A24C
P 2450 3000
F 0 "C5" H 2475 3100 50  0000 L CNN
F 1 "100nF" H 2475 2900 50  0000 L CNN
F 2 "" H 2488 2850 50  0000 C CNN
F 3 "" H 2450 3000 50  0000 C CNN
	1    2450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2850 3000 2850
$Comp
L Earth #PWR7
U 1 1 5851A35F
P 2450 3150
F 0 "#PWR7" H 2450 2900 50  0001 C CNN
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
F 2 "" H 2488 3450 50  0000 C CNN
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
F 2 "" H 2488 4050 50  0000 C CNN
F 3 "" H 2450 4200 50  0000 C CNN
	1    2450 4200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR9
U 1 1 5851A4F4
P 2450 3750
F 0 "#PWR9" H 2450 3500 50  0001 C CNN
F 1 "Earth" H 2450 3600 50  0001 C CNN
F 2 "" H 2450 3750 50  0000 C CNN
F 3 "" H 2450 3750 50  0000 C CNN
	1    2450 3750
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR11
U 1 1 5851A54D
P 2450 4350
F 0 "#PWR11" H 2450 4100 50  0001 C CNN
F 1 "Earth" H 2450 4200 50  0001 C CNN
F 2 "" H 2450 4350 50  0000 C CNN
F 3 "" H 2450 4350 50  0000 C CNN
	1    2450 4350
	1    0    0    -1  
$EndComp
$Comp
L BUZZER LS?
U 1 1 5851ABB3
P 9500 5200
F 0 "LS?" H 9500 5450 60  0000 C CNN
F 1 "BUZZER" H 9500 4950 60  0000 C CNN
F 2 "" H 9650 5450 60  0001 C CNN
F 3 "" H 9650 5450 60  0001 C CNN
	1    9500 5200
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_CBE Q?
U 1 1 5851AC3A
P 9200 5650
F 0 "Q?" H 9500 5700 50  0000 R CNN
F 1 "Q_NPN_CBE" H 9800 5600 50  0000 R CNN
F 2 "" H 9400 5750 50  0000 C CNN
F 3 "" H 9200 5650 50  0000 C CNN
	1    9200 5650
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5851ADE5
P 8750 5650
F 0 "R?" V 8830 5650 50  0000 C CNN
F 1 "1K" V 8750 5650 50  0000 C CNN
F 2 "" V 8680 5650 50  0000 C CNN
F 3 "" H 8750 5650 50  0000 C CNN
	1    8750 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 5250 9300 5450
Wire Wire Line
	9000 5650 8900 5650
Wire Wire Line
	8600 5650 8200 5650
$Comp
L Earth #PWR?
U 1 1 5851B22D
P 9300 5850
F 0 "#PWR?" H 9300 5600 50  0001 C CNN
F 1 "Earth" H 9300 5700 50  0001 C CNN
F 2 "" H 9300 5850 50  0000 C CNN
F 3 "" H 9300 5850 50  0000 C CNN
	1    9300 5850
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR?
U 1 1 5851B377
P 9300 5150
F 0 "#PWR?" H 9300 5000 50  0001 C CNN
F 1 "VDD" H 9300 5300 50  0000 C CNN
F 2 "" H 9300 5150 50  0000 C CNN
F 3 "" H 9300 5150 50  0000 C CNN
	1    9300 5150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
