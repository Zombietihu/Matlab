function d = mandarinasNaranjasSupervicion( I );
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
figure(1)
clf
imshow(I)
gr=rgb2gray(I); 
bw=im2bw(gr,0.5);   %Binarizar
bw2=bwperim(bw);    %Detectar Perimetro
bw3=imfill(bw2,'holes');  		%Rellenar contenido de Perimetro
bw4=imopen(bw3,ones(5)); 
[L,num]=bwlabel(bw4); 
d = zeros(num,1);
for i=1:num
    R = L==i;
    figure(2)
    imshow(R);
    title('1)Naranja 2)Mandarina');
    d(i) = input('que fruta es esta?');
end


