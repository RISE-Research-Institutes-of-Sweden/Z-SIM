EESchema Schematic File Version 5
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
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
L Device:LED_Small D1
U 1 1 5DB19208
P 4750 1450
F 0 "D1" H 4900 1400 50  0000 C CNN
F 1 "GREEN" H 4550 1400 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4750 1450 50  0001 C CNN
F 3 "~" V 4750 1450 50  0001 C CNN
F 4 "160-1446-1-ND" H 4750 1450 50  0001 C CNN "OrderN"
	1    4750 1450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 5DB1AB6F
P 4750 1550
F 0 "D2" H 4900 1600 50  0000 C CNN
F 1 "RED" H 4550 1600 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4750 1550 50  0001 C CNN
F 3 "~" V 4750 1550 50  0001 C CNN
F 4 "SML-D12U1WT86CT-ND" H 4750 1550 50  0001 C CNN "OrderN"
	1    4750 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 1450 4350 1450
Wire Wire Line
	4350 1550 4650 1550
$Comp
L Device:R_Small R7
U 1 1 5DB1CED4
P 5200 1450
F 0 "R7" V 5150 1600 50  0000 C CNN
F 1 "1k" V 5100 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5200 1450 50  0001 C CNN
F 3 "~" H 5200 1450 50  0001 C CNN
F 4 " 311-1.00KHRCT-ND " H 5200 1450 50  0001 C CNN "OrderN"
	1    5200 1450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5DB1DC3B
P 5200 1550
F 0 "R8" V 5300 1700 50  0000 C CNN
F 1 "1k" V 5300 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5200 1550 50  0001 C CNN
F 3 "~" H 5200 1550 50  0001 C CNN
F 4 " 311-1.00KHRCT-ND " H 5200 1550 50  0001 C CNN "OrderN"
	1    5200 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5DB1E5CC
P 5500 1600
F 0 "#PWR012" H 5500 1350 50  0001 C CNN
F 1 "GND" H 5650 1600 50  0000 C CNN
F 2 "" H 5500 1600 50  0001 C CNN
F 3 "" H 5500 1600 50  0001 C CNN
	1    5500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1450 5500 1450
Wire Wire Line
	5500 1450 5500 1550
Wire Wire Line
	5300 1550 5500 1550
Connection ~ 5500 1550
Wire Wire Line
	5500 1550 5500 1600
Wire Wire Line
	5100 1450 4850 1450
Wire Wire Line
	4850 1550 5100 1550
$Comp
L Connector:Conn_01x06_Male J4
U 1 1 5DB1FD67
P 1950 1400
F 0 "J4" H 1923 1282 50  0000 R CNN
F 1 "SWD" H 1923 1373 50  0000 R CNN
F 2 "Connector_JST:JST_PH_B6B-PH-K_1x06_P2.00mm_Vertical" H 1950 1400 50  0001 C CNN
F 3 "~" H 1950 1400 50  0001 C CNN
F 4 "455-1708-ND" H 1950 1400 50  0001 C CNN "OrderN"
	1    1950 1400
	1    0    0    1   
$EndComp
Wire Wire Line
	3100 1450 2700 1450
Wire Wire Line
	2700 1450 2700 1200
Wire Wire Line
	2700 1200 2150 1200
Wire Wire Line
	3100 1550 2550 1550
Wire Wire Line
	2550 1550 2550 1400
Wire Wire Line
	2550 1400 2150 1400
Wire Wire Line
	3100 1650 2450 1650
Wire Wire Line
	2450 1650 2450 1500
Wire Wire Line
	2450 1500 2150 1500
NoConn ~ 2150 1600
$Comp
L power:GND #PWR03
U 1 1 5DB24EAD
P 2250 1700
F 0 "#PWR03" H 2250 1450 50  0001 C CNN
F 1 "GND" H 2350 1700 50  0000 C CNN
F 2 "" H 2250 1700 50  0001 C CNN
F 3 "" H 2250 1700 50  0001 C CNN
	1    2250 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 5DB256DF
P 2250 1000
F 0 "#PWR02" H 2250 850 50  0001 C CNN
F 1 "+3.3V" H 2265 1173 50  0000 C CNN
F 2 "" H 2250 1000 50  0001 C CNN
F 3 "" H 2250 1000 50  0001 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1000 2250 1100
Wire Wire Line
	2250 1100 2150 1100
Wire Wire Line
	2150 1300 2250 1300
Wire Wire Line
	2250 1300 2250 1700
$Comp
L Connector:USB_B_Micro J1
U 1 1 5DB266AE
P 1250 1950
F 0 "J1" H 1307 2417 50  0000 C CNN
F 1 "USB_B_Micro" H 1307 2326 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 1400 1900 50  0001 C CNN
F 3 "~" H 1400 1900 50  0001 C CNN
F 4 " WM1399CT-ND " H 1250 1950 50  0001 C CNN "OrderN"
	1    1250 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DB289E5
