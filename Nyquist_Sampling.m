
%Experiment 1A

Fs = 12e3;                                  % sampling frequency 12kHz
t= 0:1/Fs:1;                                % data sampling points
S1 = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t); % signal has freq = 1kHZ, 2kHZ & 4kHz

figure(1)

tiledlayout('flow') 
nexttile 
stem(t, S1, 'Color' ,'#77AC30');       % discrete signal data
axis([0 0.01 -10 20]);
xlabel('discrete time');
ylabel('Signal');
title('Discrete time sampling @ Fs = 12kHz');
grid minor;

nexttile
N = 64;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color' ,'#77AC30');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 12kHz; N = 64');
grid minor;

nexttile
N = 128;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color' ,'#77AC30');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 12kHz; N = 128');
grid minor;

nexttile
N = 256;
S2 = fftshift(fft(S1,N));                   % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));           % scaling frequency over N points
%L = 1:floor(N/2);                          % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                         % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color' ,'#77AC30'); % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 12kHz; N = 256');
grid minor;