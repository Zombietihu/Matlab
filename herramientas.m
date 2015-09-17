length=10; tlevel=0.55;        %Define SE and percent threshold level
A=imread('HERRAMIENTAS.jpg'); 
subplot(2,3,1), imshow(A),title('Original')  %Read image and display
B=im2bw(A,tlevel); 
subplot(2,3,2), imshow(~B),title('Binarizado Negado');%Threshold image and display
SE=ones(2,length); 
bw1=imerode(~B,SE);    %Erode vertical lines
subplot(2,3,3), imshow(bw1),title('1a Erosión');%display result
bw2=imerode(bw1,SE); 
subplot(2,3,4), imshow(bw2),title('2a Erosión');          %Erode horizontal lines
bw3=imdilate(bw2,SE);
bw4=imdilate(bw3,SE);                 %Dilate back
subplot(2,3,5), imshow(~bw4),title('Dilatada');          %Display
boundary=bwperim(bw4);
[i,j]=find(boundary);                 %Superimpose boundaries
subplot(2,3,6), imshow(A),title('Herramientas ubicadas'); 
hold on; 
plot(j,i,'r.');
Im_label=bwlabel(~bw4,8);
n=max(max(Im_label));
display(n,'El numero de herramientas es: ');