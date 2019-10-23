EESchema Schematic File Version 5
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L TPS54561DPRR:TPS54561DPRR U6
U 1 1 5DB0C924
P 5150 2700
F 0 "U6" H 5183 3465 50  0000 C CNN
F 1 "TPS54561DPRR" H 5183 3374 50  0000 C CNN
F 2 "rise_elp:TI-DPR" H 5150 2700 50  0001 C CNN
F 3 "" H 5150 2700 50  0001 C CNN
F 4 "296-40803-1-ND" H 5150 2700 50  0001 C CNN "OrderN"
	1    5150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3250 6350 3200
Wire Wire Line
	6350 3000 6350 2950
Connection ~ 6350 2950
Wire Wire Line
	6350 2950 6750 2950
Wire Wire Line
	4200 2200 4450 2200
NoConn ~ 5850 2200
Connection ~ 1450 5450
$Comp
L Device:R_Small R27
U 1 1 5DA3D182
P 8150 1700
F 0 "R27" H 8209 1746 50  0000 L CNN
F 1 "39k" H 8209 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8150 1700 50  0001 C CNN
F 3 "~" H 8150 1700 50  0001 C CNN
	1    8150 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R28
U 1 1 5DA3D562
P 8150 2150
F 0 "R28" H 8091 2196 50  0000 R CNN
F 1 "2.2k" H 8091 2105 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8150 2150 50  0001 C CNN
F 3 "~" H 8150 2150 50  0001 C CNN
	1    8150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2050 8150 1900
$Comp
L power:GND #PWR029
U 1 1 5DA40EC4
P 8150 2500
F 0 "#PWR029" H 8150 2250 50  0001 C CNN
F 1 "GND" H 8155 2327 50  0000 C CNN
F 2 "" H 8150 2500 50  0001 C CNN
F 3 "" H 8150 2500 50  0001 C CNN
	1    8150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2400 8150 2500
Text Notes 8650 2050 0    50   ~ 0
3.2V at 60V
Wire Wire Line
	1250 5450 1450 5450
Wire Wire Line
	1100 4800 1350 4800
Wire Wire Line
	1450 5450 1450 5300
Wire Wire Line
	1450 5450 2050 5450
Wire Wire Line
	1350 4850 1350 4800
Connection ~ 1350 4800
$Comp
L 3PIN_DIODE:3PIN_DIODE U5
U 1 1 5D9C4693
P 1350 5100
F 0 "U5" H 1528 5171 50  0000 L CNN
F 1 "PDS760-13" H 1528 5080 50  0000 L CNN
F 2 "POWERDI5:POWERDI5" H 1350 5100 50  0001 C CNN
F 3 "" H 1350 5100 50  0001 C CNN
F 4 "PDS760DICT-ND" H 1350 5100 50  0001 C CNN "OrderN"
	1    1350 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5450 1250 5300
$Comp
L Device:CP_Small C13
U 1 1 5DA0537E
P 3050 5150
F 0 "C13" H 3138 5196 50  0000 L CNN
F 1 "100u" H 3138 5105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 3050 5150 50  0001 C CNN
F 3 "~" H 3050 5150 50  0001 C CNN
F 4 "https://www.digikey.se/product-detail/en/nichicon/URS1C471MPD1TD/493-11709-1-ND/4320195" H 3050 5150 50  0001 C CNN "digikey"
	1    3050 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5250 3050 5450
Wire Wire Line
	3050 5450 2750 5450
Connection ~ 2750 5450
Connection ~ 8150 1900
$Comp
L Device:C_Small C18
U 1 1 5DAB3CA0
P 8350 2150
F 0 "C18" H 8442 2196 50  0000 L CNN
F 1 "0.1u" H 8442 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8350 2150 50  0001 C CNN
F 3 "~" H 8350 2150 50  0001 C CNN
	1    8350 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2250 8150 2400
Connection ~ 8150 2400
Wire Wire Line
	8150 2400 8350 2400
Wire Wire Line
	8150 1900 8350 1900
