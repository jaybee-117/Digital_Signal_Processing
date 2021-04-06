clear all;

%Amplitude
A = 2;
%Signal frequency
F0 = 4e3;
%Sampling Frequency
Fs = 4*F0;
%time
t = 0:1/Fs:1-1/Fs;
%signal without noise sampled at Fs
m = A*sin(2*pi*F0*t);
%noise
n = normrnd(0,1,1,length(m));
%signal with noise sampled at Fs
x = m + n;
N = length(x);
%order of the filter
p = 20;
%filter coefficients
W_coeff = zeros(p,1);
W_coeff_new = W_coeff;
%const. values
u = 1e-4;
e = 1e-3;

%input signal with added delays
X = zeros(p,p);
for j = 1:p
    d(j) = x(N-j+1);   %matrix containg the delayed elements of the signal
    for i = 1:p
        X(j,i)=x(N-i-j+2);
    end
end

%relative change index
i = 1;

%"Adaptive" part

while (1)
%Update the filter coefficient
W_coeff = W_coeff_new;
%filter output
Y = X'* W_coeff;
%error calculation
E = d'- Y;
%filter coefficient 
W_coeff_new = W_coeff + u*X*E;
%error
rel_chng(i) = (norm(W_coeff_new-W_coeff)/norm(W_coeff))^2;
%check if error is less than our threshold
if rel_chng(i) < e
    break;
end
%index updation
i = i+1;
end

%Final signal
omega = -pi:0.01:pi;    
h = freqz(W_coeff_new,1,omega);
freq = omega*(Fs/(2*pi));

%Plots:

%Relative change
figure(1)
plot(rel_chng);
title("Relative change");
xlabel("Iteration number");
ylabel("Error");
grid on;


%Filtered signal
figure(2)
plot(freq,fftshift(abs(h).^2));
title(sprintf("Transfer function response @ F =%d kHz ",F0/1000));
xlabel("Frequency");
ylabel("|H(w)|^2");
grid on;
grid minor;