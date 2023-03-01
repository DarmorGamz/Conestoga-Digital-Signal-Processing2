clear;

Fr = 10;         % Modulation rate
Fs = 44100;      % Sampling rate, Hz
A = 1;          % Depth

% Read the sample waveform
[x,Fs] = audioread('Saxaphone8k.wav');

% Time index
n = 1:length(x);

z = (1+ A*sin(2*pi*n*(Fr/Fs)))';
y = z.*x;

% Write output
audiowrite('Dmorrison_Lab3.wav',y,Fs);
disp('play output audio');
sound(y, Fs);
