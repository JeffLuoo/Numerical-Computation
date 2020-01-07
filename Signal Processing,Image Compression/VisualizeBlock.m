I = imread('operahall.jpg');
I = im2double(I);
I = I(1:32, 481:512);

Y = fft2(I);
figure(1);
bar3(Y);
h = bar3(Y)
set(h, 'facecolor', 'white');
title('2D FFT')

Y(1,1) = 0;
figure(2);
bar3(Y);
h = bar3(Y)
set(h, 'facecolor', 'white');
title('2D FFT - zero out 1')