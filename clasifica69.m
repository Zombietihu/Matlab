function d = clasifica69( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

figure(1)
clf


bw2=bwperim(~I);    %Detectar Perimetro

bw3=imfill(bw2,'holes');%Rellenar contenido de Perimetro

bw2=bwperim(bw3);    %Detectar Perimetro
bw3=imfill(bw2,'holes');  

bw4= imdilate(bw3,ones(3,3)); 
bw4= imdilate(bw4,ones(5,5)); 

[L,n] = bwlabel(bw4,4);
d = zeros(n,1);
for i=1:n
   R = L==i;
  figure(2)
 imshow(R);
title('9) nueve 6) seis');
d(i) = input('que numero es este?');
end

end

