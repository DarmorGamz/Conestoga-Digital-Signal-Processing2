Fs = 8000;   % Sampling frequency (Hz)
dur = 0.25;  % Duration of each note (s)

% Define the notes
A = 440;
B = 494;
C = 523;
D = 587;
E = 659;
F = 698;
G = 784;

% Define the melody (including rests)
melody = ['E','D','C','D','E','E','E','R','D','D','D','R','E','G','G','R','E','D','C','D','E','E','E','R','D','D','E','D','C','R'];

durations = [1 1 1 1 1 1 2 2,1 1 1 2,1 1 2 2,1 1 1 1 1 1 2 2,1 1 1 1 1 2];

% Generate the waveform
waveform = [];
for i = 1:length(melody)
    switch melody(i)
        case 'A'
            freq = A;
        case 'B'
            freq = B;
        case 'C'
            freq = C;
        case 'D'
            freq = D;
        case 'E'
            freq = E;
        case 'F'
            freq = F;
        case 'G'
            freq = G;
        case 'R' % Rest
            freq = 0;
    end
    t = 0:1/Fs:durations(i) * dur;
    note = sin(2*pi*freq*t);
    waveform = [waveform note];
end

% Play the waveform
soundsc(waveform, Fs);

% Save the waveform as a WAV file
filename = 'mary_had_a_little_lamb.wav';
audiowrite(filename, waveform, Fs);

% Plot the waveform
t = 0:1/Fs:length(waveform)/Fs-1/Fs;
plot(t, waveform, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Mary Had a Little Lamb');
ylim([-1.1, 1.1]);
%xlim([0.5, 0.6]); % set the x-axis limits to show a range from 0.5 to 2.5 seconds


##A WAV file is an audio file format that stores digital audio data.
##It is a common file format used for storing uncompressed audio on Windows-based
##computers.
##
##A WAV file consists of a series of digital samples, each representing
##the amplitude of the audio waveform at a particular point in time.
##The samples are typically stored as 16-bit or 24-bit integers,
##although other bit depths are possible. The samples are usually
##stored in little-endian format, meaning that the least significant
##byte of each sample is stored first.
##
##In addition to the audio data, a WAV file also includes metadata that
##describes the format of the audio data. This metadata includes information
##such as the sampling frequency, bit depth, and number of channels
##(mono or stereo). The metadata is stored in a header at the beginning of
##the file.
##
##Because WAV files store uncompressed audio data, they tend to be
##quite large compared to other audio file formats such as MP3 or AAC.
## However, they offer high quality and are widely supported by audio
## software and hardware.

