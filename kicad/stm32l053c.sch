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
L Earth #PWR17
U 1 1 58021BE1
P 9650 1350
F 0 "#PWR17" H 9650 1100 50  0001 C CNN
F 1 "Earth" H 9650 1200 50  0001 C CNN
F 2 "" H 9650 1350 50  0000 C CNN
F 3 "" H 9650 1350 50  0000 C CNN
	1    9650 1350
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR16
U 1 1 58021C2A
P 9650 1050
F 0 "#PWR16" H 9650 900 50  0001 C CNN
F 1 "VDD" H 9650 1200 50  0000 C CNN
F 2 "" H 9650 1050 50  0000 C CNN
F 3 "" H 9650 1050 50  0000 C CNN
	1    9650 1050
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 58021E64
P 9650 1200
F 0 "C5" H 9675 1300 50  0000 L CNN
F 1 "100nF" H 9675 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9688 1050 50  0001 C CNN
F 3 "" H 9650 1200 50  0000 C CNN
	1    9650 1200
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR12
U 1 1 58021F75
P 7050 6200
F 0 "#PWR12" H 7050 5950 50  0001 C CNN
F 1 "GNDA" H 7050 6050 50  0000 C CNN
F 2 "" H 7050 6200 50  0000 C CNN
F 3 "" H 7050 6200 50  0000 C CNN
	1    7050 6200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR15
U 1 1 58021F89
P 7550 6200
F 0 "#PWR15" H 7550 5950 50  0001 C CNN
F 1 "Earth" H 7550 6050 50  0001 C CNN
F 2 "" H 7550 6200 50  0000 C CNN
F 3 "" H 7550 6200 50  0000 C CNN
	1    7550 6200
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR11
U 1 1 58022154
P 7050 5700
F 0 "#PWR11" H 7050 5450 50  0001 C CNN
F 1 "GNDA" H 7050 5550 50  0000 C CNN
F 2 "" H 7050 5700 50  0000 C CNN
F 3 "" H 7050 5700 50  0000 C CNN
	1    7050 5700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR14
U 1 1 580221FA
P 7550 5700
F 0 "#PWR14" H 7550 5450 50  0001 C CNN
F 1 "Earth" H 7550 5550 50  0001 C CNN
F 2 "" H 7550 5700 50  0000 C CNN
F 3 "" H 7550 5700 50  0000 C CNN
	1    7550 5700
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR13
U 1 1 5802295B
P 7350 950
F 0 "#PWR13" H 7350 800 50  0001 C CNN
F 1 "VDD" H 7350 1100 50  0000 C CNN
F 2 "" H 7350 950 50  0000 C CNN
F 3 "" H 7350 950 50  0000 C CNN
	1    7350 950 
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58032557
P 6850 1650
F 0 "C4" V 7000 1600 50  0000 L CNN
F 1 "100nF" V 6700 1550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6888 1500 50  0001 C CNN
F 3 "" H 6850 1650 50  0000 C CNN
	1    6850 1650
	0    -1   -1   0   
$EndComp
$Comp
L Earth #PWR10
U 1 1 5803310F
P 6700 1700
F 0 "#PWR10" H 6700 1450 50  0001 C CNN
F 1 "Earth" H 6700 1550 50  0001 C CNN
F 2 "" H 6700 1700 50  0000 C CNN
F 3 "" H 6700 1700 50  0000 C CNN
	1    6700 1700
	1    0    0    -1  
$EndComp
Text Notes 7450 900  0    60   ~ 12
Absolute max of 3.6v
Text GLabel 5950 3600 0    60   Input ~ 0
SWCLK
Text GLabel 5950 3500 0    60   Input ~ 0
SWDIO
Text GLabel 8450 4900 2    60   Input ~ 0
NRST
$Comp
L CONN_01X05 P1
U 1 1 58036840
P 1700 1350
F 0 "P1" H 1700 1700 50  0000 C CNN
F 1 "SWD" V 1800 1350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 1700 1350 50  0001 C CNN
F 3 "" H 1700 1350 50  0000 C CNN
	1    1700 1350
	-1   0    0    -1  
$EndComp
$Comp
L Earth #PWR6
U 1 1 580369A9
P 2400 1350
F 0 "#PWR6" H 2400 1100 50  0001 C CNN
F 1 "Earth" H 2400 1200 50  0001 C CNN
F 2 "" H 2400 1350 50  0000 C CNN
F 3 "" H 2400 1350 50  0000 C CNN
	1    2400 1350
	1    0    0    -1  
$EndComp
Text GLabel 1900 1250 2    60   Input ~ 0
SWCLK
Text GLabel 1900 1450 2    60   Input ~ 0
SWDIO
Text GLabel 1900 1550 2    60   Input ~ 0
NRST
$Comp
L VDD #PWR4
U 1 1 5803734F
P 1900 1150
F 0 "#PWR4" H 1900 1000 50  0001 C CNN
F 1 "VDD" H 1900 1300 50  0000 C CNN
F 2 "" H 1900 1150 50  0000 C CNN
F 3 "" H 1900 1150 50  0000 C CNN
	1    1900 1150
	1    0    0    -1  
