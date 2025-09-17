Exp No.4

CODE:-
clear;
close all;
clc;
[x,Fs] = audioread("C:\Users\yourfilelocation");
% [x,Fs] = audioread("C:\Users\yourfilelocation\machali.wav");
disp(['Sampling frequency "Fs" is ', num2str(Fs), ' Hz']);
lpspec = input('Enter LPF specifications [fp, Apdb, fs, AsdB] : ' ...
    );
fp   = lpspec(1);
Apdb = lpspec(2);
fsn  = lpspec(3);      
AsdB = lpspec(4);
fc   = (fp + fsn)/2;         
wc   = 2*pi*fc;               
ftran = (fsn - fp);           
disp(['Normalized transition frequency "ftran" is ', num2str(ftran)]);
Ndis = 1024;                  
ftran = ftran/2;
if (Apdb >= 0.7416) && (AsdB <= 21)
    sel = 1;  % rectangular window
    N = ceil(0.9/ftran);
    if rem(N,2) == 0, N = N + 1; end   % N must be odd
    disp(['Rectangular window of length N = ', num2str(N), ' is chosen']);
    b = fir1(N-1, fc, 'low', rectwin(N));      % FIR LPF (z-domain coeffs)
    freqz(b,1,Ndis);                           % display frequency response
elseif (Apdb >= 0.0546) && (AsdB <= 44)
    sel = 2;  % hanning window
    N = ceil(3.1/ftran);
    if rem(N,2) == 0, N = N + 1; end
    disp(['Hanning window of length N = ', num2str(N), ' is chosen']);
    b = fir1(N-1, fc, 'low', hann(N));
    freqz(b,1,Ndis);
elseif (Apdb >= 0.0194) && (AsdB <= 53)
    sel = 3;  % hamming window
    N = ceil(3.3/ftran);
    if rem(N,2) == 0, N = N + 1; end
    disp(['Hamming window of length N = ', num2str(N), ' is chosen']);
    b = fir1(N-1, fc, 'low', hamming(N));
    freqz(b,1,Ndis);
elseif (Apdb >= 0.0017) && (AsdB <= 74)
    sel = 4;  % blackman window
    N = ceil(5.5/ftran);
    if rem(N,2) == 0, N = N + 1; end
    disp(['Blackman window of length N = ', num2str(N), ' is chosen']);
    b = fir1(N-1, fc, 'low', blackman(N));
    freqz(b,1,Ndis);
else
    error('Error. Invalid filter specifications.');
end
x = x(:,1);
xlen = length(x);
disp(['Length of audio signal is ', num2str(xlen)]);
t = 0:(length(x)-1);          % sample index n
timeduration = xlen*(1/Fs);
disp(['Time-duration of audio signal is ', num2str(timeduration), ' sec']);
xlp = filter(b,1,x);          % apply FIR LPF
figure('Name','Original and filtered signals');
subplot(2,1,1);
plot(t, x);
title('Original Signal');
xlabel('sample n');
ylabel('Original signal "x"');
ys = ylim;
subplot(2,1,2);
plot(t, xlp);
title('Lowpass Filtered Signal');
xlabel('sample n');
ylabel('Filtered signal "xlp"');
ylim(ys);


a) lpspecrec_1 =  [0.01, 0.877, 0.03, 18]	Rectangular window
 




b) lpspecrec_2 =  [0.02, 0.877, 0.04, 18]	Rectangular window
 

c) lpspecrec_3 =  [0.03, 0.877, 0.05, 18]	Rectangular window
 

d) lpspecrec_4 =  [0.07, 0.877, 0.09, 18]	Rectangular window
 
e) lpspechan =     [0.02, 0.103, 0.06, 27]	Hanning window
 

f) lpspecham =    [0.02, 0.0376, 0.06, 48]	Hamming window
 

    g) lpspecblk =     [0.02, 0.0155, 0.06, 62]	Blackman window
 



