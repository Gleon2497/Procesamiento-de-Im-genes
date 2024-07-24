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

%---------------------------------

RGB1 = imread("Imagenes.png")

BW2 = im2bw(RGB1,0.5);

BW2 = not(BW2);

SE1 = strel('disk',3);

BW2 = imdilate(BW2,SE1);

BW2 = imfill(BW2,'holes');

imshow(BW2), title 'Resultado del paisaje segmentado'

J = size(RGB1);

alphaA=ones(J(1),J(2));

for(M=1:J(1))
    for(N=1:J(2))
        if(BW2(M,N)==0)
            alphaA(M,N)=BW2(M,N)*0.1;
        end
        if(BW2(M,N)==1)
            alphaA(M,N)=BW2(M,N)*0.9;
        end
    end
end

figure, imshow(alphaA), title 'Resultado de alphaA'

%-------------------------------

P = zeros(I(1),I(2));

Q = zeros(J(1),J(2));

for(M=1:J(1))
    for(N=1:J(2))
        P(M,N)=1-alphaB(M,N);
        Q(M,N)=1-alphaA(M,N);
    end
end

RGB2=imread("Imagenes.png");

for(M=1:J(1))
    for(N=1:J(2))
        R=RGB1(M,N,1).*P(N,M)+RGB(N,M,1).*Q(N,M);
        G=RGB1(M,N,2).*P(N,M)+RGB(N,M,2).*Q(N,M);
        B=RGB1(M,N,3).*P(N,M)+RGB(N,M,3).*Q(N,M);

        RGB2(M,N,1)=R;
        RGB2(M,N,2)=G;
        RGB2(M,N,3)=B;
    end
end

figure, imshow(RGB2), title 'Resultado Final:'



