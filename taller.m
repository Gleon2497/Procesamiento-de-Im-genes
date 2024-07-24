clear
clc
close all


RGB = imread("Imagenes.png");
imshow(RGB);

I=rgb2gray(RGB);
figure
imshow(I)

I = im2double(I)
I = log(1+I)

M = 2*size(I,1) + 1;
N = 2*size(I,2) + 2;

sigma = 5;

[X,Y] = meshgrid(1:N,1:M);
centerX = ceil(N/2);
centerY = ceil(N/2);
Numeradorgaussiano = (X - centerX).^2 + (Y - centerY).^2;
H = exp(-Numeradorgaussiano./(2*sigma.^2));
H = 1 - H;

H = fftshift(H);

If = fft2(I, M, N);
Iout = real(ifft2(H.*If));
Iout = Iout(1:size(I,1),1:size(I,2));

Ihmf = (1.3 - 0.3)*Iout+0.3;

imshowpair(I, Ihmf, 'montage')