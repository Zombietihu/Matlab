Im_RGB=imread('Letras.jpg'); 
subplot(2,3,1), imshow(Im_RGB),title('Original')  
J=rgb2gray(Im_RGB);
subplot(2,3,2), imshow(J),title('Escala de Grises');
Im_bin=im2bw(J,0.5);
subplot(2,3,3), imshow(Im_bin),title('Binarizada');
SE=strel('square',4);
Im_erode=imerode(Im_bin,SE);
subplot(2,3,4), imshow(Im_erode),title('Erosión');         
boundary=bwperim(Im_erode);
[i,j]=find(boundary);                
subplot(2,3,5), imshow(Im_RGB),title('Letras ubicadas'); 
hold on; 
plot(j,i,'r.');
Im_label=bwlabel(Im_erode,8);
n=max(max(Im_label));
display(n,'El numero de letras que hay es: ');