P 1150 2550
F 0 "#PWR01" H 1150 2300 50  0001 C CNN
F 1 "GND" H 1250 2550 50  0000 C CNN
F 2 "" H 1150 2550 50  0001 C CNN
F 3 "" H 1150 2550 50  0001 C CNN
	1    1150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2550 1150 2450
Wire Wire Line
	1250 2350 1250 2450
Wire Wire Line
	1250 2450 1150 2450
Connection ~ 1150 2450
Wire Wire Line
	1150 2450 1150 2350
NoConn ~ 1550 2150
NoConn ~ 1550 1750
$Comp
L Device:R_Small R1
U 1 1 5DB295F5
P 2300 2500
F 0 "R1" V 2400 2500 50  0000 C CNN
F 1 "10k" V 2200 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2300 2500 50  0001 C CNN
F 3 "~" H 2300 2500 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 2300 2500 50  0001 C CNN "OrderN"
	1    2300 2500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5DB2C809
P 1900 2700
F 0 "J2" H 2008 2881 50  0000 C CNN
F 1 "TEMP1" V 1800 2650 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 1900 2700 50  0001 C CNN
F 3 "~" H 1900 2700 50  0001 C CNN
F 4 "455-1704-ND" H 1900 2700 50  0001 C CNN "OrderN"
	1    1900 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2700 2300 2700
Wire Wire Line
	2300 2700 2300 2600
$Comp
L power:+3.3VA #PWR04
U 1 1 5DB2E221
P 2300 2350
F 0 "#PWR04" H 2300 2200 50  0001 C CNN
F 1 "+3.3VA" H 2315 2523 50  0000 C CNN
F 2 "" H 2300 2350 50  0001 C CNN
F 3 "" H 2300 2350 50  0001 C CNN
	1    2300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2350 2300 2400
Wire Wire Line
	2300 2700 2500 2700
Wire Wire Line
	2500 2700 2500 2350
Connection ~ 2300 2700
Connection ~ 2300 2800
Connection ~ 2600 2350
Wire Wire Line
	2300 2800 2300 2850
Wire Wire Line
	2100 2800 2300 2800
Wire Wire Line
	2600 2650 2600 2800
Wire Wire Line
	2600 2350 3100 2350
Wire Wire Line
	2600 2450 2600 2350
Wire Wire Line
	2600 2800 2300 2800
$Comp
L Device:C_Small C1
U 1 1 5DB2E9D9
P 2600 2550
F 0 "C1" H 2692 2596 50  0000 L CNN
F 1 "2.2u" H 2692 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2600 2550 50  0001 C CNN
F 3 "~" H 2600 2550 50  0001 C CNN
F 4 "490-10731-1-ND" H 2600 2550 50  0001 C CNN "OrderN"
	1    2600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2350 2600 2350
$Comp
L Device:R_Small R2
U 1 1 5DB31B04
P 2300 3500
F 0 "R2" V 2400 3500 50  0000 C CNN
F 1 "10k" V 2200 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2300 3500 50  0001 C CNN
F 3 "~" H 2300 3500 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 2300 3500 50  0001 C CNN "OrderN"
	1    2300 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 3700 2500 3350
Wire Wire Line
	2100 3700 2300 3700
Wire Wire Line
	2500 3350 2600 3350
Wire Wire Line
	2300 3700 2500 3700
Wire Wire Line
	2300 3350 2300 3400
Connection ~ 2300 3700
$Comp
L Device:C_Small C2
U 1 1 5DB31B25
P 2600 3550
F 0 "C2" H 2692 3596 50  0000 L CNN
F 1 "2.2u" H 2692 3505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2600 3550 50  0001 C CNN
F 3 "~" H 2600 3550 50  0001 C CNN
F 4 "490-10731-1-ND" H 2600 3550 50  0001 C CNN "OrderN"
	1    2600 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR06
U 1 1 5DB31B32
P 2300 3350
F 0 "#PWR06" H 2300 3200 50  0001 C CNN
F 1 "+3.3VA" H 2315 3523 50  0000 C CNN
F 2 "" H 2300 3350 50  0001 C CNN
F 3 "" H 2300 3350 50  0001 C CNN
	1    2300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3800 2300 3800
Wire Wire Line
	2600 3450 2600 3350
Wire Wire Line
	2600 3650 2600 3800
