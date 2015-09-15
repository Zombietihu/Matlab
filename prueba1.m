clear all;
close all;
LN=imread('prueba1.jpg');
LN1=rgb2gray(LN);
subplot(2,1,1),subimage(LN1),title('imagen_original');
subplot(2,1,2),imhist(LN1),title('Histograma');