clear
clc
close all


RGB = imread("Imagenes.png");
I=rgb2gray(RGB);

BW1 = edge(I,"canny");
BW2 = edge(I,"canny",0.1);
BW3 = edge(I,"canny",0.1,5);

figure
imshow(BW1);
figure
imshow(BW2);
figure
imshow(BW3);