Wire Wire Line
	2100 3800 2300 3800
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5DB31B44
P 1900 3700
F 0 "J3" H 2008 3881 50  0000 C CNN
F 1 "TEMP1" V 1800 3650 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 1900 3700 50  0001 C CNN
F 3 "~" H 1900 3700 50  0001 C CNN
F 4 "455-1704-ND" H 1900 3700 50  0001 C CNN "OrderN"
	1    1900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3700 2300 3600
Wire Wire Line
	2300 3800 2300 3850
Connection ~ 2300 3800
Wire Wire Line
	2600 3350 2600 3000
Wire Wire Line
	2600 3000 2950 3000
Wire Wire Line
	2950 3000 2950 2450
Wire Wire Line
	2950 2450 3100 2450
Connection ~ 2600 3350
$Sheet
S 4900 1850 1100 700 
U 5DB39EF7
F0 "output" 50
F1 "output.sch" 50
F2 "V_OUT1" I L 4900 1950 50 
F3 "ES1" I L 4900 2350 50 
F4 "I_SENSE" I L 4900 2150 50 
F5 "OUT1" I R 6000 1950 50 
F6 "OUT2" I R 6000 2050 50 
F7 "V_OUT2" I L 4900 2050 50 
F8 "ES2" I L 4900 2450 50 
F9 "I_SENSE_4T" I L 4900 2250 50 
F10 "SENSE_4T_1" I R 6000 2350 50 
F11 "SENSE_4T_2" I R 6000 2450 50 
$EndSheet
Wire Wire Line
	4900 1950 4350 1950
Wire Wire Line
	4350 2050 4900 2050
Wire Wire Line
	4900 2150 4350 2150
Wire Wire Line
	4350 2250 4900 2250
Wire Wire Line
	4900 2350 4350 2350
Wire Wire Line
	4350 2450 4900 2450
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 5DB088A3
P 6500 1950
F 0 "J6" H 6250 1950 50  0000 R CNN
F 1 "OUT1" H 6500 1950 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 6500 1950 50  0001 C CNN
F 3 "~" H 6500 1950 50  0001 C CNN
F 4 "n/a" H 6500 1950 50  0001 C CNN "OrderN"
	1    6500 1950
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 5DB0A417
P 6500 2350
F 0 "J8" H 6250 2350 50  0000 R CNN
F 1 "4T_1" H 6500 2350 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 6500 2350 50  0001 C CNN
F 3 "~" H 6500 2350 50  0001 C CNN
F 4 "n/a" H 6500 2350 50  0001 C CNN "OrderN"
	1    6500 2350
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 5DB0AA05
P 6500 2450
F 0 "J9" H 6250 2450 50  0000 R CNN
F 1 "4T_2" H 6500 2450 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 6500 2450 50  0001 C CNN
F 3 "~" H 6500 2450 50  0001 C CNN
F 4 "n/a" H 6500 2450 50  0001 C CNN "OrderN"
	1    6500 2450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 5DB09EB9
P 6500 2050
F 0 "J7" H 6250 2050 50  0000 R CNN
F 1 "OUT2" H 6500 2050 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 6500 2050 50  0001 C CNN
F 3 "~" H 6500 2050 50  0001 C CNN
F 4 "n/a" H 6500 2050 50  0001 C CNN "OrderN"
	1    6500 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 2350 6000 2350
Wire Wire Line
	6000 2450 6300 2450
Wire Wire Line
	6300 2050 6000 2050
Wire Wire Line
	6000 1950 6300 1950
$Sheet
S 4900 2750 550  900 
U 5DB0C028
F0 "DCDC" 50
F1 "DCDC.sch" 50
F2 "PWR_DIV" I L 4900 2950 50 
F3 "RAIL_DIV" I L 4900 2850 50 
F4 "ENABLE" I L 4900 3550 50 
F5 "VSEL1" I L 4900 3050 50 
F6 "VSEL2" I L 4900 3150 50 
F7 "VSEL3" I L 4900 3250 50 
F8 "VSEL4" I L 4900 3350 50 
F9 "VSEL5" I L 4900 3450 50 
$EndSheet
Text Notes 1250 2800 0    50   ~ 0
To heatsink
Text Notes 1250 3800 0    50   ~ 0
To heatsink
Text Notes 6950 2050 0    50   ~ 0
2T / 4T Voltage
Text Notes 6950 2400 0    50   ~ 0
4T Current
$Comp
L Connector:Micro_SD_Card_Det J5
U 1 1 5DB5A629
P 6400 4900
F 0 "J5" H 6350 5717 50  0000 C CNN
F 1 "Micro_SD_Card_Det" H 6350 5626 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Hirose_DM3D-SF" H 8450 5600 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 6400 5000 50  0001 C CNN
F 4 "HR1941CT-ND" H 6400 4900 50  0001 C CNN "OrderN"
	1    6400 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5DB60C49
