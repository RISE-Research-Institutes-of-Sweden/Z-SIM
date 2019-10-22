EESchema Schematic File Version 5
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L rise_elp:OPA549 U1
U 1 1 5DADB292
P 2500 3250
F 0 "U1" H 2750 3550 50  0000 L CNN
F 1 "OPA549" H 2400 3250 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-11_P3.4x5.08mm_StaggerOdd_Lead4.85mm_Vertical" H 2500 3250 50  0001 C CNN
F 3 "" H 2500 3250 50  0001 C CNN
F 4 "OPA549T-ND" H 2500 3250 50  0001 C CNN "OrderN"
	1    2500 3250
	1    0    0    -1  
$EndComp
Text GLabel 2600 2600 2    50   Input ~ 0
OUT_RAIL
Wire Wire Line
	2550 2850 2550 2600
Wire Wire Line
	2550 2600 2450 2600
Wire Wire Line
	2450 2600 2450 2800
$Comp
L power:GND #PWR014
U 1 1 5DADB93D
P 2450 4250
F 0 "#PWR014" H 2450 4000 50  0001 C CNN
F 1 "GND" H 2455 4077 50  0000 C CNN
F 2 "" H 2450 4250 50  0001 C CNN
F 3 "" H 2450 4250 50  0001 C CNN
	1    2450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 4250 2450 4100
Wire Wire Line
	2550 3650 2550 4100
Wire Wire Line
	2550 4100 2450 4100
Connection ~ 2450 4100
Wire Wire Line
	2450 4100 2450 3700
Wire Wire Line
	2750 3550 2750 4100
Wire Wire Line
	2750 4100 2550 4100
Connection ~ 2550 4100
Wire Wire Line
	2850 3500 2850 4100
Wire Wire Line
	2850 4100 2750 4100
Connection ~ 2750 4100
Text HLabel 2050 3400 0    50   Input ~ 0
V_OUT1
$Comp
L Device:R_Small R13
U 1 1 5DADC336
P 1400 3450
F 0 "R13" H 1459 3496 50  0000 L CNN
F 1 "10k" H 1459 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1400 3450 50  0001 C CNN
F 3 "~" H 1400 3450 50  0001 C CNN
	1    1400 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R12
U 1 1 5DADCC5D
P 1400 2700
F 0 "R12" H 1459 2746 50  0000 L CNN
F 1 "10k" H 1459 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1400 2700 50  0001 C CNN
F 3 "~" H 1400 2700 50  0001 C CNN
	1    1400 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3200 3350 3200
Wire Wire Line
	2550 2600 2600 2600
Connection ~ 2550 2600
Wire Wire Line
	3350 3200 3350 2350
Wire Wire Line
	3350 2350 1400 2350
Wire Wire Line
	1400 2350 1400 2600
Connection ~ 3350 3200
Wire Wire Line
	1400 2800 1400 3100
Wire Wire Line
	2050 3100 1400 3100
Connection ~ 1400 3100
Wire Wire Line
	1400 3100 1400 3350
Wire Wire Line
	1400 3550 1400 4100
Wire Wire Line
	1400 4100 2450 4100
Text HLabel 2250 3800 3    50   Input ~ 0
ES1
$Comp
L Device:R_Shunt R14
U 1 1 5DADFAE8
P 3750 3200
F 0 "R14" V 3525 3200 50  0000 C CNN
F 1 "R_Shunt" V 3616 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_Shunt_Ohmite_LVK12" V 3680 3200 50  0001 C CNN
F 3 "~" H 3750 3200 50  0001 C CNN
F 4 "LVK12R010DERCT-ND" V 3750 3200 50  0001 C CNN "OrderN"
	1    3750 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 3200 3550 3200
Wire Wire Line
	3350 3200 3350 3300
Wire Wire Line
	3350 3300 3150 3300
$Comp
L Amplifier_Current:INA240A1D U2
U 1 1 5DAE1093
P 3750 3900
F 0 "U2" V 3750 4050 50  0000 L CNN
F 1 "INA240A1D" V 3850 4050 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3750 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 3900 4050 50  0001 C CNN
F 4 "296-45088-1-ND" V 3750 3900 50  0001 C CNN "OrderN"
	1    3750 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 3600 3650 3350
Wire Wire Line
	3850 3600 3850 3350
Wire Wire Line
	3450 3900 3250 3900
