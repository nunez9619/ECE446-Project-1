function Spectra = PlotSpectra(x,skip,FFTsize,MaxFreq)
%PlotSpectra 
samplerate=44100;  %Sample rate
sr_inkhz=44.1;
totaltime=floor(length(x)/samplerate);  %Total number of seconds
x=x';

for nn=1:totaltime
    xx(nn,:)=x(1,((1+((nn-1)*samplerate)):(samplerate+((nn-1)*samplerate)))); %Index for fs
    Spectra1(nn,:)=EstimateSpectrum(xx(nn,:),skip,FFTsize);  %Estimate spectrum for each second
    Spectra(:,nn)=Spectra1(nn,(floor((((MaxFreq/(sr_inkhz))+.5)*FFTsize)):-1:((FFTsize/2)+1)));  %MaxFreq cutoff
end
speclen=length(Spectra(:,1));

figure
colormap jet
imagesc(log(Spectra))  %Log(Spectra)
title(['Spectrograph for FFtsize=' num2str(FFTsize) ',skip=' num2str(skip)]) 
xlabel('Time (Seconds)')
ylabel('Frequency (kHz)')

set(gca,'YTickMode','manual');
set(gca,'YTick',[0:speclen/MaxFreq:speclen]);
set(gca,'YtickLabels',[MaxFreq:-1:0]);   %Set the y-axis to 0-MaxFreq

end

