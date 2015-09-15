letras_RGB=imread('Letras.jpg'); 
imshow(letras_RGB)
letras_bin=im2bw(letras_RGB,0.5);
figure, imshow(letras_bin);
letras_bin2=not(letras_bin);
figure, imshow(letras_bin2)
