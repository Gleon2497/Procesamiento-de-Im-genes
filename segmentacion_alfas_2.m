clear
clc
close all

RGB = imread("Imagenes.png")

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
        if(BW(M,N)==0)
            alphaB(M,N)=BW(M,N)*0.1;
        end
        if(BW(M,N)==1)
            alphaB(M,N)=BW(M,N)*0.9;
        end
    end
end

figure, imshow(alphaB), title 'Resultado de alphaA'