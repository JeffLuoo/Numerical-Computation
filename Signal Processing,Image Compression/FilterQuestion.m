N = length(y);
xpts = linspace(0,N,N);
figure(1);
plot(xpts, y);
title('sound of birds and train');
    
F = fft(y);
figure(2);
h = stem(xpts, abs(F));
set(h, 'Marker', 'none')
title('sound of DFT birds and train');

trainIndex = 2200;

birdIndex = 2500;


% isolate the train sound, zero out bird - low pass
train_Sound = F;
train_Sound(trainIndex: N - trainIndex) = 0;
train_sound = ifft(train_Sound);

figure(3);
plot(xpts, real(train_sound));
title('Train only - Plot');
figure(4);
a = stem(xpts, abs(train_Sound));
set(a, 'Marker', 'none');
title('Train only - stem');


% isolate the bird sound, zero out train, high pass
bird_Sound = F;
bird_Sound(1:birdIndex) = 0;
bird_Sound(N - birdIndex: N) = 0;
bird_sound = ifft(bird_Sound);

figure(5);
plot(xpts, real(bird_sound));
title('Bird only - Plot');
figure(6);
b = stem(xpts, abs(bird_Sound));
title('Bird only - stem');
set(b, 'Marker', 'none');

