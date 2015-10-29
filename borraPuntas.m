A=imread('letras2.jpg');
figure, imshow (A); %Muestra la figura origina{
BW = ~im2bw(A,0.5); %Binariza la imagen
figure, imshow(BW); %muestra la imagen binarizada
BW2= bwmorph(BW, 'remove');%remover pixeles que no corresponden al borde
figure, imshow(BW2); %muestra la imagen con los pixeles que no corresponden al borde ya eliminados
BW3 = bwmorph(BW,'skel', Inf);%encontrar el esqueleto
figure, imshow(BW3);
im=bwmorph(BW3,'endpoints',Inf);% detecta los puntos extremos de la imagen despues que que la misma paso por la funcion Detecta los puntos extremos de la imagen de un esqueleto después de la imagen binaria se ha pasado a través de la función "bwmorph".
a=bwmorph(BW3,'spur',10);
figure,imshow(a);
BW4 = bwmorph(BW3,'endpoints');%muestra los puntos finales del esqueleto
figure, imshow(BW4);