P 4650 5550
F 0 "C3" H 4742 5596 50  0000 L CNN
F 1 "2.2u" H 4742 5505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4650 5550 50  0001 C CNN
F 3 "~" H 4650 5550 50  0001 C CNN
F 4 "490-10731-1-ND" H 4650 5550 50  0001 C CNN "OrderN"
	1    4650 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5DB5AF6A
P 4650 5800
F 0 "#PWR011" H 4650 5550 50  0001 C CNN
F 1 "GND" H 4655 5627 50  0000 C CNN
F 2 "" H 4650 5800 50  0001 C CNN
F 3 "" H 4650 5800 50  0001 C CNN
	1    4650 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 5DB62857
P 4650 4050
F 0 "#PWR010" H 4650 3900 50  0001 C CNN
F 1 "+3.3V" V 4550 4050 50  0000 C CNN
F 2 "" H 4650 4050 50  0001 C CNN
F 3 "" H 4650 4050 50  0001 C CNN
	1    4650 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R11
U 1 1 5DB638EB
P 5400 4350
F 0 "R11" V 5350 4200 50  0000 C CNN
F 1 "10k" V 5400 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5400 4350 50  0001 C CNN
F 3 "~" H 5400 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 5400 4350 50  0001 C CNN "OrderN"
	1    5400 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5DB67B15
P 5300 4350
F 0 "R10" V 5250 4200 50  0000 C CNN
F 1 "10k" V 5300 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5300 4350 50  0001 C CNN
F 3 "~" H 5300 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 5300 4350 50  0001 C CNN "OrderN"
	1    5300 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5DB67C3C
P 5200 4350
F 0 "R9" V 5150 4200 50  0000 C CNN
F 1 "10k" V 5200 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5200 4350 50  0001 C CNN
F 3 "~" H 5200 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 5200 4350 50  0001 C CNN "OrderN"
	1    5200 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5DB67D7B
P 5100 4350
F 0 "R6" V 5050 4200 50  0000 C CNN
F 1 "10k" V 5100 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5100 4350 50  0001 C CNN
F 3 "~" H 5100 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 5100 4350 50  0001 C CNN "OrderN"
	1    5100 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5DB67EEA
P 5000 4350
F 0 "R5" V 4950 4200 50  0000 C CNN
F 1 "10k" V 5000 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5000 4350 50  0001 C CNN
F 3 "~" H 5000 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 5000 4350 50  0001 C CNN "OrderN"
	1    5000 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5DB682C9
P 4900 4350
F 0 "R4" V 4850 4200 50  0000 C CNN
F 1 "10k" V 4900 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4900 4350 50  0001 C CNN
F 3 "~" H 4900 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 4900 4350 50  0001 C CNN "OrderN"
	1    4900 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5DB68588
P 4800 4350
F 0 "R3" V 4750 4200 50  0000 C CNN
F 1 "10k" V 4800 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4800 4350 50  0001 C CNN
F 3 "~" H 4800 4350 50  0001 C CNN
F 4 " 311-10.0KHRCT-ND" H 4800 4350 50  0001 C CNN "OrderN"
	1    4800 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 4500 5400 4500
Wire Wire Line
	4350 4600 5300 4600
Wire Wire Line
	5500 4700 5200 4700
Wire Wire Line
	4350 4900 5100 4900
Wire Wire Line
	5500 5100 5000 5100
Wire Wire Line
	5500 5200 4900 5200
Wire Wire Line
	5500 5300 4800 5300
Wire Wire Line
	5400 4450 5400 4500
Connection ~ 5400 4500
Wire Wire Line
	5400 4500 4350 4500
Wire Wire Line
	5300 4450 5300 4600
Connection ~ 5300 4600
Wire Wire Line
	5300 4600 5500 4600
Wire Wire Line
	5200 4450 5200 4700
Connection ~ 5200 4700
Wire Wire Line
	5200 4700 4350 4700
Wire Wire Line
	5100 4450 5100 4900
Connection ~ 5100 4900
Wire Wire Line
	5100 4900 5500 4900
Wire Wire Line
	5000 4450 5000 5100
Connection ~ 5000 5100
Wire Wire Line
	5000 5100 4350 5100
Wire Wire Line
	4900 4450 4900 5200
Connection ~ 4900 5200
Wire Wire Line
	4900 5200 4350 5200
Wire Wire Line
	4800 4450 4800 5300
Connection ~ 4800 5300
Wire Wire Line
	4800 5300 4350 5300
Wire Wire Line
	4650 4800 5500 4800
Wire Wire Line
	4650 4050 4650 4100
Wire Wire Line
	4650 4100 4800 4100
Wire Wire Line
	4800 4100 4800 4250
