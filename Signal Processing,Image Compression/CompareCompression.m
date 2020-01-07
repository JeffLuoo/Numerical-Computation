I = imread('operahall.jpg');
I = im2double(I);

figure(1);
subplot(2,2,1);
P1 = Compress(I, 0.015);
imshow(P1);
title('P1 tol=0.015, drop = 0.5');

subplot(2,2,2);
P2 = Compress(I, 0.063);
imshow(P2);
title('P2 tol=0.063, drop = 0.85');

subplot(2,2,3);
P3 = Compress(I, 0.161);
imshow(P3);
title('P3 tol=0.161, drop = 0.95');

subplot(2,2,4);
P4 = Compress(I, 0.3);
imshow(P4);
title('P4 tol=0.3, drop = 0.98');


figure(2);
subplot(2,2,1);
f1 = ones(size(I)) - abs(P1 - I);
imshow(f1);
title('f1 tol=0.015, drop = 0.5');

subplot(2,2,2);
f2 = ones(size(I)) - abs(P2 - I);
imshow(f2);
title('f2 tol=0.063, drop = 0.85');

subplot(2,2,3);
f3 = ones(size(I)) - abs(P3 - I);
imshow(f3);
title('f3 tol=0.161, drop = 0.95');

subplot(2,2,4);
f4 = ones(size(I)) - abs(P4 - I);
imshow(f3);
title('f4 tol=0.3, drop = 0.98');
