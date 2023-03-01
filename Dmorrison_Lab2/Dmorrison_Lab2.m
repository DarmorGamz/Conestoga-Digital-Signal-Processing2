#    1209, 1336, 1477, 1633
#697   1     2     3     A
#770   4     5     6     B
#852   7     8     9     C
#941   *     0     #     D

clear;

% Define the DTMF tone matrix
tones = [1209, 1336, 1477, 1633;
         697,  770,  852,  941 ];

% Define the phone number
phone_number = '1234567890ABCD*#';

% Define the Sample Frequency
Fs = 44100;

% Generate a signal for the phone number
pause_duration = 0.1; % in seconds

signal = [];
for digit = phone_number
    switch digit
        case '1'
            freqs = [tones(2,1), tones(1,1)];
        case '2'
            freqs = [tones(2,1), tones(1,2)];
        case '3'
            freqs = [tones(2,1), tones(1,3)];
        case '4'
            freqs = [tones(2,2), tones(1,1)];
        case '5'
            freqs = [tones(2,2), tones(1,2)];
        case '6'
            freqs = [tones(2,2), tones(1,3)];
        case '7'
            freqs = [tones(2,3), tones(1,1)];
        case '8'
            freqs = [tones(2,3), tones(1,2)];
        case '9'
            freqs = [tones(2,3), tones(1,3)];
        case '0'
            freqs = [tones(2,4), tones(1,4)];
        case 'A'
            freqs = [tones(2,1), tones(1,4)];
        case 'B'
            freqs = [tones(2,2), tones(1,4)];
        case 'C'
            freqs = [tones(2,3), tones(1,4)];
        case 'D'
            freqs = [tones(2,4), tones(1,4)];
        case '#'
            freqs = [tones(2,4), tones(1,1)];
        case '*'
            freqs = [tones(2,4), tones(1,3)];
    end
    signal = [signal, sin(2*pi*freqs(1)*(0:1/Fs:0.1)) + sin(2*pi*freqs(2)*(0:1/Fs:0.1))];
    pause_signal = zeros(1, round(Fs*pause_duration));
    signal = [signal, pause_signal];
end

% Save the signal to a WAV file
audiowrite('dtmf.wav', signal, 44100);