Connection ~ 4650 4100
Wire Wire Line
	4650 4100 4650 4800
Wire Wire Line
	4800 4100 4900 4100
Wire Wire Line
	4900 4100 4900 4250
Connection ~ 4800 4100
Wire Wire Line
	4900 4100 5000 4100
Wire Wire Line
	5000 4100 5000 4250
Connection ~ 4900 4100
Wire Wire Line
	5000 4100 5100 4100
Wire Wire Line
	5100 4100 5100 4250
Connection ~ 5000 4100
Wire Wire Line
	5100 4100 5200 4100
Wire Wire Line
	5200 4100 5200 4250
Connection ~ 5100 4100
Wire Wire Line
	5200 4100 5300 4100
Wire Wire Line
	5300 4100 5300 4250
Connection ~ 5200 4100
Wire Wire Line
	5300 4100 5400 4100
Wire Wire Line
	5400 4100 5400 4250
Connection ~ 5300 4100
Wire Wire Line
	4650 5650 4650 5750
Wire Wire Line
	4650 5750 5250 5750
Wire Wire Line
	5250 5750 5250 5400
Wire Wire Line
	5250 5000 5500 5000
Connection ~ 4650 5750
Wire Wire Line
	4650 5750 4650 5800
Wire Wire Line
	5500 5400 5250 5400
Connection ~ 5250 5400
Wire Wire Line
	5250 5400 5250 5000
Wire Wire Line
	4650 5450 4650 4800
Connection ~ 4650 4800
Wire Wire Line
	7250 5400 7250 5750
Wire Wire Line
	7250 5750 5250 5750
Wire Wire Line
	7200 5400 7250 5400
Connection ~ 5250 5750
$Sheet
S 3100 1300 1250 5650
U 5DADB8FB
F0 "MCU" 50
F1 "MCU.sch" 50
F2 "SWDIO" I L 3100 1550 50 
F3 "SWCLK" I L 3100 1450 50 
F4 "NRST" I L 3100 1650 50 
F5 "PB0_LED_GREEN" I R 4350 1450 50 
F6 "PB1_LED_RED" I R 4350 1550 50 
F7 "USB_DM" I L 3100 2050 50 
F8 "USB_DP" I L 3100 1950 50 
F9 "PA4_DAC1" I R 4350 1950 50 
F10 "PA5_DAC2" I R 4350 2050 50 
F11 "PA0_SHUNT1" I R 4350 2150 50 
F12 "PA1_SHUNT2" I R 4350 2250 50 
F13 "PA2_DCDC_RAIL" I R 4350 2850 50 
F14 "PB2_VSEL_1" I R 4350 3050 50 
F15 "PB3_VSEL_2" I R 4350 3150 50 
F16 "PB4_VSEL_3" I R 4350 3250 50 
F17 "PB5_VSEL_4" I R 4350 3350 50 
F18 "PB6_VSEL_5" I R 4350 3450 50 
F19 "PC0_TEMP1" I L 3100 2350 50 
F20 "PC1_TEMP2" I L 3100 2450 50 
F21 "PA6_ES1" I R 4350 2350 50 
F22 "PA7_ES2" I R 4350 2450 50 
F23 "PA3_DCDC_IN" I R 4350 2950 50 
F24 "SDIO_CMD" I R 4350 4700 50 
F25 "SDIO_D0" I R 4350 5100 50 
F26 "SDIO_D1" I R 4350 5200 50 
F27 "SDIO_D2" I R 4350 4500 50 
F28 "SDIO_D3" I R 4350 4600 50 
F29 "SDIO_CK" I R 4350 4900 50 
F30 "SDIO_DET" I R 4350 5300 50 
F31 "PB7_OUT_EN" I R 4350 3550 50 
F32 "PC2_ADC123_12" I L 3100 4650 50 
F33 "PC3_ADC123_13" I L 3100 4750 50 
F34 "PB8_FAN" I R 4350 6800 50 
$EndSheet
Wire Wire Line
	4350 2850 4900 2850
Wire Wire Line
	4900 2950 4350 2950
Wire Wire Line
	4350 3050 4900 3050
Wire Wire Line
	4900 3150 4350 3150
Wire Wire Line
	4350 3250 4900 3250
Wire Wire Line
	4900 3350 4350 3350
Wire Wire Line
	4350 3450 4900 3450
Wire Wire Line
	4900 3550 4350 3550
