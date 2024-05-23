N = 40; %Number of changes in interference pattern. Each trial has same N.

d_ms = [18 14.3 15.5 16.0 15 13.9 14.0 13.8 13.9 17.5 ]; %in micro-meters

wavelengths = 2*d_ms/N ; %in micro-meters
wavelengths = wavelengths * 10^3; 


%error propogation 
%each value assumed to have error 0.05 micrometers 


delta_N = 5; %the more you count, the greater the error can get
delta_dm = 0.5 *10^3; %in nanometers 
delta_lambda = sqrt((4*delta_dm*delta_dm*delta_N*delta_N/N^4) + 4*delta_dm*delta_dm/N^2);
avg_wavelength = mean(wavelengths); %nanometers 




error_avg_wavelength = std(wavelengths)/sqrt(10); %standard error of the mean 



 