

Im_RGB=imread('Transistores.jpg'); 
imshow(Im_RGB)
Im_bin=im2bw(Im_RGB,0.5);
figure, imshow(Im_bin);
Im_bin2=not(Im_bin);
figure, imshow(Im_bin2)
SE=strel('square',10);
Im_erode=imerode(Im_bin2,SE);
figure, imshow(Im_erode);
Im_dilate=imdilate(Im_erode,SE);
figure,imshow(Im_dilate);
Im_label=bwlabel(Im_dilate,8);
n=max(max(Im_label));
display(n,'El total de transistores son:');
