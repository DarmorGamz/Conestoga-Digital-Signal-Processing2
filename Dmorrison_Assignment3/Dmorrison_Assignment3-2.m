% Load the audio file
[x, Fs] = audioread('Saxaphone8k.wav');
x = x(:,1); % if stereo

% Define MDCT window length and hop size
N = 2048;
H = N/2;

% Generate MDCT basis functions
M = N/2;
w = sqrt(2*M)*sin((pi/(2*M))*(0:(M-1)+0.5));
W = diag(w);
K = diag([w(1)/sqrt(2) sqrt(2)*w(2:end)]);
F = sqrt(2/M)*[K*cos((pi/(2*M))*(0:(M-1)) + pi/4) K*sin((pi/(2*M))*(M:(2*M-1))+pi/4)];

