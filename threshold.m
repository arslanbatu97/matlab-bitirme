clc;
clear all;

image = imread('rice.png');
mean_image = imfilter(image, fspecial('average' , [15,15]),'replica');
substract = image - (mean_image+20);
black_white = imbinarize(substract,0);

subplot(1,2,1); 
imshow(black_white); 
title('Treshold Image');

subplot(1,2,2); 
imshow(image); 
title('Original Image');