Wire Wire Line
	3250 3900 3250 3500
Wire Wire Line
	3250 3500 4250 3500
Wire Wire Line
	4250 3500 4250 3800
Wire Wire Line
	4250 3800 4050 3800
Wire Wire Line
	3450 4000 3350 4000
Wire Wire Line
	3350 4000 3350 3800
Wire Wire Line
	3350 3800 3450 3800
$Comp
L power:GND #PWR015
U 1 1 5DAE8C45
P 3350 4100
F 0 "#PWR015" H 3350 3850 50  0001 C CNN
F 1 "GND" H 3355 3927 50  0000 C CNN
F 2 "" H 3350 4100 50  0001 C CNN
F 3 "" H 3350 4100 50  0001 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4000 3350 4100
Connection ~ 3350 4000
Wire Wire Line
	4250 3400 4250 3500
Connection ~ 4250 3500
$Comp
L Device:C_Small C7
U 1 1 5DAE9B2D
P 3150 3850
F 0 "C7" H 3000 3750 50  0000 L CNN
F 1 "2.2u" H 2950 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3150 3850 50  0001 C CNN
F 3 "~" H 3150 3850 50  0001 C CNN
	1    3150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4000 3150 4000
Wire Wire Line
	3150 4000 3150 3950
Wire Wire Line
	3150 3750 3150 3500
Wire Wire Line
	3150 3500 3250 3500
Connection ~ 3250 3500
$Comp
L power:+3.3VA #PWR016
U 1 1 5DAE93D3
P 4250 3400
F 0 "#PWR016" H 4250 3250 50  0001 C CNN
F 1 "+3.3VA" H 4050 3450 50  0000 C CNN
F 2 "" H 4250 3400 50  0001 C CNN
F 3 "" H 4250 3400 50  0001 C CNN
	1    4250 3400
	1    0    0    -1  
$EndComp
Text HLabel 3750 4200 3    50   Input ~ 0
I_SENSE
Wire Wire Line
	3950 3200 4400 3200
Text HLabel 4400 3200 2    50   Input ~ 0
OUT1
Wire Wire Line
	6350 3650 6350 4100
Wire Wire Line
	6050 3500 6050 4100
Connection ~ 6350 2600
Connection ~ 6350 4100
Wire Wire Line
	6350 2600 6450 2600
Text HLabel 5350 3200 0    50   Input ~ 0
OUT2
Wire Wire Line
	6050 4100 6150 4100
Wire Wire Line
	6150 4100 6350 4100
Connection ~ 5550 3200
Text HLabel 6850 3400 2    50   Input ~ 0
V_OUT2
Connection ~ 6150 4100
Text GLabel 6300 2600 0    50   Input ~ 0
OUT_RAIL
Wire Wire Line
	6150 3550 6150 4100
Wire Wire Line
	5550 3200 5550 3300
Wire Wire Line
	5550 3300 5750 3300
Wire Wire Line
	5550 3200 5350 3200
Text HLabel 6650 3800 3    50   Input ~ 0
ES2
Wire Wire Line
	6350 2600 6300 2600
Wire Wire Line
	5750 3200 5550 3200
$Comp
L power:GND #PWR017
U 1 1 5DAEEBB5
P 6450 4250
F 0 "#PWR017" H 6450 4000 50  0001 C CNN
F 1 "GND" H 6455 4077 50  0000 C CNN
F 2 "" H 6450 4250 50  0001 C CNN
F 3 "" H 6450 4250 50  0001 C CNN
	1    6450 4250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 2600 6450 2800
Wire Wire Line
	6350 2850 6350 2600
$Comp
L rise_elp:OPA549 U3
U 1 1 5DAEEBCF
P 6400 3250
F 0 "U3" H 6650 3550 50  0000 L CNN
F 1 "OPA549" H 6300 3250 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-11_P3.4x5.08mm_StaggerOdd_Lead4.85mm_Vertical" H 6400 3250 50  0001 C CNN
F 3 "" H 6400 3250 50  0001 C CNN
F 4 "OPA549T-ND" H 6400 3250 50  0001 C CNN "OrderN"
	1    6400 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5550 3200 5550 2350
Wire Wire Line
	5550 2350 7450 2350
Wire Wire Line
	6350 4100 6450 4100
Connection ~ 7450 3100
Connection ~ 6450 4100
Wire Wire Line
	7450 3100 7450 3350
