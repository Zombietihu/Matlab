I=imread('cromosomas.tif');
figure, imshow(I);

bw1 = edge(I, 'sobel');
bw2 = edge(I, 'canny');
figure, imshow(bw1);
figure, imshow(bw2);
%CANNY:
%1.- Filtro gaussiano
%2.- Robustes de borde utilizando sobel en direccion X y Y
%3.- Calcula direccion de borde (0,45,90,135 grados)
%4.- Suprecion de no maximos 
%5.- Hysteresis: Umbral dejando pixeles borde