EESchema Schematic File Version 5
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title "Z Sim"
Date "2019-10-22"
Rev "0.1"
Comp "ELp"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
$Comp
L rise_elp:TPS54160 U9
U 1 1 5DB10C4A
P 5150 2550
F 0 "U9" H 5150 3215 50  0000 C CNN
F 1 "TPS54160" H 5150 3124 50  0000 C CNN
F 2 "Package_SO:MSOP-10-1EP_3x3mm_P0.5mm_EP1.68x1.88mm" H 5150 2450 50  0001 C CNN
F 3 "" H 5150 2450 50  0001 C CNN
F 4 "296-36807-1-ND" H 5150 2550 50  0001 C CNN "OrderN"
	1    5150 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:L L2
U 1 1 5DB1304F
P 6400 2500
F 0 "L2" V 6350 2500 50  0000 C CNN
F 1 "22u" V 6499 2500 50  0000 C CNN
F 2 "Inductor_SMD:L_Taiyo-Yuden_NR-60xx_HandSoldering" H 6400 2500 50  0001 C CNN
F 3 "~" H 6400 2500 50  0001 C CNN
F 4 "587-2952-1-ND" V 6400 2500 50  0001 C CNN "OrderN"
	1    6400 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C35
U 1 1 5DB14BF9
P 5850 2300
F 0 "C35" V 5800 2450 50  0000 C CNN
F 1 "0.1u" V 5712 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5850 2300 50  0001 C CNN
F 3 "~" H 5850 2300 50  0001 C CNN
F 4 "1276-1000-1-ND" H 5850 2300 50  0001 C CNN "OrderN"
	1    5850 2300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky_Small D3
U 1 1 5DB154B7
P 5900 2700
F 0 "D3" V 5854 2768 50  0000 L CNN
F 1 "SCH" V 5945 2768 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" V 5900 2700 50  0001 C CNN
F 3 "~" V 5900 2700 50  0001 C CNN
F 4 "B360A-FDICT-ND" V 5900 2700 50  0001 C CNN "OrderN"
	1    5900 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R34
U 1 1 5DB163A9
P 6800 3100
F 0 "R34" H 6741 3054 50  0000 R CNN
F 1 "3.3k" H 6741 3145 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6800 3100 50  0001 C CNN
F 3 "~" H 6800 3100 50  0001 C CNN
F 4 " 311-3.30KHRCT-ND" H 6800 3100 50  0001 C CNN "OrderN"
	1    6800 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R33
U 1 1 5DB16850
P 6800 2650
F 0 "R33" H 6950 2700 50  0000 R CNN
F 1 "18k" H 7000 2600 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6800 2650 50  0001 C CNN
F 3 "~" H 6800 2650 50  0001 C CNN
F 4 "311-18.0KHRCT-ND " H 6800 2650 50  0001 C CNN "OrderN"
	1    6800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2500 6050 2500
Wire Wire Line
	6550 2500 6800 2500
Wire Wire Line
	6800 2500 6800 2550
Wire Wire Line
	5900 2600 5900 2500
Connection ~ 5900 2500
Wire Wire Line
	5900 2500 5600 2500
$Comp
L power:GND #PWR041
U 1 1 5DB1CA47
P 5150 3750
F 0 "#PWR041" H 5150 3500 50  0001 C CNN
F 1 "GND" H 5155 3577 50  0000 C CNN
F 2 "" H 5150 3750 50  0001 C CNN
F 3 "" H 5150 3750 50  0001 C CNN
	1    5150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3750 5150 3650
Wire Wire Line
	5150 3650 5900 3650
Wire Wire Line
	5900 3650 5900 2950
Connection ~ 5150 3650
Wire Wire Line
	5150 3650 5150 3150
Wire Wire Line
	5600 2950 5900 2950
Connection ~ 5900 2950
Wire Wire Line
	5900 2950 5900 2800
Wire Wire Line
	5900 3650 6800 3650
Wire Wire Line
	6800 3650 6800 3200
Connection ~ 5900 3650
Wire Wire Line
	6800 2750 6800 2850
Wire Wire Line
	5600 2700 5700 2700
Wire Wire Line
	5700 2700 5700 2850
Wire Wire Line
	5700 2850 6800 2850
Connection ~ 6800 2850
Wire Wire Line
	6800 2850 6800 3000
Wire Wire Line
	5600 2300 5750 2300
Wire Wire Line
	5950 2300 6050 2300
Wire Wire Line
	6050 2300 6050 2500
Connection ~ 6050 2500
Wire Wire Line
	6050 2500 5900 2500
