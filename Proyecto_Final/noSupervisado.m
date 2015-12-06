function d = noSupervisado( I )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
gray=rgb2gray(I);

max(max(gray))
im1=imadjust(gray);
bw=im2bw(im1,0.25);  
bw4=imopen(bw,ones(5,5));
bw5=bwperim(~bw4);    %Detectar Perimetro
bw3=imfill(bw5,'holes');
[L,num]=bwlabel(bw3); 
d = zeros(num,1);
for i=1:num
    R = L==i;
    figure(2)
    imshow(R);
    title('Sombrero');
    d(i) = input('¿?');
end

end

