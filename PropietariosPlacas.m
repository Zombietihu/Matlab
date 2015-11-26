clc;
clear all;
%k=input('Nombre de archivo:','s'); % Ingresa nombre
im=imread('placa55.jpg'); %leer nombre de la imagen

gray = rgb2gray(im);
figure, imshow(im);
level = graythresh(im);
bw = im2bw(im,level);
figure, imshow(bw);    
bwOpen = bwareaopen(~bw,450);
figure, imshow(bwOpen);    
res=ocr(~bwOpen);
%Reducir las imagenes final
%for i=1:
%end
var=res.Text;
display(var,'El serial de placa es: ')