$EndComp
Text Label 5950 2300 0    60   ~ 0
LCD_SEG0
Text Label 5950 2400 0    60   ~ 0
LCD_SEG1
Text Label 5950 2500 0    60   ~ 0
LCD_SEG2
Text Label 5950 2800 0    60   ~ 0
LCD_SEG3
Text Label 5950 2900 0    60   ~ 0
LCD_SEG4
Text Label 5950 3000 0    60   ~ 0
LCD_COM0
Text Label 5950 3100 0    60   ~ 0
LCD_COM1
Text Label 5950 3200 0    60   ~ 0
LCD_COM2
Text Label 9000 2200 2    60   ~ 0
LCD_SEG5
Text Label 9000 2300 2    60   ~ 0
LCD_SEG6
Text Label 9000 2600 2    60   ~ 0
BUTTON0
Text Label 9000 2700 2    60   ~ 0
BUTTON1
Text Label 9000 2800 2    60   ~ 0
BUTTON2
Text Label 9000 3100 2    60   ~ 0
LCD_COM3
$Comp
L Earth #PWR19
U 1 1 58039244
P 9650 2100
F 0 "#PWR19" H 9650 1850 50  0001 C CNN
F 1 "Earth" H 9650 1950 50  0001 C CNN
F 2 "" H 9650 2100 50  0000 C CNN
F 3 "" H 9650 2100 50  0000 C CNN
	1    9650 2100
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR18
U 1 1 5803924A
P 9650 1800
F 0 "#PWR18" H 9650 1650 50  0001 C CNN
F 1 "VDD" H 9650 1950 50  0000 C CNN
F 2 "" H 9650 1800 50  0000 C CNN
F 3 "" H 9650 1800 50  0000 C CNN
	1    9650 1800
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 58039250
P 9650 1950
F 0 "C6" H 9675 2050 50  0000 L CNN
F 1 "10uF" H 9675 1850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9688 1800 50  0001 C CNN
F 3 "" H 9650 1950 50  0000 C CNN
	1    9650 1950
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 5803B990
P 9950 1200
F 0 "C7" H 9975 1300 50  0000 L CNN
F 1 "100nF" H 9975 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9988 1050 50  0001 C CNN
F 3 "" H 9950 1200 50  0000 C CNN
	1    9950 1200
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 5803BA4A
P 10700 1200
F 0 "C8" H 10725 1300 50  0000 L CNN
F 1 "100nF" H 10725 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10738 1050 50  0001 C CNN
F 3 "" H 10700 1200 50  0000 C CNN
	1    10700 1200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR20
U 1 1 5803BDC8
P 10700 1350
F 0 "#PWR20" H 10700 1100 50  0001 C CNN
F 1 "Earth" H 10700 1200 50  0001 C CNN
F 2 "" H 10700 1350 50  0000 C CNN
F 3 "" H 10700 1350 50  0000 C CNN
	1    10700 1350
	1    0    0    -1  
$EndComp
Text Label 10700 950  0    60   ~ 0
VDDA
Text Label 7200 1900 1    60   ~ 0
VDDA
Text Label 7100 1900 1    60   ~ 0
VLCD
Text Label 7350 1900 1    60   ~ 0
VDD
Text Label 7800 1900 1    60   ~ 0
VDD_USB
Text Label 7450 1900 1    60   ~ 0
VDD
$Comp
L STM32L053C8_LQFP48 U1
U 1 1 580631B3
P 7350 4000
F 0 "U1" H 8000 6000 60  0000 C CNN
F 1 "STM32L053C8_LQFP48" H 7450 4000 60  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 7150 2100 60  0001 C CNN
F 3 "" H 7150 2100 60  0000 C CNN
	1    7350 4000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5806575A
P 8450 5150
F 0 "R1" V 8530 5150 50  0000 C CNN
F 1 "10K" V 8450 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8380 5150 50  0001 C CNN
F 3 "" H 8450 5150 50  0000 C CNN
	1    8450 5150
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR7
U 1 1 58065816
P 8450 5300
F 0 "#PWR7" H 8450 5050 50  0001 C CNN
F 1 "Earth" H 8450 5150 50  0001 C CNN
F 2 "" H 8450 5300 50  0000 C CNN
F 3 "" H 8450 5300 50  0000 C CNN
	1    8450 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5550 7050 5700
Wire Wire Line
	7550 5550 7550 5700
Connection ~ 7450 5550
Connection ~ 7350 5550
Wire Wire Line
	7350 950  7350 1900
Wire Wire Line
	7450 1150 7450 1900
Wire Wire Line
	7200 1150 7200 1900
Wire Wire Line
	7200 1150 7800 1150
Connection ~ 7350 1150
Wire Wire Line
	6700 1700 6700 1650
Wire Wire Line
	7800 1150 7800 1900
Wire Wire Line
	5950 3500 6500 3500
Wire Wire Line
	5950 3600 6500 3600
Wire Wire Line
	2400 1350 1900 1350
Wire Wire Line
	7550 6200 7050 6200
Wire Wire Line
	5950 3200 6500 3200
