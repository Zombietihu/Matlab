Im_RGB=imread('HERRAMIENTAS.jpg'); 
J = rgb2gray(Im_RGB);

%imshow(Im_RGB)
%Filtros
k = ones(3,3)/9; 
Im_f = imfilter(J,k);
g =[1 2 1; 2 4 2; 1 2 1 ]/ 16; %Pasabajas
Im_g = imfilter(J,g);
g2 = fspecial('gaussian', [5 5],2);        %Filtro gausiiano con desv. est = 2, empleando funciones propias de matlab
Im_g2 = imfilter (J, g2);
%------------------------------------------------------------
Im_bin=im2bw(Im_g,0.6); %Binarizar imagen
figure, imshow(Im_bin); %siguiente figura, para que no se sobre escriba
Im_bin2=not(Im_bin); %Se invierte la imagen
figure, imshow(Im_bin2) %Se muestra la imagen inversa en otra figura
SE=strel('square',15); %strel: estructura de elemento, corresponde a un cuadro de 10x10 de puros 1's
SE2=strel('square',20);
Im_erode=imerode(Im_bin2,SE); %Se hace la erosion sobre la imagen inversa
figure, imshow(Im_erode);
Im_dilate=imdilate(Im_erode,SE2); %Se hace la dilatacion con la misma estructura de elemento
%figure,imshow(Im_dilate); 
Iu= not(Im_dilate);
%figure, imshow(Iu);
Im_label=bwlabel(Iu,8);
n=max(max(Im_label));% Se obtiene el numero de etiquetas
display(n,'El numero de letras que hay es: ');