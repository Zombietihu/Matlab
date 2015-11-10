clear
im=imread('cromo.jpg');
%%
%Para Rojos
im2=rgb2hsv(im);
%Obtener Hsv
H=double(im2(:,:,1));
S=double(im2(:,:,2));
V=double(im2(:,:,3));
%EcualizarHistograma
A3= histeq(S);
%Binarizar
bw=im2bw(A3,0.3);
%figure;imshow(bw);
%Dilatare con estructura de elemento
SE = strel('disk',1);
BW2 = imdilate(bw,SE);BW2 = imdilate(BW2,SE);BW2=imdilate(BW2,SE);imdilate(BW2,SE);
%figure, imshow(BW2);
%Obtener perimetro
BW4=bwperim(~BW2);
figure;imshow(BW4);
%Rellenar
BW5 = imfill(BW4,'holes');BW5 = imfill(BW5,'holes');BW5 = imfill(BW5,'holes');
BW5=bwperim(BW5);BW5 = imfill(BW5,'holes');
%figure, imshow(BW5);
%figure, imshow(~BW5);
rgb=~BW5;
%%
%Para azules
gris = rgb2gray(im);
% separa en RGB
imR=double(im(:,:,1))+10; 
imG=double(im(:,:,2)); 
imB=double(im(:,:,3)); 
A2= histeq(uint8(imR));
%figure;imshow(A2);
[f,c]=size(A2);
   for i=1:f
       for j=1:c
         if double(A2(i,j))<6;
             A2(i,j)=0;
         else
             A2(i,j)=255;
         end
       end
   end
%figure;imshow(A2);   
SE = strel('disk',1);
BW1 = imdilate(A2,SE);
%figure, imshow(BW1);
figure;imshow(im);
d= imdistline;
delete(d);

rgb2 = BW1;



%%
%MostrarImagen
[centers, radii] = imfindcircles(rgb,[18 22], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
cromosomas_rojos=length(centers)% cuenta el numero de centros 
h=viscircles(centers,radii);%dibuja los circulos 


[centers2, radii2] = imfindcircles(rgb2,[12 30], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
cromosomas_azules=length(centers2) 
h=viscircles(centers2,radii2,'EdgeColor' , 'b');

[centers3, radii3] = imfindcircles(rgb2,[6 7], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
con_micronucleo=length(radii3) 
h2=viscircles(centers3,radii3,'EdgeColor' , 'b' ); 
