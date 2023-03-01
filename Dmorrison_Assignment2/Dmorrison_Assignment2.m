clear;

% Carrier and intelligence signal provided
fi = 10000;
fc = 100000;
fs = 2.00001*fc;
N = 100000;
Ac = 1;
Ai = 1;
corr = 50;

% Modulation
for n = 0:N-1
    f(n+1) = fs/N*n;
    discrete(n+1) = n;
    vAM(n+1) = (Ac + Ai*sin(2*pi*fi/fs*n/N*corr))*sin(2*pi*fc/fs*n/N*corr);
end

% Demodulation
vrec = vAM .* sin(2*pi*fc/fs*discrete/N*corr); % multiply the modulated signal by a local oscillator at the carrier frequency to shift it back to baseband
[b,a] = butter(10,2*fi/fs,'low'); % design a low-pass filter with cutoff frequency equal to the modulation frequency
vfiltered = filter(b,a,vrec); % apply the low-pass filter to extract the original signal
vdemod = vfiltered / Ac; % divide by the carrier amplitude to obtain the demodulated signal with correct amplitude scaling

figure
subplot(3,1,1)
plot(discrete, vAM)
xlabel('n')
ylabel('vAM(n)')
title('Original Modulated signal')

subplot(3,1,2)
plot(discrete, vrec)
xlabel('n')
ylabel('vdemod')
title('Demodulated signal')

subplot(3,1,3)
plot(discrete, vdemod)
xlabel('n')
ylabel('vout(n)')
title('Demodulated and filtered signal')



