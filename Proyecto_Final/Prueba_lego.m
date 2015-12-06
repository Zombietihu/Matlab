I=imread('image_019.jpg');
figure,imshow(I);
gray=rgb2gray(I);

figure,imshow(gray);

max(max(gray))
im1=imadjust(gray);
figure, imshow(im1);

bw=im2bw(im1,0.25);  
figure, imshow(bw);
bw4=imopen(bw,ones(7,7));
figure, imshow(bw4);
f = bwareaopen(bw, 50);
figure, imshow(f);
bw5=bwperim(~bw4);    %Detectar Perimetro
bw3=imfill(bw5,'holes');
figure, imshow(bw3);