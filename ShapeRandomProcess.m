function Rp=ShapeRandomProcess(N)
Rp=zeros(1,length(N)-1);
Rp(1)=N(1);
for n=2:length(Rp)
    Rp(n)=N(n)-.9*Rp(n-1);
end
    