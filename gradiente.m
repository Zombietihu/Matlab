I=imread('cromosomas.tif');
%im_gray = rgb2gray(I);
[Gx Gy] = imgradientxy(I);
[Gmag Gdir] = imgradient(Gx, Gy);
figure; imshowpair(Gmag, Gdir, 'montage'); axis off;
title('Magnitud y Direccion de gradiente usando soble');
figure; imshowpair(Gx, Gy, 'montage'); axis off;
title('Gradiete direcciones, Gx Gy usando sobel');