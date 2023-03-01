global cos_wave;
clear cos_wave;

frequency = 10e3; % Set the frequency of the wave

n1 = linspace(0,10,1000);
carrier_wave = cos_wave(frequency, n1);

n2 = linspace(0,1,100);
frequency2 = 1e3; % Set the frequency of the wave
tonal_input_wave = cos_wave(frequency2, n2);

figure;
subplot(3,1,1);
plot(n1, carrier_wave);
title("Carrier wave with frequency");
xlabel("Time");
ylabel("Amplitude");
subplot(3,1,2);
plot(n2, tonal_input_wave);
title("Tonal input wave with frequency");
xlabel("Time");
ylabel("Amplitude");

% Define the carrier frequency and modulation index
fc = 10;
mod_index = 0.5;

% Define the message signal frequency and duration
fm = 1;
t = 0:1/fc:2;

% Generate the message signal
m = sin(2*pi*fm*t);

% Amplitude Constant
A = 1;

% Generate the modulated signal
y = A*sin(2*pi*fc*t + mod_index*sin(2*pi*fm*t));

% Plot the message and modulated signals
subplot(3,1,3);
plot(t, m, 'r', t, y, 'b')
title("Analog FM modulation");
xlabel("Time");
ylabel("Amplitude");
legend('Message Signal', 'Modulated Signal')