$Sheet
S 9700 2600 1050 1250
U 5DB0F8E4
F0 "power" 50
F1 "power.sch" 50
$EndSheet
Text Notes 8200 2100 0    50   ~ 0
12061C225KAT2A CAP CER 2.2UF 100V X7R 1206\nC3216X7S2A225K160AB CAP CER 2.2UF 100V X7S 1206\n
Text GLabel 10550 1600 2    50   Input ~ 0
PWR_IN
$Comp
L Device:CP_Small C4
U 1 1 5D9EE9D3
P 9850 1700
F 0 "C4" H 9938 1746 50  0000 L CNN
F 1 "100u" H 9938 1655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 9850 1700 50  0001 C CNN
F 3 "~" H 9850 1700 50  0001 C CNN
F 4 "https://www.digikey.se/product-detail/en/nichicon/URS1J101MPD1TD/493-11829-1-ND/4320229" H 9850 1700 50  0001 C CNN "digikey"
F 5 "493-11829-1-ND" H 9850 1700 50  0001 C CNN "OrderN"
	1    9850 1700
	-1   0    0    -1  
$EndComp
Connection ~ 9850 1800
Connection ~ 9850 1600
$Comp
L power:GND #PWR013
U 1 1 5D9D56FA
P 10550 1900
F 0 "#PWR013" H 10550 1650 50  0001 C CNN
F 1 "GND" H 10555 1727 50  0000 C CNN
F 2 "" H 10550 1900 50  0001 C CNN
F 3 "" H 10550 1900 50  0001 C CNN
	1    10550 1900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10550 1800 10550 1900
Wire Wire Line
	10550 1600 10350 1600
Wire Wire Line
	10550 1800 10200 1800
$Comp
L power:+3.3VA #PWR0102
U 1 1 5DB50ED3
P 2300 4400
F 0 "#PWR0102" H 2300 4250 50  0001 C CNN
F 1 "+3.3VA" H 2315 4573 50  0000 C CNN
F 2 "" H 2300 4400 50  0001 C CNN
F 3 "" H 2300 4400 50  0001 C CNN
	1    2300 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4550 2300 4550
Wire Wire Line
	2300 4550 2300 4400
Wire Wire Line
	2150 4850 2300 4850
Wire Wire Line
	2300 4850 2300 5050
$Comp
L Connector:Conn_01x04_Male J10
U 1 1 5DB52E39
P 1950 4650
F 0 "J10" H 2058 4931 50  0000 C CNN
F 1 "ADC_EXTRA" V 1850 4600 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 1950 4650 50  0001 C CNN
F 3 "~" H 1950 4650 50  0001 C CNN
F 4 " 455-1706-ND " H 1950 4650 50  0001 C CNN "OrderN"
	1    1950 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4650 2150 4650
Wire Wire Line
	2150 4750 3100 4750
$Comp
L power:GND #PWR0101
U 1 1 5DB59CA4
P 2300 2850
F 0 "#PWR0101" H 2300 2600 50  0001 C CNN
F 1 "GND" H 2305 2677 50  0000 C CNN
F 2 "" H 2300 2850 50  0001 C CNN
F 3 "" H 2300 2850 50  0001 C CNN
	1    2300 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DB5A09F
P 2300 5050
F 0 "#PWR0103" H 2300 4800 50  0001 C CNN
F 1 "GND" H 2305 4877 50  0000 C CNN
F 2 "" H 2300 5050 50  0001 C CNN
F 3 "" H 2300 5050 50  0001 C CNN
	1    2300 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DB5A25E
P 2300 3850
F 0 "#PWR0104" H 2300 3600 50  0001 C CNN
F 1 "GND" H 2305 3677 50  0000 C CNN
F 2 "" H 2300 3850 50  0001 C CNN
F 3 "" H 2300 3850 50  0001 C CNN
	1    2300 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J12
U 1 1 5DB6D6F0
P 9000 1800
F 0 "J12" H 8750 1800 50  0000 R CNN
F 1 "IN-" H 9000 1800 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 9000 1800 50  0001 C CNN
F 3 "~" H 9000 1800 50  0001 C CNN
F 4 "n/a" H 9000 1800 50  0001 C CNN "OrderN"
	1    9000 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 5DB6D6FD
P 9000 1600
F 0 "J11" H 8750 1600 50  0000 R CNN
F 1 "IN+" H 9000 1600 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 9000 1600 50  0001 C CNN
F 3 "~" H 9000 1600 50  0001 C CNN
F 4 "n/a" H 9000 1600 50  0001 C CNN "OrderN"
	1    9000 1600
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5DB70835
P 10350 1450
F 0 "#FLG01" H 10350 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 10350 1623 50  0000 C CNN
F 2 "" H 10350 1450 50  0001 C CNN
F 3 "~" H 10350 1450 50  0001 C CNN
	1    10350 1450
	1    0    0    -1  
