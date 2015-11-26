function features = mandarinasNaranjasExtraccion( I)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


bw2=bwperim(~I);    %Detectar Perimetro

bw3=imfill(bw2,'holes');%Rellenar contenido de Perimetro

bw2=bwperim(bw3);    %Detectar Perimetro
bw3=imfill(bw2,'holes');  

bw4= imdilate(bw3,ones(3,3)); 
bw4= imdilate(bw4,ones(5,5)); 

[L,n] = bwlabel(bw4,4);
features = zeros(n,7);
disp('Extrayendo Momentos de Hu...');
for i=1:n
    R = L==i;
    figure(2)
    imshow(R);
    pause(0);
    HM = HuMom(R);
    features(i,:) = HM;
end
imshow(bw4)