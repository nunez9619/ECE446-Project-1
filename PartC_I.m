[AF,fs]=audioread('Ashokan Farewell.wav');

PlotSpectra(AF(:,1),8192,16384,10)
PlotSpectra(AF(:,1),2048,4096,10)
PlotSpectra(AF(:,1),256,512,10)