$EndComp
Text Notes 8900 1400 0    50   ~ 0
Power\nInput
$Comp
L Device:C_Small C6
U 1 1 5D9E44EA
P 9500 1700
F 0 "C6" H 9592 1746 50  0000 L CNN
F 1 "2.2u" H 9592 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9500 1700 50  0001 C CNN
F 3 "~" H 9500 1700 50  0001 C CNN
F 4 "445-5207-1-ND" H 9500 1700 50  0001 C CNN "OrderN"
	1    9500 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9200 1600 9500 1600
Connection ~ 9500 1600
Wire Wire Line
	9500 1800 9200 1800
Connection ~ 9500 1800
Wire Wire Line
	10350 1450 10350 1600
Connection ~ 10350 1600
Wire Wire Line
	10350 1600 10200 1600
Text Notes 7300 4900 0    50   ~ 0
SD Card for logging,\nsample buffering, etc.
$Comp
L Device:R_Small R35
U 1 1 5DB9CDE0
P 1800 1950
F 0 "R35" V 2000 1950 50  0000 C CNN
F 1 "22R" V 1900 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1800 1950 50  0001 C CNN
F 3 "~" H 1800 1950 50  0001 C CNN
F 4 "RC0603FR-0722RL" H 1800 1950 50  0001 C CNN "OrderN"
	1    1800 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R36
U 1 1 5DB9E98E
P 1800 2050
F 0 "R36" V 1600 2050 50  0000 C CNN
F 1 "22R" V 1700 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1800 2050 50  0001 C CNN
F 3 "~" H 1800 2050 50  0001 C CNN
F 4 "RC0603FR-0722RL" H 1800 2050 50  0001 C CNN "OrderN"
	1    1800 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 1950 1700 1950
Wire Wire Line
	1700 2050 1550 2050
Wire Wire Line
	1900 1950 3100 1950
Wire Wire Line
	3100 2050 1900 2050
Wire Wire Line
	9500 1600 9850 1600
Wire Wire Line
	9500 1800 9850 1800
$Comp
L power:+3.3VA #PWR036
U 1 1 5DB45B95
P 9800 4350
F 0 "#PWR036" H 9950 4350 50  0001 C CNN
F 1 "+3.3VA" H 9627 4365 50  0000 C CNN
F 2 "" H 9800 4350 50  0001 C CNN
F 3 "" H 9800 4350 50  0001 C CNN
	1    9800 4350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR038
U 1 1 5DB46A69
P 9800 4450
F 0 "#PWR038" H 9800 4200 50  0001 C CNN
F 1 "GND" V 9805 4322 50  0000 R CNN
F 2 "" H 9800 4450 50  0001 C CNN
F 3 "" H 9800 4450 50  0001 C CNN
	1    9800 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 4350 9800 4350
Wire Wire Line
	9800 4450 9550 4450
$Comp
L Device:Q_NMOS_GSD Q6
U 1 1 5DB539FD
P 5150 6800
F 0 "Q6" H 5354 6846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5354 6755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5350 6900 50  0001 C CNN
F 3 "~" H 5150 6800 50  0001 C CNN
F 4 "NTR3C21NZT1GOSCT-ND" H 5150 6800 50  0001 C CNN "OrderN"
	1    5150 6800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J15
U 1 1 5DB55274
P 5850 6400
F 0 "J15" H 5958 6581 50  0000 C CNN
F 1 "FAN" V 5750 6350 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 5850 6400 50  0001 C CNN
F 3 "~" H 5850 6400 50  0001 C CNN
F 4 "455-1704-ND" H 5850 6400 50  0001 C CNN "OrderN"
	1    5850 6400
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR047
U 1 1 5DB5C786
P 5250 6100
F 0 "#PWR047" H 5250 5950 50  0001 C CNN
F 1 "+5V" H 5265 6273 50  0000 C CNN
F 2 "" H 5250 6100 50  0001 C CNN
F 3 "" H 5250 6100 50  0001 C CNN
	1    5250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5DB57FD2
P 5250 7200
F 0 "#PWR045" H 5250 6950 50  0001 C CNN
F 1 "GND" H 5255 7027 50  0000 C CNN
F 2 "" H 5250 7200 50  0001 C CNN
F 3 "" H 5250 7200 50  0001 C CNN
	1    5250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_Small D4
U 1 1 5DB5C785
P 5250 6350
F 0 "D4" V 5204 6418 50  0000 L CNN
F 1 "SCH" V 5295 6418 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" V 5250 6350 50  0001 C CNN
F 3 "~" V 5250 6350 50  0001 C CNN
F 4 "B360A-FDICT-ND" V 5250 6350 50  0001 C CNN "OrderN"
	1    5250 6350
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 6100 5250 6200
Wire Wire Line
	5250 6200 5550 6200
Wire Wire Line
	5550 6200 5550 6300
