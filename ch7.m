I=imread('abichuela.jpg');
figure, imshow(I);
im2=rgb2hsv(I);
%Obtener Hsv
H=double(I(:,:,1));
S=double(I(:,:,2));
V=double(I(:,:,3));

figure, imshow(H);
figure, imshow(S);
figure, imshow(V);

A3= histeq(S);
%Binarizar
bw=im2bw(A3,0.3);

figure, imshow(bw);