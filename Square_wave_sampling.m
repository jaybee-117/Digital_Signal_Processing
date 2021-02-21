
%Experiment 1C

Fs = 20e3;                                   % sampling frequency 12kHz
t= 0:1/Fs:1;                                 % data sampling points
S1 = square(2e3*pi*t);                       % square wave with time period 1ms

N = 256;
S2 = fftshift(fft(S1, N));                   % N point DFT 
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
mag_S2 = abs(S2)/N;                          % magnitude of the signal per frequency

figure(1)

subplot(211)
stem(t, S1, 'black', 'LineWidth' , 2);          % discrete time sampled signal
axis([0 0.01 -1.5 1.5]);
xlabel('discrete time');
ylabel('Signal');
title('Discrete time sampling @ Fs = 20kHz');
grid minor;

subplot(212)
stem(freq, mag_S2, 'black', 'LineWidth', 2);     % Magnitude of the signal Vs the frequency
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 20kHz; N = 256');
grid minor;