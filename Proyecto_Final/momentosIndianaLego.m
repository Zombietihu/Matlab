function [features, S, gray, im1, IM2, B] = momentosIndianaLego( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%figure(1)
%subplot(2,3,1), imshow(I),title('Original')  
gray=rgb2gray(I);
%subplot(2,3,2), imshow(gray),title('Escala de Grises');
max(max(gray))
im1=imadjust(gray);
%subplot(2,3,3), imshow(im1),title('Imagen Ajustada');
im1=medfilt2(im1,[3 3]);
sf=fspecial('log');
sc=sf;
b1=imfilter(im1,sf);
b2=imfilter(im1,sc);
b3=imadd(b1,b2);
b3=im2bw(b3, .09);
C = imclearborder (b3, 4);
sf=fspecial('gaussian');
C1=imfilter(C,sf);
C1=imfilter(C1,sf);
B=[0 1 0;
   1 1 1;
   0 1 0]; 
IM2=imdilate(C1,B); 
%subplot(2,3,4), imshow(IM2),title('Dilatacion'); 


C=[0 1 0;
   0 1 0;
   0 1 0];
IM2=imclose(IM2,C); 
B=bwmorph(IM2,'hbreak');
B=bwareaopen(B, 100);
%subplot(2,3,5), imshow(B),title('Procesada'); 
[L,num] = bwlabel(B,4);

%%    

disp('Extrayendo Momentos de Hu...');
for i=1:num
    R = L==i;
    a  = regionprops(R, 'Area');
    if a.Area>5000
  
       % imshow(R);
        pause(0);
        HM = HuMom(R);
        features = HM;
        S=R;
    end
end