Wire Wire Line
	5550 6300 5650 6300
Connection ~ 5250 6200
Wire Wire Line
	5250 6200 5250 6250
Wire Wire Line
	5650 6400 5500 6400
Wire Wire Line
	5500 6400 5500 6500
Wire Wire Line
	5500 6500 5250 6500
Wire Wire Line
	5250 6500 5250 6450
Wire Wire Line
	5250 6500 5250 6600
Connection ~ 5250 6500
Wire Wire Line
	5250 7000 5250 7200
Wire Wire Line
	4350 6800 4950 6800
$Comp
L Mechanical:MountingHole H1
U 1 1 5DB5F2C6
P 9250 5750
F 0 "H1" H 9350 5796 50  0000 L CNN
F 1 "MountingHole" H 9350 5705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9250 5750 50  0001 C CNN
F 3 "~" H 9250 5750 50  0001 C CNN
F 4 "n/a" H 9250 5750 50  0001 C CNN "OrderN"
	1    9250 5750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5DB60163
P 9250 5950
F 0 "H2" H 9350 5996 50  0000 L CNN
F 1 "MountingHole" H 9350 5905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9250 5950 50  0001 C CNN
F 3 "~" H 9250 5950 50  0001 C CNN
F 4 "n/a" H 9250 5950 50  0001 C CNN "OrderN"
	1    9250 5950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5DB6057C
P 9250 6150
F 0 "H3" H 9350 6196 50  0000 L CNN
F 1 "MountingHole" H 9350 6105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9250 6150 50  0001 C CNN
F 3 "~" H 9250 6150 50  0001 C CNN
F 4 "n/a" H 9250 6150 50  0001 C CNN "OrderN"
	1    9250 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C28
U 1 1 5DC02D42
P 10200 1700
F 0 "C28" H 10288 1746 50  0000 L CNN
F 1 "100u" H 10288 1655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 10200 1700 50  0001 C CNN
F 3 "~" H 10200 1700 50  0001 C CNN
F 4 "https://www.digikey.se/product-detail/en/nichicon/URS1J101MPD1TD/493-11829-1-ND/4320229" H 10200 1700 50  0001 C CNN "digikey"
F 5 "493-11829-1-ND" H 10200 1700 50  0001 C CNN "OrderN"
	1    10200 1700
	-1   0    0    -1  
$EndComp
Connection ~ 10200 1600
Wire Wire Line
	10200 1600 9850 1600
Connection ~ 10200 1800
Wire Wire Line
	10200 1800 9850 1800
Text Label 4500 1950 0    50   ~ 0
TP_DAC1
Text Label 4500 2050 0    50   ~ 0
TP_DAC2
Text Label 9550 4900 0    50   ~ 0
TP_DAC2
Text Label 9550 4800 0    50   ~ 0
TP_DAC1
$Comp
L Connector:Conn_01x02_Male J13
U 1 1 5DC55E05
P 9350 4350
F 0 "J13" H 9458 4531 50  0000 C CNN
F 1 "CAL_3.3" V 9250 4300 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 9350 4350 50  0001 C CNN
F 3 "~" H 9350 4350 50  0001 C CNN
F 4 "455-1704-ND" H 9350 4350 50  0001 C CNN "OrderN"
	1    9350 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J14
U 1 1 5DC57413
P 9350 4800
F 0 "J14" H 9450 4950 50  0000 C CNN
F 1 "TP_DAC" V 9250 4750 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 9350 4800 50  0001 C CNN
F 3 "~" H 9350 4800 50  0001 C CNN
F 4 "455-1704-ND" H 9350 4800 50  0001 C CNN "OrderN"
	1    9350 4800
	1    0    0    -1  
$EndComp
Text Label 4500 2150 0    50   ~ 0
TP_I1
Text Label 4500 2250 0    50   ~ 0
TP_I2
Text Label 9550 5200 0    50   ~ 0
TP_I1
Text Label 9550 5300 0    50   ~ 0
TP_I2
$Comp
L Connector:Conn_01x03_Male J16
U 1 1 5DC72E50
P 9350 5300
F 0 "J16" H 9450 5500 50  0000 C CNN
F 1 "TP_AMP" V 9250 5300 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 9350 5300 50  0001 C CNN
F 3 "~" H 9350 5300 50  0001 C CNN
F 4 " 455-1705-ND " H 9350 5300 50  0001 C CNN "OrderN"
	1    9350 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DC40DCD
P 9550 5400
F 0 "#PWR?" H 9550 5150 50  0001 C CNN
F 1 "GND" V 9555 5272 50  0000 R CNN
F 2 "" H 9550 5400 50  0001 C CNN
F 3 "" H 9550 5400 50  0001 C CNN
	1    9550 5400
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