NoConn ~ 5600 2150
NoConn ~ 4700 2400
Text GLabel 3200 2150 0    50   Input ~ 0
PWR_IN
$Comp
L Device:C_Small C31
U 1 1 5D9E4F06
P 3450 2450
F 0 "C31" H 3542 2496 50  0000 L CNN
F 1 "2.2u" H 3542 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3450 2450 50  0001 C CNN
F 3 "~" H 3450 2450 50  0001 C CNN
F 4 "445-5207-1-ND" H 3450 2450 50  0001 C CNN "OrderN"
	1    3450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2150 3450 2150
Wire Wire Line
	3450 2350 3450 2150
Connection ~ 3450 2150
Wire Wire Line
	3450 2550 3450 3650
Wire Wire Line
	3450 3650 3650 3650
$Comp
L Device:R_Small R31
U 1 1 5DB28B5E
P 3950 3050
F 0 "R31" H 4100 3100 50  0000 R CNN
F 1 "220k" V 4050 3000 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3950 3050 50  0001 C CNN
F 3 "~" H 3950 3050 50  0001 C CNN
F 4 "311-220KHRCT-ND" H 3950 3050 50  0001 C CNN "OrderN"
	1    3950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2750 3950 2950
Wire Wire Line
	3950 3150 3950 3650
Connection ~ 3950 3650
Wire Wire Line
	3950 3650 4200 3650
$Comp
L Device:R_Small R32
U 1 1 5DB2980D
P 4200 3050
F 0 "R32" H 4350 3100 50  0000 R CNN
F 1 "15k" V 4300 3000 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4200 3050 50  0001 C CNN
F 3 "~" H 4200 3050 50  0001 C CNN
F 4 "311-15.0KHRCT-ND" H 4200 3050 50  0001 C CNN "OrderN"
	1    4200 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C32
U 1 1 5DB2A1DA
P 4200 3400
F 0 "C32" V 4150 3550 50  0000 C CNN
F 1 "6.8n" V 4062 3400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4200 3400 50  0001 C CNN
F 3 "~" H 4200 3400 50  0001 C CNN
F 4 " 399-1089-1-ND " H 4200 3400 50  0001 C CNN "OrderN"
	1    4200 3400
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C34
U 1 1 5DB2A9FF
P 4450 3250
F 0 "C34" V 4400 3400 50  0000 C CNN
F 1 "120p" V 4312 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4450 3250 50  0001 C CNN
F 3 "~" H 4450 3250 50  0001 C CNN
F 4 "1276-1160-1-ND " H 4450 3250 50  0001 C CNN "OrderN"
	1    4450 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 2150 4700 2150
Wire Wire Line
	3950 2750 4700 2750
Wire Wire Line
	4700 2850 4450 2850
Wire Wire Line
	4200 2850 4200 2950
Wire Wire Line
	4450 3150 4450 2850
Connection ~ 4450 2850
Wire Wire Line
	4450 2850 4200 2850
Wire Wire Line
	4200 3150 4200 3300
Wire Wire Line
	4450 3350 4450 3650
Connection ~ 4450 3650
Wire Wire Line
	4450 3650 5150 3650
Wire Wire Line
	4200 3500 4200 3650
Connection ~ 4200 3650
Wire Wire Line
	4200 3650 4450 3650
$Comp
L Device:C_Small C37
U 1 1 5DB2C970
P 7250 3000
F 0 "C37" H 7342 3046 50  0000 L CNN
F 1 "2.2u" H 7342 2955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7250 3000 50  0001 C CNN
F 3 "~" H 7250 3000 50  0001 C CNN
F 4 "445-5207-1-ND" H 7250 3000 50  0001 C CNN "OrderN"
	1    7250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2500 7250 2500
Wire Wire Line
	7250 2500 7250 2900
Connection ~ 6800 2500
Wire Wire Line
	7250 3100 7250 3650
Wire Wire Line
	7250 3650 6800 3650
Connection ~ 6800 3650
$Comp
L power:+5V #PWR044
U 1 1 5DB2D58B
P 7650 2350
F 0 "#PWR044" H 7650 2200 50  0001 C CNN
F 1 "+5V" H 7665 2523 50  0000 C CNN
F 2 "" H 7650 2350 50  0001 C CNN
F 3 "" H 7650 2350 50  0001 C CNN
	1    7650 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C38
U 1 1 5DB41958
P 7650 3000
F 0 "C38" H 7738 3046 50  0000 L CNN
F 1 "470u" H 7738 2955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 7650 3000 50  0001 C CNN
F 3 "~" H 7650 3000 50  0001 C CNN
F 4 "https://www.digikey.se/product-detail/en/nichicon/URS1C471MPD1TD/493-11709-1-ND/4320195" H 7650 3000 50  0001 C CNN "digikey"
F 5 "493-11709-1-ND" H 7650 3000 50  0001 C CNN "OrderN"
	1    7650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2500 7650 2500
