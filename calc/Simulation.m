
% Script that simulates the calculations on z-SIM


% Input to external ADC 

f0=100; %Hz
T0=1/f0;

Rload = 0.2
Lload = Rload/(2*pi*f0)
Cload = 1/(2*pi*f0*Rload)

Rshunt = 10e-3;

ADCmax = 4095;
UADCmax = 3.3; %V
DACmax = 4095;
UDACmax = 3.3; %V

GainOP = 2;
GainCurrentShunt = 20;


gpt3Freq = 1000000;
ADC1_periods = 100;
ADC1Freq = gpt3Freq/ADC1_periods;

DACmax/UDACmax * UADCmax/ADCmax * 1/2 * 1/GainOP * 1/GainCurrentShunt;


t=0:1/ADC1Freq:100*T0;

VADC=1.65+1*sin(2*pi*f0*t);

DVADC = round(VADC/3.3*ADCmax);

DVADC_AC = DVADC - ADCmax/2;

dDVADC_AC_dt =([DVADC_AC 0] - [0 DVADC_AC])(:,1:length(DVADC_AC));
intDVADC_AC_i =([DVADC_AC 0] + [0 DVADC_AC])(:,1:length(DVADC_AC))/2;
intDVADC_AC = intDVADC_AC_i(:,1);
for i = 2:length(DVADC_AC)
  intDVADC_AC = [intDVADC_AC intDVADC_AC(:,length(intDVADC_AC))+intDVADC_AC_i(:,i)];
endfor

intDVADC_AC = intDVADC_AC - mean(intDVADC_AC);


Gaintemp = DACmax/UDACmax * UADCmax/ADCmax * 1/2 * 1/GainOP * 1/GainCurrentShunt;

outputDACAmp_res = Gaintemp * ((Rload/Rshunt - 1) * DVADC_AC);
outputDACAmp_ind = Gaintemp * (ADC1Freq*Lload/Rshunt * dDVADC_AC_dt);
outputDACAmp_cap = Gaintemp * ( 1/(ADC1Freq*Rshunt*Cload) * intDVADC_AC);

outputDACAmp = outputDACAmp_res + outputDACAmp_ind + outputDACAmp_cap + Gaintemp;

figure(1)
plot(t,DVADC_AC,t,dDVADC_AC_dt,t,intDVADC_AC)
grid on

figure(2)
plot(t,DVADC_AC,t,outputDACAmp)
grid on

figure(3)
plot(t,DVADC_AC,t,outputDACAmp_res,'+',t,outputDACAmp_ind,'o',t,outputDACAmp_cap,'x')
grid on