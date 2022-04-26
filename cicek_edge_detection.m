clc
clear all
close all
warning off

x = imread('flower.png');
figure;
imshow(x);
title('Original Image');

edge_detected_image = edge(rgb2gray(x),'canny');
figure;
imshow(edge_detected_image);
title('Edge Deteced Image')

mask_image=bwareaopen(imopen(imfill(imclose(edge(rgb2gray(x),'canny'),strel('line',3,0)),'holes'),strel(ones(3,3))),1500);
figure;
imshow(mask_image);
title('Maskelenmis Goruntu');
red_processed=x(:,:,1).*uint8(mask_image);
green_processed=x(:,:,2).*uint8(mask_image);
blue_processed=x(:,:,3).*uint8(mask_image);
output=cat(3,red_processed,green_processed,blue_processed);
figure;
imshow(output);
title('Cikan Goruntu')