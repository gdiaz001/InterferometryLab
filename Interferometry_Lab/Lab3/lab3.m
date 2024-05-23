%Index of refraction of glass 

%t = thickness of glass plate
t = 0.6; %in cm
t = t*10^7; %convert to nm

%lambda is wavelength of light in vacuum
%given by manufacturer, taken to be correct
lambda = 632.8; %in nm

% for each trial, theta is 10 degrees
theta = 10.0;
theta = theta * pi / 180; %convert to radians 

Ns = [109 109 113 107];

ngs = zeros(1,length(Ns));

for i = 1:length(ngs)
   ngs(i) = 1/(2*t*(1-cos(theta)) - Ns(i)*lambda);
   ngs(i) = ngs(i)*(2*t-Ns(i)*lambda);
   ngs(i) = ngs(i)*(1-cos(theta));
end


delta_N = 5;
delta_theta = 0.5 * pi/180;
delta_t = 0.05 * 10^7; 



delta_ngs = zeros(1,length(Ns));

for i = 1:length(Ns)

    delta_ngs(i) = lambda/(2*t*(1-cos(theta))-Ns(i)*lambda)^2;
    delta_ngs(i) = delta_ngs(i)*sqrt(4*cos(theta)*cos(theta)*delta_t^2*(1-cos(theta)*cos(theta))+ ...
        4*t*t*(1-cos(theta))^2 *cos(theta)*cos(theta)*delta_N^2 ...
        + sin(theta)*sin(theta)*delta_theta^2 *(2*t-Ns(i)*lambda)^2 );
end

avg_ng = 0;
weights = zeros(1,length(ngs));
for i =1 :length(ngs)
    weights(i) = 1/delta_ngs(i)/delta_ngs(i);
end

for i = 1:length(ngs)
    avg_ng = avg_ng + ngs(i)*weights(i)/sum(weights);
end

delta_ng_average  = 1/sqrt(sum(weights));

sigma_ng = sqrt(sum( (ngs - avg_ng).^2 ))/sqrt(length(ngs));


