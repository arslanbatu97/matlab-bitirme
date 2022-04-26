clc, close all; clear all

%% imge okuma
image = imread('giraffe_3.jpg');
imshow(image); 
title('Orijinal Goruntu')

subplot(2,2,1);
image_gray = rgb2gray(image);
imshow(image_gray)
title('Gri Goruntu')
BW = imbinarize(image_gray);
imshow(BW)
title('Ikili Görüntü')
subplot(2,2,2)
imshow(edge(image_gray,'sobel'));
title('Sobel Filter')
subplot(2,2,3)
imshow(edge(image_gray,'prewitt'));
title('Prewitt Filter')
subplot(2,2,4)
imshow(edge(image_gray,'canny'));
title('Canny Filter')
figure;
%%

edge_detected = imfill(imclose(edge(image_gray,'sobel'),strel('line',7,0)),'holes');
imshow(edge_detected);
title("Edge Detected")

%% Finally, find only giraffe based on properties

final_edges = edge(edge_detected,'Sobel', 0.12);
imshow(final_edges)


%% Erozyon ??lemi yap?p beyazl?klar? yok etmeyi çal??mak

se = strel('disk',8);
erodedBW = imdilate(edge_detected,se);
imshow(erodedBW)
title('Erozyon Goruntusu')

%imdilate(imdilate(edge_detected,strel('disk',5,0)),strel('disk',5,6));
%ms =bwareaopen(imopen(imfill(imclose(edge(rgb2gray(image),'canny'),strel('line',3,0)),'holes'),strel(ones(3,3))),1500);
mask_image = (imdilate(imdilate(edge_detected,strel('line',9,0)),strel('line',9,90)));
imshow(mask_image)
%imshow(labeloverlay(image,mask_image,'Colormap',[0 0 0]));
title('Son Hali');

red_processed=image(:,:,1).*uint8(mask_image);
green_processed=image(:,:,2).*uint8(mask_image);
blue_processed=image(:,:,3).*uint8(mask_image);
op=cat(3,red_processed,green_processed,blue_processed);
figure;
title('Morfolojik ??lemlerden Sonraki Hali')
imshow(op);

%% GÜNCELLEMELER 5.HAFTA

BW1_giraffe = imread('BW1_giraffe.png');
figure,imshow(BW1_giraffe);

BWmax = bwpropfilt(mask_image,'Area',1,'largest');
figure;
imshow(BWmax)

[bwLabel,num] = bwlabel(BWmax,4);

s = regionprops(bwLabel,'Area');
s1 = regionprops(bwLabel,'BoundingBox');
s_tum = regionprops(bwLabel,'all');

%%
imshow(image)
hold on;
rectangle('Position',s1.BoundingBox,'EdgeColor','y','LineWidth',4)
hold off

%% Karesiz zebra

red_processed=image(:,:,1).*uint8(BW1_giraffe);
green_processed=image(:,:,2).*uint8(BW1_giraffe);
blue_processed=image(:,:,3).*uint8(BW1_giraffe);
output_2=cat(3,red_processed,green_processed,blue_processed);
figure;
imshow(output_2);

%%
%[L, Ne] = bwlabel(output_2);
%%
%propied = regionprops(L);
%hold on

%% 
%for n=1:size(s,2)
    %rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2);
%end
%pause(3)
%%
%s = find([propied.Area]>1000);
%for n = 1:size(s,2)
    %rectangle('Position',propied(s(n)).BoundingBox,'EdgeColor','g','LineWidth',2);
%end


%% imfill ile zürafay? doldurmak
%doldurma = imfill(ms,[1 ,1]);
%doldurma = imfill(ms,'holes');
%imshow(doldurma)
%title('Doldurulmus Imge')

%stats=regionprops(mask_image,'MajorAxisLength','MinorAxisLength');
%stats=regionprops(mask_image,'MajorAxisLength','MinorAxisLength','Eccentricity');
%stats1 = struct('MinorAxisLength', {stats(4).MinorAxisLength});
%stats2 = regionprops(mask_image);







