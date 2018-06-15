SCALING_FACTOR = 0.75;

IM_FILE = '';
I = im2double(imread(IM_FILE));

%drawSeams(I);

I2 = scaleImage(I,SCALING_FACTOR);

figure(1);
subplot(2,1,1);
imshow(I)
title("Original Size");
subplot(2,1,2);
imshow(I2)
title(sprintf("%d%% of Original Size", SCALING_FACTOR * 100));
