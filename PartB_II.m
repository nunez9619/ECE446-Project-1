Noise=(.05*(rand(512000,1)-.5))';
Rp=ShapeRandomProcess(Noise);

figure  %Plot to show [-10 -8]MHz
hold on
xlim([-10 -8])
RpSpectrum2048=EstimateSpectrum(Rp,1024,2048);
RpSpectrum1024=EstimateSpectrum(Rp,512,1024);
RpSpectrum512=EstimateSpectrum(Rp,256,512);
RpSpectrum256=EstimateSpectrum(Rp,128,256);

legend('Rp 2048','Rp 1024','Rp 512','Rp 256')
title('Estimate of Rp Power Spectrum')
