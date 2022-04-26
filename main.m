I = imread('sheep.jpg');
imshow(I)
[bw,rgb] = elma_remove(I);
figure,imshow(bw);
figure,imshow(rgb);
