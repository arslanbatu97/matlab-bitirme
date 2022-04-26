I = imread('elmaa.jpg');
imshow(I)
[bw,rgb] = elmaa_remove(I);
figure,imshow(bw);
figure,imshow(rgb);