
%Experiment 1B

Fs = 4e3;                                                                  % sampling frequency 4kHz
t= 0:1/Fs:1;                                                               % data sampling points
S1 = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);           % signal has freq = 1kHZ, 2kHZ & 4kHz

figure(1)

tiledlayout('flow') 
nexttile    
stem(t, S1, 'Color', '#0072BD');         % discrete signal data
axis([0 0.01 -10 20]); 
xlabel('discrete time');
ylabel('Signal');
title('Discrete time sampling @ Fs = 4kHz');
grid minor;

nexttile  
N = 64;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#0072BD');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 4kHz; N = 64');
grid minor;

nexttile  
N = 128;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#0072BD');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 4kHz; N = 128');
grid minor;

nexttile  
N = 256;
S2 = fftshift(fft(S1,N));                   % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));           % scaling frequency over N points
%L = 1:floor(N/2);                          % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                         % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#0072BD'); % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 4kHz; N = 256');
grid minor;

Fs = 5e3;                                                                  % sampling frequency 4kHz
t= 0:1/Fs:1;                                                               % data sampling points
S1 = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);           % signal has freq = 1kHZ, 2kHZ & 4kHz

nexttile    
stem(t, S1, 'Color','#D95319');         % discrete signal data
axis([0 0.01 -10 20]); 
xlabel('discrete time');
ylabel('Signal');
title('Discrete time sampling @ Fs = 5kHz');
grid minor;

nexttile  
N = 64;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#D95319');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 5kHz; N = 64');
grid minor;

nexttile  
N = 128;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#D95319');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 5kHz; N = 128');
grid minor;

nexttile  
N = 256;
S2 = fftshift(fft(S1,N));                   % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));           % scaling frequency over N points
%L = 1:floor(N/2);                          % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                         % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#D95319'); % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 5kHz; N = 256');
grid minor;

Fs = 8e3;                                                                  % sampling frequency 4kHz
t= 0:1/Fs:1;                                                               % data sampling points
S1 = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) + 2*cos(2*pi*4e3*t);           % signal has freq = 1kHZ, 2kHZ & 4kHz

nexttile     
stem(t, S1, 'Color','#EDB120');         % discrete signal data
axis([0 0.01 -10 20]); 
xlabel('discrete time');
ylabel('Signal');
title('Discrete time sampling @ Fs = 8kHz');
grid minor;

nexttile  
N = 64;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#EDB120');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 8kHz; N = 64');
grid minor;

nexttile  
N = 128;
S2 = fftshift(fft(S1,N));                    % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));            % scaling frequency over N points
%L = 1:floor(N/2);                           % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                          % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#EDB120');  % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 8kHz; N = 128');
grid minor;

nexttile  
N = 256;
S2 = fftshift(fft(S1,N));                   % N point DFT of signal
freq = (Fs/N) * (-(N/2)+1:(N/2));           % scaling frequency over N points
%L = 1:floor(N/2);                          % taking half of all the frequency points because S1(f) = S1(Fs-f)
mag_S2 = abs(S2/N);                         % magnitude of the signal per frequency
stem(freq, mag_S2, 'Color','#EDB120'); % discrete fourier transform
xlabel('frequency (Hz)');
ylabel('|S1|/N');
title('DFT @ Fs = 8kHz; N = 256');
grid minor;