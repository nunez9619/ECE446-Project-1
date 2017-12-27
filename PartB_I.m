Noise=.05*(rand(512000,1)-.5)';

figure
hold on
NoiseSp2048=EstimateSpectrum(Noise,1024,2048);  %Plots evaluated with +/- 64 data points
NoiseSp1024=EstimateSpectrum(Noise,512,1024);
NoiseSp512=EstimateSpectrum(Noise,256,512);
NoiseSp256=EstimateSpectrum(Noise,128,256);

legend('2048','1024','512','256')
title('Estimate of Power Spectrum (+/-64 data points)')