Wire Wire Line
	7650 2500 7650 2900
Connection ~ 7250 2500
Wire Wire Line
	7650 2350 7650 2500
Connection ~ 7650 2500
Wire Wire Line
	7650 3100 7650 3650
Wire Wire Line
	7650 3650 7250 3650
Connection ~ 7250 3650
$Comp
L Regulator_Linear:AZ1117-3.3 U10
U 1 1 5DB3B49D
P 5150 4750
F 0 "U10" H 5150 4992 50  0000 C CNN
F 1 "AZ1117-3.3" H 5150 4901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 5150 5000 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 5150 4750 50  0001 C CNN
F 4 "AZ1117EH-3.3TRG1DICT-ND" H 5150 4750 50  0001 C CNN "OrderN"
	1    5150 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C33
U 1 1 5DB3E966
P 4350 5000
F 0 "C33" H 4442 5046 50  0000 L CNN
F 1 "2.2u" H 4442 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4350 5000 50  0001 C CNN
F 3 "~" H 4350 5000 50  0001 C CNN
F 4 "445-5207-1-ND" H 4350 5000 50  0001 C CNN "OrderN"
	1    4350 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C36
U 1 1 5DB3EEB3
P 5900 5000
F 0 "C36" H 5992 5046 50  0000 L CNN
F 1 "2.2u" H 5992 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5900 5000 50  0001 C CNN
F 3 "~" H 5900 5000 50  0001 C CNN
F 4 "445-5207-1-ND" H 5900 5000 50  0001 C CNN "OrderN"
	1    5900 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR043
U 1 1 5DB3F339
P 5900 4550
F 0 "#PWR043" H 5900 4400 50  0001 C CNN
F 1 "+3.3V" H 5915 4723 50  0000 C CNN
F 2 "" H 5900 4550 50  0001 C CNN
F 3 "" H 5900 4550 50  0001 C CNN
	1    5900 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4750 4350 4750
Wire Wire Line
	4350 4750 4350 4900
Wire Wire Line
	4350 5100 4350 5300
Wire Wire Line
	4350 5300 5150 5300
Wire Wire Line
	5900 5300 5900 5100
Wire Wire Line
	5150 5050 5150 5300
Connection ~ 5150 5300
Wire Wire Line
	5150 5300 5900 5300
Wire Wire Line
	5900 4550 5900 4750
Wire Wire Line
	5450 4750 5900 4750
Connection ~ 5900 4750
Wire Wire Line
	5900 4750 5900 4900
$Comp
L power:+5V #PWR040
U 1 1 5DB40012
P 4350 4600
F 0 "#PWR040" H 4350 4450 50  0001 C CNN
F 1 "+5V" H 4365 4773 50  0000 C CNN
F 2 "" H 4350 4600 50  0001 C CNN
F 3 "" H 4350 4600 50  0001 C CNN
	1    4350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4600 4350 4750
Connection ~ 4350 4750
$Comp
L power:GND #PWR042
U 1 1 5DB40AAD
P 5150 5500
F 0 "#PWR042" H 5150 5250 50  0001 C CNN
F 1 "GND" H 5155 5327 50  0000 C CNN
F 2 "" H 5150 5500 50  0001 C CNN
F 3 "" H 5150 5500 50  0001 C CNN
	1    5150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5500 5150 5300
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5DB729AC
P 7250 2350
F 0 "#FLG0102" H 7250 2425 50  0001 C CNN
F 1 "PWR_FLAG" H 7250 2523 50  0000 C CNN
F 2 "" H 7250 2350 50  0001 C CNN
F 3 "~" H 7250 2350 50  0001 C CNN
	1    7250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2350 7250 2500
$Comp
L Device:C_Small C39
U 1 1 5DB73F84
P 3650 3400
F 0 "C39" V 3600 3550 50  0000 C CNN
F 1 "6.8n" V 3512 3400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3650 3400 50  0001 C CNN
F 3 "~" H 3650 3400 50  0001 C CNN
F 4 " 399-1089-1-ND " H 3650 3400 50  0001 C CNN "OrderN"
	1    3650 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 3500 3650 3650
Connection ~ 3650 3650
Wire Wire Line
	3650 3650 3950 3650
Wire Wire Line
	3650 3300 3650 2650
Wire Wire Line
	3650 2650 4700 2650
$EndSCHEMATC