Wire Wire Line
	8350 2400 8350 2250
Wire Wire Line
	8350 2050 8350 1900
Connection ~ 8350 1900
Wire Wire Line
	8350 1900 8550 1900
$Comp
L Device:C_Small C10
U 1 1 5D9E5730
P 2250 2700
F 0 "C10" H 2342 2746 50  0000 L CNN
F 1 "2.2u" H 2342 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2250 2700 50  0001 C CNN
F 3 "~" H 2250 2700 50  0001 C CNN
	1    2250 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5D9E9F0B
P 5150 3600
F 0 "#PWR025" H 5150 3350 50  0001 C CNN
F 1 "GND" H 5155 3427 50  0000 C CNN
F 2 "" H 5150 3600 50  0001 C CNN
F 3 "" H 5150 3600 50  0001 C CNN
	1    5150 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3400 5150 3500
$Comp
L power:GND #PWR028
U 1 1 5D9EA2F0
P 6150 2700
F 0 "#PWR028" H 6150 2450 50  0001 C CNN
F 1 "GND" H 6155 2527 50  0000 C CNN
F 2 "" H 6150 2700 50  0001 C CNN
F 3 "" H 6150 2700 50  0001 C CNN
	1    6150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2700 6150 2700
$Comp
L Device:R_Small R21
U 1 1 5D9F2C5D
P 4100 3350
F 0 "R21" H 4159 3396 50  0000 L CNN
F 1 "243k" H 4159 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4100 3350 50  0001 C CNN
F 3 "~" H 4100 3350 50  0001 C CNN
	1    4100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3200 4100 3250
Wire Wire Line
	4100 3200 4450 3200
Wire Wire Line
	4100 3450 4100 3500
Wire Wire Line
	4100 3500 5150 3500
Connection ~ 5150 3500
Wire Wire Line
	5150 3500 5150 3600
$Comp
L Device:C_Small C14
U 1 1 5D9FA875
P 3850 3350
F 0 "C14" H 3600 3450 50  0000 L CNN
F 1 "0.01u" H 3550 3350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3850 3350 50  0001 C CNN
F 3 "~" H 3850 3350 50  0001 C CNN
	1    3850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2950 3850 2950
Wire Wire Line
	3850 2950 3850 3250
Wire Wire Line
	3850 3450 3850 3500
Wire Wire Line
	3850 3500 4100 3500
Connection ~ 4100 3500
$Comp
L Device:C_Small C17
U 1 1 5DA05C7F
P 6750 3350
F 0 "C17" H 6842 3396 50  0000 L CNN
F 1 "47p" H 6842 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6750 3350 50  0001 C CNN
F 3 "~" H 6750 3350 50  0001 C CNN
	1    6750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2950 6750 3250
Wire Wire Line
	5850 2950 6350 2950
Wire Wire Line
	6750 3450 6750 3500
Wire Wire Line
	6750 3500 6350 3500
$Comp
L Device:R_Small R26
U 1 1 5DA0D18E
P 6350 3100
F 0 "R26" H 6409 3146 50  0000 L CNN
F 1 "16.9k" H 6409 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6350 3100 50  0001 C CNN
F 3 "~" H 6350 3100 50  0001 C CNN
	1    6350 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5DA0F7F3
P 6350 3350
F 0 "C16" H 6258 3396 50  0000 R CNN
F 1 "4700p" H 6258 3305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6350 3350 50  0001 C CNN
F 3 "~" H 6350 3350 50  0001 C CNN
	1    6350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3450 6350 3500
Connection ~ 6350 3500
Wire Wire Line
	6350 3500 5150 3500
Wire Wire Line
	5850 2450 6200 2450
Wire Wire Line
	6200 1800 4200 1800
Wire Wire Line
	4200 1800 4200 2200
$Comp
L Device:C_Small C15
U 1 1 5DA1942D
P 6200 2100
F 0 "C15" H 6292 2146 50  0000 L CNN
F 1 "0.1u" H 6292 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6200 2100 50  0001 C CNN
F 3 "~" H 6200 2100 50  0001 C CNN
	1    6200 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1800 6200 2000
