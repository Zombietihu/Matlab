I=imread('abichuela.jpg');
figure, imshow(I);
gray = rgb2gray(I);
bw=im2bw(gray,0.39);
figure, imshow(~bw);
%%
bw2=bwperim(~bw);    %Detectar Perimetro
f = bwareaopen(bw, 800);
bw4=imopen(bw,ones(8,8));
 
bw5=bwperim(~bw4);    %Detectar Perimetro
bw3=imfill(bw5,'holes');  		%Rellenar contenido de Perimetro


figure, imshow(~f);


