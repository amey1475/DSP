DSP EXP. NO 2

2A)
CODE
clear; close all; clc;

x = [4, 9, 3, 2];
h = [1, 9, 0, 4];
L = length(x);   % same length for x, h, and circular convolution

% Linear convolution
y = zeros(1, 2*L - 1);
for n = 1:length(y)
    y(n) = 0;
    for k = max(1, n-L+1):min(L, n)
        y(n) = y(n) + x(k)*h(n-k+1);
    end
end

% Circular convolution 
p = zeros(1, L);
for n = 1:L
    for k = 1:L
        p(n) = p(n) + x(k) * h(mod(n - k, L) + 1);
    end
end


% Display signals and results
disp('Input signal x:');
disp(x);

disp('Impulse response h:');
disp(h);

disp('Linear convolution result y:');
disp(y);

disp('Circular convolution result p:');
disp(p);

% Plotting
figure;
subplot(4,1,1);
stem(1:L, x, 'filled');
title('Input signal x(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,2);
stem(1:L, h, 'filled');
title('Impulse response h(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
stem(1:length(y), y, 'filled');
title('Linear convolution y(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,4);
stem(1:L, p, 'filled');
title('Circular convolution p(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

 

2B)
CODE
clear; close all; clc;

x = [4, 9, 3, 2, 1];       % length 5
h = [1, 9, 0, 4];          % length 4

M = length(x);
N = length(h);

L_linear = M + N - 1;      % Length of linear convolution

% Zero pad signals to length L_linear
x_pad = [x zeros(1, L_linear - M)];
h_pad = [h zeros(1, L_linear - N)];

% Linear convolution
y_linear = conv(x, h);

% Circular convolution with length L_linear
y_circ = zeros(1, L_linear);
for n = 1:L_linear
    for k = 1:L_linear
        y_circ(n) = y_circ(n) + x_pad(k) * h_pad(mod(n - k, L_linear) + 1);
    end
end


% Display results
disp('Linear convolution output y_linear:');
disp(y_linear);

disp('Circular convolution output y_circ:');
disp(y_circ);

% Plotting

figure;
subplot(4,1,1);
stem(0:M-1, x, 'filled');
title('Input signal x(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,2);
stem(0:N-1, h, 'filled');
title('Impulse response h(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
stem(0:L_linear-1, y_linear, 'filled');
title('Linear Convolution y\_linear(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,4);
stem(0:L_linear-1, y_circ, 'filled');
title('Circular Convolution y\_circ(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

 
