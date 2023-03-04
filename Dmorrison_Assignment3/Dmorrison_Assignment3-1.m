clear;

% Load the audio file
[x, Fs] = audioread('Saxaphone8k.wav');

% Define the number of DFT points
N = length(x); % Use the same number of points as the length of x

% Compute the DFT
X = fft(x, N);
X_mag = abs(X) * 2 / N;

% Take the inverse DFT
x_recon = ifft(X);

% Play out the reconstructed audio
soundsc(x_recon, Fs);

% Compute the error between the original and reconstructed signal
error = x - x_recon;

% Plot the error as a function of discrete time
t = linspace(0, length(x) / Fs, length(x));
plot(t, error);
xlabel('Time (s)');
ylabel('Error');
