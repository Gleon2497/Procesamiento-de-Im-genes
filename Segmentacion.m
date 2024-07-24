clear
clc
close all


RGB = imread("Imagenes.png");

BW = im2bw(RGB,0.5);

BW = not(BW);

s = strel('disk',3);

BW = imdilate(BW,s);

BW = imfill(BW,'holes');

imshow(BW);
