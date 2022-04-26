close all;
clear;
clc;
%% resim okuma
image = imread('giraffe_2.jpg');
imshow(image); 
title('Orijinal Goruntu')
subplot(1,1,1)
figure,
image_gray = rgb2gray(image);
imshow(image_gray)
title('Gri Goruntu')

%% Edge Detection Detail
BW4 = edge(image_gray,'sobel',0.15);
imshow(BW4);
title('Edge Detection')
figure,

%% Edge Detection

edges_prewitt = edge(image_gray,'Prewitt');
imshow(edges_prewitt)
title('Prewitt')
figure,

%% Roberts Edge

edges_roberts = edge(image_gray,'Roberts');
imshow(edges_roberts)
title('Roberts')

%% Sobel

%edges_sobel = (image_gray,'Sobel');
%imshow(edges_sobel)
%title('Sobel')
%figure,
%% imfill komutu ile iç doldurma

BW5 = imfill(BW4,'holes');
imshow(BW5)
title('Doldurulmu? Görsel')
impixelinfo;

%% Morfolojik i?lemler

se2 = strel('disk',1); 
dilate = imdilate(BW4,se2); 
imshow(dilate) 
title('Dilation') 
figure,

%% GrayThresh uygulamasini gerçeklestirdim.
level = graythresh(image_gray);
BW =  imbinarize(image_gray,level);
imshow(BW)
title('Gray Thresh Goruntusu')
%figure,
%% Adaptive thresholding sonuç olarak ortalama degeri level = 0.4784 cikti?
T = adaptthresh(image_gray, 0.50);
BW_2 = imbinarize(image_gray,T);
imshow(BW_2)
title('Adaptive Thresholding Goruntusu')
%figure,
%% Morfolojik islem görüntüsü
%se1 = strel('disk',1);
%erode = imerode(BW_2,se1);
%imshow(erode)
%title('Erozyon görüntüsü')
%figure,
%% Resimleri Toplam?
% Burada BW_3 de?eri logical oldugu için im2uint8 fonksiyonu ile logical to
%uint8 format?na dönü?türdüm. Sonra farklarini aldim fakat ilk deneme
%basarisiz oldu. Zürafanin içi tamam?yla beyaz ve arka kisminin tamam? ile
%siyah olmasi gerekiyor yaptigim uygulamada.
%new_binary_converted = im2uint8(BW);
%total = image - new_binary_converted ;
%imshow(total)
%figure,
%% Histogram
%imhist(image_gray)
%% Pixel Info
%imtool(image_gray)



