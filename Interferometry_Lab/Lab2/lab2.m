atmosphericPressure = 76; %in cm Hg
lambda = 632.8; %in nano meters, manufacturer specifications. Assumed true. 

final_gaugePressure = 42;
initial_gaugePressure = 2; 

final_pressure = atmosphericPressure - final_gaugePressure;
initial_pressure = atmosphericPressure - initial_gaugePressure; 

N = 11; %number of fringe transitions 
d = 3 ; %in cm Length of vaccum cell 
d = d * 10^7; %convert to nm

change_P = initial_pressure - final_pressure; 
slope = N * lambda / 2 / d /change_P; %in units (cm-Hg)^-1



%uncertainty in d,P,N

delta_N = 1; 

%assume error in d = 0.1 cm  %manufacturer specified, assume small error
delta_d = 0.1; %in cm
%Need nm, so multiply by 10^7
delta_d = delta_d *10^7; 

%error in measurements for pressure = 1 cm Hg (gague in increments 
% of 2 cm Hg)
delta_P = 2 * 1; %because error in Pi - Pf adds

%error in slope 
delta_slope = lambda/2/d/change_P*sqrt( (delta_N)^2 + (delta_d/d)^2 + (N/change_P*delta_P)^2 );





