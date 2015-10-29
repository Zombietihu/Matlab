A=imread('circles.png');                			%Read in binary image
bw=bwperim(A);                          			%Calculate perimeter
se=strel('disk',5); bw1=A-imerode(A,se);            %se allows thick perimeter extraction
bw2=imerode(A,se);
subplot(1,4,1), imshow(A),title('Original');
subplot(1,4,2), imshow(bw),title('Bordes');
subplot(1,4,3), imshow(bw1),title('Restada');                         %Display results
subplot(1,4,4), imshow(bw2),title('Erocionada');
