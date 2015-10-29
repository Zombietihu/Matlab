I=imread('coloredChips.png');
J=rgb2gray(I);
%Filtro gradiente
[Gx Gy] = imgradientxy(J);
[Gmag Gdir] = imgradient(Gx, Gy);
figure; imshowpair(Gmag, Gdir, 'montage'); axis off;
title('Magnitud y Direccion de gradiente usando soble');
figure; imshowpair(Gx, Gy, 'montage'); axis off;
title('Gradiete direcciones, Gx Gy usando sobel');
%Filtro Sobel y cany

bw1 = edge(J, 'sobel');
bw2 = edge(J, 'canny');
figure, imshow(bw1);
figure, imshow(bw2);