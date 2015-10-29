im = imread('cromo.jpg');
figure(1); 
subplot(2,4,1); 
imshow(im);title('1. Imagen RGB'); 

gris = rgb2gray(im);
subplot(2,4,2); 
imshow(gris);title('2.escala de grises'); 

imR3=imadjust(gris,[],[],1.6); 
subplot(2,4,3); 
imshow(imR3,[]);title('5. Corrección GAMMA factor 1.8');

IB = im2bw (imR3,0.5)
subplot(2,4,4); 
imshow(IB);title('3. B/N'); 

SE = strel('disk',8);
BW2 = imerode(IB,SE);
BW3 = imdilate(BW2,SE);
subplot(2,4,5),
imshow(BW3),title('Dilatacion');

BW4 = not(BW3);

b1=edge(BW4,'canny'); 
subplot(2,4,6)
imshow(b1),title('Canny'); 

BW = imfill(b1);
subplot(2,4,7)
imshow(b1),title('Canny'); 

