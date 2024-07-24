clear
clc
close all

RGB = imread("IMG_20221009_121928.jpg")

BW = im2bw(RGB,0.5);

BW = not(BW);

SE = strel('disk',3);

BW = imdilate(BW,SE);

BW = imfill(BW,'holes');

imshow(BW), title 'Resultado del paisaje segmentado'

I = size(RGB);

alphaB=ones(I(1),I(2));

for(M=1:I(1))
    for(N=1:I(2))
        alphaB(M,N)=BW(M,N)*0.1;
    end
end

figure, imshow(alphaB), title 'Resultado de alphaB 0.1'