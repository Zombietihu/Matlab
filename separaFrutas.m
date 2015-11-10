imagen=imread('nm.png');
subplot(2,2,1)
imshow(imagen)
title('Imagen Original')
%Binarización imagen
level=graythresh(imagen);
bn=im2bw(imagen,level);
subplot(2,2,2)
imshow(bn)
title('Imagen Binarizada')
%preprocesamiento
bn=edge(bn,'sobel','vertical');
subplot(2,2,3)
imshow(bn)
title('Imagen filtrada: detec. de bordes')
