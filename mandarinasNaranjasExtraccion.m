function features = mandarinasNaranjasExtraccion( I)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

gr=rgb2gray(I); 
bw=im2bw(gr,0.5);   %Binarizar
bw2=bwperim(bw);    %Detectar Perimetro
bw3=imfill(bw2,'holes');  		%Rellenar contenido de Perimetro
bw4=imopen(bw3,ones(5)); 
[L,num]=bwlabel(bw4); 
features = zeros(num,7);
disp('Extrayendo Momentos de Hu...');
for i=1:num
    R = L==i;
    figure(2)
    imshow(R);
    pause(0);
    HM = HuMom(R);
    features(i,:) = HM;
end
imshow(bw4)

