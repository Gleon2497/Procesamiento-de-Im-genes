clear
clc
close all

RGB = imread("Imagenes.png");

BW=im2bw(RGB,0.5);

BW = not(BW)

%el número aqui sera el radio

s = strel('disk',15);

eroBW=imerode(BW,s);
figure, imshow(eroBW), title 'Calculo de Erosión, radio 15';

dilBW=imdilate(BW,s);
figure, imshow(dilBW), title 'Calculo de Dilatación, radio 15';

apeBW=imopen(BW,s);
figure, imshow(apeBW), title 'Calculo de Apertura, radio 15';

cieBW=imclose(BW,s);
figure, imshow(cieBW), title 'Calculo de Cierre, radio 15';

I = imread("Imagenes.png");

J = rgb2gray(I);

gradienteMorf = imdilate(J,s)-imerode(J,s);

figure, imshow(gradienteMorf), title 'Calculo del gradiente morfologico, radio 15';