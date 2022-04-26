clear all;
close all;
clc;

img = imread('giraffe.jpg');
%subplot(2,1,1);
imshow(img);
title('Orijinal Görüntü')
figure;
img_gray = rgb2gray(img);
%subplot(2,1,2);
imshow(img_gray)
title('Siyah Beyaz Görüntü')
figure;

BW = imbinarize(img_gray);
imshow(BW)
title('Binary Goruntu')

%yap? eleman?n? seçiyorum.
st = strel('disk',8);
er = imerode(BW,st);
imshow(er);
title('Erozyandan sonraki görüntü');



