function EstimateSpectrum = EstimateSpectrum(x, skip, FFTsize)

sections = 1 + floor((length(x)-FFTsize)/skip);

EstimateSpectrum = zeros(1,FFTsize);
temp = zeros(sections, FFTsize);

for n = 1:sections
    xx=[x((1+((n-1)*skip)):(FFTsize+((n-1)*skip)))];  %Generates index of Noise 
    xxx = fftshift(xx,FFTsize);
    FT = fft(xxx,FFTsize);
    FT = fftshift(FT, FFTsize);
    temp(n,:) = (1/FFTsize)*((FT.*conj(FT)));
end

EstimateSpectrum=mean(temp);   % average over each section
EstimateSpectrum=fftshift(EstimateSpectrum);
mm=1:FFTsize;  %%% Indexing for full spectrum 1-FFTsize
f=-20/2:20/(FFTsize-1):20/2; %Index frequency for sampling rate of 20MHz

% Noise = .05*(rand(512000,1)-.5);

plot(f,(EstimateSpectrum(mm)))  %Plot function with +/- 64 data points
xlabel('Frequency (MHz)')
ylabel('Amplitude')
end
