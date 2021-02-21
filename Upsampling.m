
%Experiment 1D

Fs = 12e3;                                                                 % sampling frequency = 12kHz
t = 0:1/Fs:1;                                                              % discrete time
f = 4e3;                                                                   % signal frequency = 4kHz
S1 = 5*cos(2*pi*f*t);                                                      % signal
N = 128;                                                                   % 128 point DFT
S2 = fftshift(fft(S1,N));                                                  % signal in frequency domain
mag_S2 = abs(S2) / N;                                                      % signal 

L = 2;                                                                     % upscaling factor

freq = (Fs/N) * (-(N/2)+1:(N/2));                                          % scaling frequency over N points
freq_upsampled = (Fs*L/N) * (-(N/2)+1:(N/2));                              % upsampling frequency vector

t_upsampled = 0:1/(Fs*L):1;
S1_upsampled = zeros(1,L*(length(t)-1)+1);                                 %S1_upsmapled = zeroes added to S1
j = 1;
for i = 1:L:length(t)*L
    S1_upsampled(i) = S1(j);
    j = j+1;
end
S2_upsampled = fftshift(fft(S1_upsampled,N));                              %S2_upsampled = DFT of S1_upsampled
mag_S2_upsampled = abs(S2_upsampled) / N;

[b,a] = butter(2, 1/(L*2));
S3 = filter(b,a,S1_upsampled);                                             %S3 = S2_upsampled passed through a butterworth filter 
S4 = fftshift(fft(S3,N));                                                  %S4 = DFT of S3_upsampled
mag_S4 = abs(S4)/N;                 

figure(1)

% discrete time sampled signal
subplot(321)
stem(t, S1, 'black');                                     
axis([0 0.005 -6 6]);
xlabel('discrete time');
ylabel('S1');
title('Discrete time sampling @ Fs = 12kHz');
grid minor;

% DFT of the  signal @ sampling frequency
subplot(322)
stem(freq, mag_S2, 'black');                               
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 12kHz; N = 128');
grid minor;

% discrete time pseudo-upsampled signal
subplot(323)
stem(t_upsampled, S1_upsampled, 'black'); 
axis([0 0.005 -6 6]);
xlabel('discrete time');
ylabel('S2');
title('Discrete time sampling after adding zeroes');
grid minor;

% DFT of the  signal @ psedo-upsampling frequency
subplot(324)
stem(freq_upsampled, mag_S2_upsampled, 'black');                               
xlabel('frequency (Hz)');
ylabel('|S2|/N');
title('DFT @ Fs = 24kHz, N = 128 without filtering');
grid minor;

% discrete time upsampled signal
subplot(325)
stem(t_upsampled, S3, 'black'); 
axis([0 0.005 -6 6]);
xlabel('discrete time');
ylabel('S1 upsampled');
title('Discrete time sampling after passing through a butterworth filter');
grid minor;

% DFT of the  signal upsampling frequency = 24kHz
subplot(326)
stem(freq_upsampled, mag_S4, 'black');                               
xlabel('frequency (Hz)');
ylabel('|S4|/N');
title('DFT @ Fs = 24kHz, N = 128 with filtering');
grid minor;

figure (2)

% upsampled discrete time sampled signal
subplot(211)
Fs = 24e3;                                                                 % sampling frequency = 12kHz
t = 0:1/Fs:1;                                                              % discrete time
f = 4e3;                                                                   % signal frequency = 4kHz
S5 = 5*cos(2*pi*f*t);                                                      % signal
stem(t, S5, 'black');                                     
axis([0 0.005 -6 6]);
xlabel('discrete time');
ylabel('S1');
title('Discrete time sampling @ Fs = 24kHz');
grid minor;

% interpolated discrete time sampled signal
subplot(212)
stem(t_upsampled, S3, 'black'); 
axis([0 0.005 -6 6]);
xlabel('discrete time');
ylabel('S1 upsampled');
title('Interpolated and upsampled discrete time sampling from Fs = 12kHz - 24kHz');
grid minor;
