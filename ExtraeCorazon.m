function d = ExtraeCorazon( I)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gray = rgb2gray(I);
bw=im2bw(gray,0.45);
%figure, imshow(~bw);
bw4=imopen(bw,ones(8,8));
 
bw5=bwperim(~bw4);    %Detectar Perimetro
bw3=imfill(bw5,'holes');  		%Rellenar contenido de Perimetro

[L,num]=bwlabel(~bw); 
d = zeros(num,1);
for i=1:num
    R = L==i;
    figure(2)
    imshow(R);
    title('1)Corazon 2)Q 3)null');
    d(i) = input('¿?');
end

