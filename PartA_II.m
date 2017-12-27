%Part A II- testing DTFT function

n=-500:500; %generates n as an index of -500 to 500
k=1000;  %sampled at k=1000
N=k+1;
m=-(N-1)/2:(N-1)/2;
omega=2.*pi.*m./(N-1);


x1 = cos((1/64).*pi.*n).*(heaviside(n)-heaviside(n-100));
X1 = DTFTdir(x1,1000);

x2 = cos((1/2).*pi.*n).*(heaviside(n)-heaviside(n-100));
X2 = DTFTdir(x2,1000);

x3 = heaviside(n) - heaviside(n-100);
X3 = DTFTdir(x3, 1000);

x4 = x1 + x2;
X4 = DTFTdir(x4, 1000);

figure
subplot(3,1,1)
stem(n,x1) %x1[n]
xlabel('n')
ylabel('x[n]')
title('x_{1}[n] = cos((pi/64)*(u[n]-u[n-100])')

subplot(3,1,2)
stem(omega,abs(X1)) % |X1(e^jw)|
xlabel('w=2*pi/k, k=1000')
ylabel('Magnitude')

subplot(3,1,3)
stem(omega,angle(X1))  %   Phase of X1(e^jw)
xlabel('w=2*pi/k, k=1000')
ylabel('Phase')

figure
subplot(3,1,1)
stem(n,x2)
xlabel('n')
ylabel('x[n]')
title('x_{2}[n] = cos((pi/2)*n)*(u[n]-u[n-100])')

subplot(3,1,2)
stem(omega,abs(X2))
xlabel('w=2*pi/k, k=1000')
ylabel('Magnitude')

subplot(3,1,3)
stem(omega,angle(X2))  
xlabel('w=2*pi/k, k=1000')
ylabel('Phase')

figure
subplot(3,1,1)
stem(n,x3)
xlabel('n')
ylabel('x[n]')
title('x_{3}[n] = u[n]-u[n-100]')

subplot(3,1,2)
stem(omega,abs(X3))
xlabel('w=2*pi/k, k=1000')
ylabel('Magnitude')

subplot(3,1,3)
stem(omega,angle(X3)) 
xlabel('w=2*pi/k, k=1000')
ylabel('Phase')

figure
subplot(3,1,1)
stem(n,x4)
xlabel('n')
ylabel('x[n]')
title('x_{4}[n] = x_{1}[n] + x_{2}[n]')

subplot(3,1,2)
stem(omega,abs(X4))
xlabel('w=2*pi/k, k=1000')
ylabel('Magnitude')

subplot(3,1,3)
stem(omega,angle(X4))  
xlabel('w=2*pi/k, k=1000')
ylabel('Phase')