Wire Wire Line
	5950 3100 6500 3100
Wire Wire Line
	5950 3000 6500 3000
Wire Wire Line
	5950 2900 6500 2900
Wire Wire Line
	5950 2800 6500 2800
Wire Wire Line
	5850 2700 6500 2700
Wire Wire Line
	5950 2500 6500 2500
Wire Wire Line
	5950 2400 6500 2400
Wire Wire Line
	5950 2300 6500 2300
Wire Wire Line
	8450 2200 9000 2200
Wire Wire Line
	8450 2300 9000 2300
Wire Wire Line
	8450 2600 9000 2600
Wire Wire Line
	8450 2700 9000 2700
Wire Wire Line
	8450 2800 9000 2800
Wire Wire Line
	8450 3100 9000 3100
Wire Wire Line
	10700 950  10700 1050
Wire Wire Line
	7000 1650 7100 1650
Connection ~ 7450 1150
Wire Wire Line
	9950 1050 9650 1050
Wire Wire Line
	9950 1350 9650 1350
$Comp
L C C2
U 1 1 5806648B
P 5650 5300
F 0 "C2" H 5675 5400 50  0000 L CNN
F 1 "20pF" H 5675 5200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5688 5150 50  0001 C CNN
F 3 "" H 5650 5300 50  0000 C CNN
	1    5650 5300
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 580665CF
P 5350 5300
F 0 "C1" H 5375 5400 50  0000 L CNN
F 1 "20pF" H 5375 5200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5388 5150 50  0001 C CNN
F 3 "" H 5350 5300 50  0000 C CNN
	1    5350 5300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR8
U 1 1 5806680D
P 5500 5600
F 0 "#PWR8" H 5500 5350 50  0001 C CNN
F 1 "Earth" H 5500 5450 50  0001 C CNN
F 2 "" H 5500 5600 50  0000 C CNN
F 3 "" H 5500 5600 50  0000 C CNN
	1    5500 5600
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 58076AE7
P 9950 4200
F 0 "D1" H 9950 4300 50  0000 C CNN
F 1 "LED" H 9950 4100 50  0000 C CNN
F 2 "LEDs:LED_0805" H 9950 4200 50  0001 C CNN
F 3 "" H 9950 4200 50  0000 C CNN
	1    9950 4200
	-1   0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 580770D7
P 9600 4200
F 0 "R4" V 9680 4200 50  0000 C CNN
F 1 "820" V 9600 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9530 4200 50  0001 C CNN
F 3 "" H 9600 4200 50  0000 C CNN
	1    9600 4200
	0    -1   1    0   
$EndComp
$Comp
L Earth #PWR5
U 1 1 58077163
P 10250 4300
F 0 "#PWR5" H 10250 4050 50  0001 C CNN
F 1 "Earth" H 10250 4150 50  0001 C CNN
F 2 "" H 10250 4300 50  0000 C CNN
F 3 "" H 10250 4300 50  0000 C CNN
	1    10250 4300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10250 4300 10250 4200
Wire Wire Line
	10250 4200 10150 4200
Text Label 9250 4200 0    60   ~ 0
PA5
Wire Wire Line
	9250 4200 9450 4200
Wire Wire Line
	7100 1650 7100 1900
Text Label 9000 2500 2    60   ~ 0
LCD_SEG7
Wire Wire Line
	8450 2500 9000 2500
Wire Wire Line
	7350 5550 7550 5550
NoConn ~ 6500 4900
NoConn ~ 6500 5000
Text GLabel 5850 2700 0    60   Input ~ 0
PA5
NoConn ~ 8450 2400
NoConn ~ 8450 2900
NoConn ~ 8450 3000
NoConn ~ 8450 3200
NoConn ~ 8450 3300
NoConn ~ 8450 3400
NoConn ~ 8450 3500
NoConn ~ 8450 3600
NoConn ~ 8450 3700
NoConn ~ 6500 2200
NoConn ~ 6500 2600
NoConn ~ 6500 3300
NoConn ~ 6500 3400
NoConn ~ 6500 3700
$Comp
L Crystal Y?
U 1 1 584DF533
P 5500 4950
F 0 "Y?" H 5500 5100 50  0000 C CNN
F 1 "Crystal" H 5500 4800 50  0000 C CNN
F 2 "" H 5500 4950 50  0000 C CNN
F 3 "" H 5500 4950 50  0000 C CNN
	1    5500 4950
	-1   0    0    1   
$EndComp
Text Label 5800 4700 0    60   ~ 0
OSC32_IN
Text Label 5800 4800 0    60   ~ 0
OSC32_OUT
Wire Wire Line
	5350 4700 6500 4700
Wire Wire Line
	5350 4700 5350 5150
Connection ~ 5350 4950
Wire Wire Line
	5650 4800 6500 4800
Wire Wire Line
	5650 4800 5650 5150
Connection ~ 5650 4950
Wire Wire Line
	5650 5600 5650 5450
Wire Wire Line
	5350 5600 5650 5600
Wire Wire Line
	5350 5450 5350 5600
Connection ~ 5500 5600
NoConn ~ 6500 4600
$EndSCHEMATC
