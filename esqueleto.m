
A=imread('letras2.jpg');
figure, imshow (A);
BW = ~im2bw(A,0.5);
figure, imshow(BW);
BW2= bwmorph(BW, 'remove');
figure, imshow(BW2);
BW3 = bwmorph(BW,'skel', Inf);
figure, imshow(BW3)
BW4 = bwmorph(BW3,'endpoints');
figure, imshow(BW4)