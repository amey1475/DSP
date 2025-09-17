 DSP EXP. NO 1 

1A)
CODE
A = 1;
f = 1;
omega = 2 * pi * f;
T = 1 / f;

t = 0:0.001:T;
x_t = A * sin(omega * t);

Fs = 8 * f;
Ts = 1 / Fs;
n = 0:ceil(Fs * T);
t_discrete = n * Ts;
x_n = A * sin(omega * t_discrete);

subplot(2,1,1);
plot(t, x_t, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous-Time Signal');
grid on;

subplot(2,1,2);
stem(t_discrete, x_n, 'r', 'filled');
xlabel('Time (s)');
ylabel('Amplitude');
title('Discrete-Time Signal (Sampled)');
grid on;
 

1B)
CODE
~GREATER THAN NYQUIST RATE
clc;
A1=5;
F1=2299;
F2=2*F1;
F3=3*F1;
FS=F1*8;
N=8;
T = 1/F1;
t = 0:T/100:T;
x = A1*sin(2*pi*F1*t) + A1*sin(2*pi*F2*t) + A1*sin(2*pi*F3*t);
figure('Name','FFT Analysis 1A');
subplot(3,1,1);
plot(t,x);
xlabel('time ms');
ylabel('x(t)');
%plot dt
n=0:N-1;
xn = A1*sin(2*pi*F1/FS*n) + A1*sin(2*pi*F2/FS*n) + A1*sin(2*pi*F3/FS*n);
subplot(3,1,2);
stem(n,xn);
xlabel('sample n');
ylabel('x(n)');
%plot dft
XFT=fft(xn,N);
disp(XFT);
XFTmag=abs(XFT);
subplot(3,1,3);
stem(n,XFTmag);
xlabel('discrete frequency k');
ylabel('XFTmag(k)');
 

~EQUAL TO NYQUIST RATE

clc;
A1=5;
F1=2299;
F2=2*F1;
F3=3*F1;
FS=2*F3;
N=8;
T = 1/F1;
t = 0:T/100:T;
x = A1*sin(2*pi*F1*t) + A1*sin(2*pi*F2*t) + A1*sin(2*pi*F3*t);
figure('Name','FFT Analysis 1A');
subplot(3,1,1);
plot(t,x);
xlabel('time ms');
ylabel('x(t)');
%plot dt
n=0:N-1;
xn = A1*sin(2*pi*F1/FS*n) + A1*sin(2*pi*F2/FS*n) + A1*sin(2*pi*F3/FS*n);
subplot(3,1,2);
stem(n,xn);
xlabel('sample n');
ylabel('x(n)');
%plot dft
XFT=fft(xn,N);
disp(XFT);
XFTmag=abs(XFT);
subplot(3,1,3);
stem(n,XFTmag);
xlabel('discrete frequency k');
ylabel('XFTmag(k)');
 

~LESS THAN NYQUIST RATE
clc;
A1=5;
F1=2299;
F2=2*F1;
F3=3*F1;
FS=2*F2;
N=8;
T = 1/F1;
t = 0:T/100:T;
x = A1*sin(2*pi*F1*t) + A1*sin(2*pi*F2*t) + A1*sin(2*pi*F3*t);
figure('Name','FFT Analysis 1A');
subplot(3,1,1);
plot(t,x);
xlabel('time ms');
ylabel('x(t)');
%plot dt
n=0:N-1;
xn = A1*sin(2*pi*F1/FS*n) + A1*sin(2*pi*F2/FS*n) + A1*sin(2*pi*F3/FS*n);
subplot(3,1,2);
stem(n,xn);
xlabel('sample n');
ylabel('x(n)');
%plot dft
XFT=fft(xn,N);
disp(XFT);
XFTmag=abs(XFT);
subplot(3,1,3);
stem(n,XFTmag);
xlabel('discrete frequency k');
ylabel('XFTmag(k)');

 








1C)
CODE
clear; close all; clc;

% --------- AUDIO FILE 1 ---------
[x1, fs1] = audioread("C:\Users\Arya\Downloads\machali.wav");
n1 = 0:length(x1)-1;  % Discrete sample index

% Plot time-domain signal (discrete x-axis)
figure;
subplot(2,1,1);
plot(n1, x1);
title('Audio 1 - Time Domain');
xlabel('Sample Index (n)');
ylabel('Amplitude');

% Frequency-domain plot
X1 = fft(x1);
f1 = 0:length(X1)-1;  % Discrete frequency bin index
subplot(2,1,2);
plot(f1, abs(X1));
title('Audio 1 - Frequency Domain');
xlabel('Frequency Bin');
ylabel('|X(f)|');

% --------- AUDIO FILE 2 ---------
[x2, fs2] = audioread("C:\Users\Arya\Downloads\flute.wav");
n2 = 0:length(x2)-1;

figure;
subplot(2,1,1);
plot(n2, x2);
title('Audio 2 - Time Domain');
xlabel('Sample Index (n)');
ylabel('Amplitude');

X2 = fft(x2);
f2 = 0:length(X2)-1;
subplot(2,1,2);
plot(f2, abs(X2));
title('Audio 2 - Frequency Domain');
xlabel('Frequency Bin');
ylabel('|X(f)|');
  