Wire Wire Line
	6200 2450 6200 2200
$Comp
L Device:C_Small C9
U 1 1 5DA48ADB
P 2050 5150
F 0 "C9" H 2142 5196 50  0000 L CNN
F 1 "2.2u" H 2142 5105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2050 5150 50  0001 C CNN
F 3 "~" H 2050 5150 50  0001 C CNN
	1    2050 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5DA4D56B
P 2400 5550
F 0 "#PWR020" H 2400 5300 50  0001 C CNN
F 1 "GND" H 2405 5377 50  0000 C CNN
F 2 "" H 2400 5550 50  0001 C CNN
F 3 "" H 2400 5550 50  0001 C CNN
	1    2400 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5250 2750 5450
Wire Wire Line
	2750 5450 2400 5450
Wire Wire Line
	2400 5450 2400 5250
Wire Wire Line
	2050 5450 2050 5250
Connection ~ 2400 5450
Wire Wire Line
	2400 5450 2400 5550
Wire Wire Line
	2750 5050 2750 4800
Wire Wire Line
	2750 4800 2400 4800
Wire Wire Line
	2400 4800 2400 5050
Connection ~ 2750 4800
Wire Wire Line
	2400 4800 2050 4800
Wire Wire Line
	2050 4800 2050 5050
Connection ~ 2400 4800
Wire Wire Line
	2050 5450 2400 5450
Connection ~ 2050 5450
$Comp
L Device:L_Core_Iron L1
U 1 1 5DA80BA1
P 1800 4800
F 0 "L1" V 2025 4800 50  0000 C CNN
F 1 "7.2u" V 1934 4800 50  0000 C CNN
F 2 "Inductor_SMD:L_12x12mm_H8mm" H 1800 4800 50  0001 C CNN
F 3 "~" H 1800 4800 50  0001 C CNN
	1    1800 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 4800 1950 4800
Connection ~ 2050 4800
Wire Wire Line
	1350 4800 1650 4800
Text Label 5850 3200 0    50   ~ 0
FB
Text GLabel 1900 2450 0    50   Input ~ 0
PWR_IN
Wire Wire Line
	8150 1800 8150 1900
Text HLabel 8550 1900 2    50   Input ~ 0
PWR_DIV
Wire Wire Line
	8150 1600 8150 1550
Wire Wire Line
	8150 1550 8000 1550
Text Label 6200 2450 0    50   ~ 0
SW
Text Label 1100 4800 2    50   ~ 0
SW
$Comp
L Device:R_Small R19
U 1 1 5DA9E004
P 3600 5000
F 0 "R19" H 3658 4954 50  0000 L CNN
F 1 "56k" H 3658 5045 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3600 5000 50  0001 C CNN
F 3 "~" H 3600 5000 50  0001 C CNN
	1    3600 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 4800 3800 4800
Wire Wire Line
	3050 5050 3050 4800
Text GLabel 3800 4800 2    50   Input ~ 0
OUT_RAIL
Text Label 6300 5150 0    50   ~ 0
FB
Wire Wire Line
	3600 5150 3600 5100
Wire Wire Line
	3600 5150 4200 5150
Wire Wire Line
	3050 4800 3600 4800
Wire Wire Line
	3600 4900 3600 4800
Connection ~ 3600 4800
Wire Wire Line
	2750 4800 3050 4800
Connection ~ 3050 4800
Text GLabel 8000 1550 0    50   Input ~ 0
PWR_IN
Connection ~ 8150 3300
Wire Wire Line
	8150 3300 8350 3300
Wire Wire Line
	8150 3800 8350 3800
Wire Wire Line
	8350 3450 8350 3300
Wire Wire Line
	8150 3800 8150 3900
Connection ~ 8150 3800
Connection ~ 8350 3300
Wire Wire Line
	8350 3300 8550 3300
