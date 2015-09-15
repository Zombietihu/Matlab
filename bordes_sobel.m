Im_RGB=imread('prueba1.jpg');
Im_gray=rgb2gray(Im_RGB);
Im_edge=edge(Im_gray,'sobel');
imshow(Im_edge);