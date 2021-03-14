
%Experiment 4

fl = 90; 
fh = 5.76e3;
[y,Fs] = audioread('fivewo.wav');
y = downsample(y,9);
Fs1 = Fs/9;

noise = randn(1,length(y));
numberbands = 16;
bands = logspace(log10(fl),log10(fh),numberbands + 1);
processed = zeros(1,length(y));
noise1 = zeros(1,length(y));


for i = [1:1:numberbands]
    f_lower = bands(i);
    f_higher = bands(i+1);
    [b,a] = butter(3,[f_lower f_higher]/Fs1);
    
    z = filter(b,a,y);%bandpassed signal
    noiseFiltered = filter(b,a,noise);
    
    env = transpose(abs(hilbert(z)));
    [b1,a1] = butter(3,240/Fs1);
    env = filter(b1,a1,env);

    env = env .* noiseFiltered;
    noise1 = noise1 + noiseFiltered;
    processed = processed + env;
end

processed = processed * max(y)/max(processed);
noise1 = noise1 * max(y)/max(processed);

n = 10e3;
y1 = abs(fftshift(fft(y,n)))/n;
y2 = abs(fftshift(fft(processed,n)))/n;
noise2 = abs(fftshift(fft(noise1,n)))/n;
w = (Fs1/n)*(-n/2 : 1: (n/2)-1);

figure;
tiledlayout("flow");

nexttile;
plot(y);
xlabel("[n]");
ylabel("Amplitude");
title('Sampled Signal');

nexttile;
plot(processed);
xlabel("[n]");ylabel("Amplitude");
title("Number of Bands = " + string(numberbands));

nexttile;
plot(noise1);
xlabel("[n]");ylabel("Amplitude");
title("Added noise");

nexttile;
plot(w,y1);
xlabel("frequency");
ylabel("magnitude");
title("sampled signal spectrum");

nexttile;
plot(w,y2);
xlabel("frequency");
ylabel("magnitude");
title("processed signal spectrum @ "+ string(numberbands) + " band(s)");

nexttile;
plot(w,noise2);
xlabel("frequency");
ylabel("magnitude");
title("processed noise spectrum @ "+ string(numberbands) + " band(s)");

filename = "Bands_" + string(numberbands) + ".wav";
audiowrite(filename,processed,floor(Fs1));