Wire Wire Line
	8150 3200 8150 3300
$Comp
L Device:C_Small C19
U 1 1 5DB4A713
P 8350 3550
F 0 "C19" H 8442 3596 50  0000 L CNN
F 1 "0.1u" H 8442 3505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8350 3550 50  0001 C CNN
F 3 "~" H 8350 3550 50  0001 C CNN
	1    8350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2950 8000 2950
$Comp
L Device:R_Small R29
U 1 1 5DB4A723
P 8150 3100
F 0 "R29" H 8209 3146 50  0000 L CNN
F 1 "39k" H 8209 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8150 3100 50  0001 C CNN
F 3 "~" H 8150 3100 50  0001 C CNN
	1    8150 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R30
U 1 1 5DB4A731
P 8150 3550
F 0 "R30" H 8091 3596 50  0000 R CNN
F 1 "2.2k" H 8091 3505 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8150 3550 50  0001 C CNN
F 3 "~" H 8150 3550 50  0001 C CNN
	1    8150 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3450 8150 3300
$Comp
L power:GND #PWR030
U 1 1 5DB4A73F
P 8150 3900
F 0 "#PWR030" H 8150 3650 50  0001 C CNN
F 1 "GND" H 8155 3727 50  0000 C CNN
F 2 "" H 8150 3900 50  0001 C CNN
F 3 "" H 8150 3900 50  0001 C CNN
	1    8150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3000 8150 2950
Wire Wire Line
	8150 3650 8150 3800
Wire Wire Line
	8350 3800 8350 3650
Text HLabel 8550 3300 2    50   Input ~ 0
RAIL_DIV
Text GLabel 8000 2950 0    50   Input ~ 0
OUT_RAIL
Text Notes 8700 3450 0    50   ~ 0
3.2V at 60V
Text Notes 3000 2300 0    50   ~ 0
The EN pin has an internal\npull-up that enables\nthe TPS54561 if the \npin is left flaoting. 
Text HLabel 3050 2700 0    50   Input ~ 0
ENABLE
$Comp
L Device:R_Small R18
U 1 1 5DAF31CA
P 3250 2900
F 0 "R18" H 3191 2946 50  0000 R CNN
F 1 "2.2k" H 3191 2855 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3250 2900 50  0001 C CNN
F 3 "~" H 3250 2900 50  0001 C CNN
	1    3250 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2700 3250 2700
Wire Wire Line
	3250 2800 3250 2700
Connection ~ 3250 2700
Wire Wire Line
	3250 2700 3050 2700
$Comp
L power:GND #PWR021
U 1 1 5DAF3CDA
P 3250 3150
F 0 "#PWR021" H 3250 2900 50  0001 C CNN
F 1 "GND" H 3255 2977 50  0000 C CNN
F 2 "" H 3250 3150 50  0001 C CNN
F 3 "" H 3250 3150 50  0001 C CNN
	1    3250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3000 3250 3150
$Comp
L power:GND #PWR022
U 1 1 5DB06C2F
P 3600 6250
F 0 "#PWR022" H 3600 6000 50  0001 C CNN
F 1 "GND" H 3605 6077 50  0000 C CNN
F 2 "" H 3600 6250 50  0001 C CNN
F 3 "" H 3600 6250 50  0001 C CNN
	1    3600 6250
	1    0    0    -1  
$EndComp
Text HLabel 3250 5700 1    50   Input ~ 0
VSEL1
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 5DB06C70
P 3500 5800
F 0 "Q1" H 3704 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" V 3400 5200 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3700 5900 50  0001 C CNN
F 3 "~" H 3500 5800 50  0001 C CNN
F 4 "BSS138-FDICT-ND" H 3500 5800 50  0001 C CNN "OrderN"
	1    3500 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R20
U 1 1 5DB06C4D
P 3600 5400
F 0 "R20" V 3550 5200 50  0000 L CNN
F 1 "1k" V 3500 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3600 5400 50  0001 C CNN
F 3 "~" H 3600 5400 50  0001 C CNN
	1    3600 5400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 5800 3250 5800
