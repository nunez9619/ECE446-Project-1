function player=runAF(skip,FFTsize)

global player

[AF,fs]=audioread('Ashokan Farewell.wav');
player=audioplayer(AF,44100);

set(player,'TimerFcn','timerCallback','TimerPeriod',1);

Spectra=PlotSpectra(AF(:,1),skip,FFTsize,10);
hold on;

play(player);
end