Wire Wire Line
	6450 4100 6450 3700
Wire Wire Line
	7450 2800 7450 3100
Wire Wire Line
	6450 4250 6450 4100
$Comp
L Device:R_Small R16
U 1 1 5DAEEBA7
P 7450 3450
F 0 "R16" H 7509 3496 50  0000 L CNN
F 1 "10k" H 7509 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7450 3450 50  0001 C CNN
F 3 "~" H 7450 3450 50  0001 C CNN
	1    7450 3450
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5DAEEB41
P 7450 2700
F 0 "R15" H 7509 2746 50  0000 L CNN
F 1 "10k" H 7509 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7450 2700 50  0001 C CNN
F 3 "~" H 7450 2700 50  0001 C CNN
	1    7450 2700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7450 2350 7450 2600
Wire Wire Line
	7450 3550 7450 4100
Wire Wire Line
	7450 4100 6450 4100
Wire Wire Line
	6850 3100 7450 3100
Wire Wire Line
	9900 3000 9900 3300
Connection ~ 9000 3500
Text HLabel 9400 3700 3    50   Input ~ 0
I_SENSE_4T
Wire Wire Line
	9300 3100 9300 2850
Connection ~ 9900 3000
Wire Wire Line
	9000 3500 9000 3600
Wire Wire Line
	8800 3000 8900 3000
Wire Wire Line
	9500 3100 9500 2850
Wire Wire Line
	9100 3500 9000 3500
Wire Wire Line
	8800 3250 8800 3000
Wire Wire Line
	9000 3500 9000 3300
$Comp
L power:GND #PWR018
U 1 1 5DAF9612
P 9000 3600
F 0 "#PWR018" H 9000 3350 50  0001 C CNN
F 1 "GND" H 9005 3427 50  0000 C CNN
F 2 "" H 9000 3600 50  0001 C CNN
F 3 "" H 9000 3600 50  0001 C CNN
	1    9000 3600
	1    0    0    -1  
$EndComp
Connection ~ 8900 3000
Wire Wire Line
	8900 3000 9900 3000
Wire Wire Line
	9000 3500 8800 3500
Wire Wire Line
	9000 3300 9100 3300
$Comp
L Amplifier_Current:INA240A1D U4
U 1 1 5DAF962B
P 9400 3400
F 0 "U4" V 9400 3550 50  0000 L CNN
F 1 "INA240A1D" V 9500 3550 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9400 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 9550 3550 50  0001 C CNN
F 4 "296-45088-1-ND" V 9400 3400 50  0001 C CNN "OrderN"
	1    9400 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	9900 3300 9700 3300
Wire Wire Line
	9100 3400 8900 3400
$Comp
L Device:C_Small C8
U 1 1 5DAF963B
P 8800 3350
F 0 "C8" H 8650 3250 50  0000 L CNN
F 1 "2.2u" H 8600 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8800 3350 50  0001 C CNN
F 3 "~" H 8800 3350 50  0001 C CNN
	1    8800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3500 8800 3450
Wire Wire Line
	9900 2900 9900 3000
Wire Wire Line
	8900 3400 8900 3000
$Comp
L power:+3.3VA #PWR019
U 1 1 5DB044D1
P 9900 2900
F 0 "#PWR019" H 9900 2750 50  0001 C CNN
F 1 "+3.3VA" H 9700 2950 50  0000 C CNN
F 2 "" H 9900 2900 50  0001 C CNN
F 3 "" H 9900 2900 50  0001 C CNN
	1    9900 2900
	1    0    0    -1  
$EndComp
Text HLabel 9200 2700 0    50   Input ~ 0
SENSE_4T_1
Text HLabel 9600 2700 2    50   Input ~ 0
SENSE_4T_2
$Comp
L Device:R_Shunt R17
U 1 1 5DAEC8CF
P 9400 2700
F 0 "R17" V 9175 2700 50  0000 C CNN
F 1 "R_Shunt" V 9266 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_Shunt_Ohmite_LVK12" V 9330 2700 50  0001 C CNN
F 3 "~" H 9400 2700 50  0001 C CNN
F 4 "LVK12R010DERCT-ND" V 9400 2700 50  0001 C CNN "OrderN"
	1    9400 2700
	0    1    1    0   
$EndComp
$EndSCHEMATC