Wire Wire Line
	3250 5800 3250 5700
Wire Wire Line
	3600 5500 3600 5600
Wire Wire Line
	3600 5300 3600 5150
Connection ~ 3600 5150
Wire Wire Line
	3600 6000 3600 6250
Wire Wire Line
	4200 6000 4200 6250
Wire Wire Line
	4200 5500 4200 5600
$Comp
L power:GND #PWR023
U 1 1 5DAEFB21
P 4200 6250
F 0 "#PWR023" H 4200 6000 50  0001 C CNN
F 1 "GND" H 4205 6077 50  0000 C CNN
F 2 "" H 4200 6250 50  0001 C CNN
F 3 "" H 4200 6250 50  0001 C CNN
	1    4200 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R22
U 1 1 5DAEFB2F
P 4200 5400
F 0 "R22" V 4150 5200 50  0000 L CNN
F 1 "2k" V 4100 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4200 5400 50  0001 C CNN
F 3 "~" H 4200 5400 50  0001 C CNN
	1    4200 5400
	-1   0    0    1   
$EndComp
Text HLabel 3850 5700 1    50   Input ~ 0
VSEL2
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 5DAEFB40
P 4100 5800
F 0 "Q2" H 4304 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" V 4000 5200 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4300 5900 50  0001 C CNN
F 3 "~" H 4100 5800 50  0001 C CNN
F 4 "BSS138-FDICT-ND" H 4100 5800 50  0001 C CNN "OrderN"
	1    4100 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5800 3850 5800
Wire Wire Line
	3850 5800 3850 5700
Wire Wire Line
	4800 6000 4800 6250
$Comp
L Device:Q_NMOS_GSD Q4
U 1 1 5DAF2789
P 5300 5800
F 0 "Q4" H 5504 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" V 5200 5200 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5500 5900 50  0001 C CNN
F 3 "~" H 5300 5800 50  0001 C CNN
F 4 "BSS138-FDICT-ND" H 5300 5800 50  0001 C CNN "OrderN"
	1    5300 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5800 5050 5800
Wire Wire Line
	5400 6000 5400 6250
Wire Wire Line
	5400 5500 5400 5600
Wire Wire Line
	5050 5800 5050 5700
Wire Wire Line
	4800 5500 4800 5600
$Comp
L power:GND #PWR024
U 1 1 5DAF279B
P 4800 6250
F 0 "#PWR024" H 4800 6000 50  0001 C CNN
F 1 "GND" H 4805 6077 50  0000 C CNN
F 2 "" H 4800 6250 50  0001 C CNN
F 3 "" H 4800 6250 50  0001 C CNN
	1    4800 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R23
U 1 1 5DAF27A9
P 4800 5400
F 0 "R23" V 4750 5200 50  0000 L CNN
F 1 "4k" V 4700 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4800 5400 50  0001 C CNN
F 3 "~" H 4800 5400 50  0001 C CNN
	1    4800 5400
	-1   0    0    1   
$EndComp
Text HLabel 4450 5700 1    50   Input ~ 0
VSEL3
$Comp
L Device:Q_NMOS_GSD Q3
U 1 1 5DAF27BA
P 4700 5800
F 0 "Q3" H 4904 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" V 4600 5200 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4900 5900 50  0001 C CNN
F 3 "~" H 4700 5800 50  0001 C CNN
F 4 "BSS138-FDICT-ND" H 4700 5800 50  0001 C CNN "OrderN"
	1    4700 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5800 4450 5800
Wire Wire Line
	4450 5800 4450 5700
Text HLabel 5050 5700 1    50   Input ~ 0
VSEL4
$Comp
L Device:R_Small R24
U 1 1 5DAF27CB
P 5400 5400
F 0 "R24" V 5350 5200 50  0000 L CNN
F 1 "8k" V 5300 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5400 5400 50  0001 C CNN
F 3 "~" H 5400 5400 50  0001 C CNN
	1    5400 5400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5DAF27D8
