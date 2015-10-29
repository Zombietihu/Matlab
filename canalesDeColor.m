A=imread('cromo.jpg');
cmap = rgb2hsv(A);
cmap2= hsv2rgb(cmap);
H=cmap(:,:,1);
S=cmap(:,:,2);
V=cmap(:,:,3);

R=cmap2(:,:,1);
G=cmap2(:,:,2);
B=cmap2(:,:,3);

figure; title('Original'); imshow(A); pause;

figure; title('HSV'); imshow(cmap); pause;
figure; title('RGB'); imshow(cmap2); pause;

figure; title('H'); imshow(H); pause;
figure; title('R'); imshow(R); pause;

figure; title('S'); imshow(S); pause;
figure; title('G'); imshow(G); pause;

figure; title('V'); imshow(V); pause;
figure; title('B'); imshow(B); pause;