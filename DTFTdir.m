function DTFTdir=DTFTdir(x,k)
% Function DTFDdir outputs the DTFT of the signal x, with k samples

N=k+1;
DTFTdir=zeros((k+1),1);

for k=1:N 
    DTFTdir(k) = 0;
    for n = 1:N  
        DTFTdir(k)=DTFTdir(k)+(1./(N-1)).*x(n).*exp(-2.*pi().*1i.*(k-1).*(n-1)./(N-1));
    end
end

DTFTdir1=fliplr(DTFTdir((round(N/2):end)));  
DTFTdir2=fliplr(DTFTdir(2:(round(N/2))));

DTFTdir=[DTFTdir1;DTFTdir2];

m=-(N-1)/2:(N-1)/2;  %Reindex to [-pi,pi]
omega=2.*pi.*m./(N-1);
end 