P 5400 6250
F 0 "#PWR026" H 5400 6000 50  0001 C CNN
F 1 "GND" H 5405 6077 50  0000 C CNN
F 2 "" H 5400 6250 50  0001 C CNN
F 3 "" H 5400 6250 50  0001 C CNN
	1    5400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 6000 6050 6250
Wire Wire Line
	6050 5500 6050 5600
$Comp
L power:GND #PWR027
U 1 1 5DAF54E6
P 6050 6250
F 0 "#PWR027" H 6050 6000 50  0001 C CNN
F 1 "GND" H 6055 6077 50  0000 C CNN
F 2 "" H 6050 6250 50  0001 C CNN
F 3 "" H 6050 6250 50  0001 C CNN
	1    6050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R25
U 1 1 5DAF54F4
P 6050 5400
F 0 "R25" V 6000 5200 50  0000 L CNN
F 1 "16k" V 5950 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6050 5400 50  0001 C CNN
F 3 "~" H 6050 5400 50  0001 C CNN
	1    6050 5400
	-1   0    0    1   
$EndComp
Text HLabel 5700 5700 1    50   Input ~ 0
VSEL5
$Comp
L Device:Q_NMOS_GSD Q5
U 1 1 5DAF5505
P 5950 5800
F 0 "Q5" H 6154 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" V 5850 5200 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6150 5900 50  0001 C CNN
F 3 "~" H 5950 5800 50  0001 C CNN
F 4 "BSS138-FDICT-ND" H 5950 5800 50  0001 C CNN "OrderN"
	1    5950 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5800 5700 5800
Wire Wire Line
	5700 5800 5700 5700
Wire Wire Line
	6050 5300 6050 5150
Connection ~ 6050 5150
Wire Wire Line
	6050 5150 6300 5150
Wire Wire Line
	5400 5300 5400 5150
Connection ~ 5400 5150
Wire Wire Line
	5400 5150 6050 5150
Wire Wire Line
	4800 5300 4800 5150
Connection ~ 4800 5150
Wire Wire Line
	4800 5150 5400 5150
Wire Wire Line
	4200 5300 4200 5150
Connection ~ 4200 5150
Wire Wire Line
	4200 5150 4800 5150
Wire Wire Line
	1900 2450 2250 2450
Wire Wire Line
	2250 2600 2250 2450
Connection ~ 2250 2450
Wire Wire Line
	2250 2450 4450 2450
Wire Wire Line
	2250 2800 2250 3500
Wire Wire Line
	2250 3500 3850 3500
Connection ~ 3850 3500
$Comp
L Device:CP_Small C12
U 1 1 5DB316A2
P 2750 5150
F 0 "C12" H 2838 5196 50  0000 L CNN
F 1 "100u" H 2838 5105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 2750 5150 50  0001 C CNN
F 3 "~" H 2750 5150 50  0001 C CNN
F 4 "https://www.digikey.se/product-detail/en/nichicon/URS1C471MPD1TD/493-11709-1-ND/4320195" H 2750 5150 50  0001 C CNN "digikey"
	1    2750 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C11
U 1 1 5DB31A9E
P 2400 5150
F 0 "C11" H 2488 5196 50  0000 L CNN
F 1 "100u" H 2488 5105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 2400 5150 50  0001 C CNN
F 3 "~" H 2400 5150 50  0001 C CNN
F 4 "https://www.digikey.se/product-detail/en/nichicon/URS1C471MPD1TD/493-11709-1-ND/4320195" H 2400 5150 50  0001 C CNN "digikey"
	1    2400 5150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5DB5C3BA
P 3600 4650
F 0 "#FLG0101" H 3600 4725 50  0001 C CNN
F 1 "PWR_FLAG" H 3600 4823 50  0000 C CNN
F 2 "" H 3600 4650 50  0001 C CNN
F 3 "~" H 3600 4650 50  0001 C CNN
	1    3600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4650 3600 4800
$EndSCHEMATC