length=10; tlevel=0.45;        
A=imread('cromosomas.tif'); 
subplot(2,3,1), imshow(A),title('Original')  
%Elemento Estructurante
B1=[0 1 0;1 1 1;0 1 0]; 
B=im2bw(A,tlevel); 

subplot(2,3,2), imshow(~B),title('Binarizado Negado');
SE=strel('square',1); 
bw1=imdilate(~B,SE);   
subplot(2,3,3), imshow(bw1),title('1a Dilatacion');
%bw2=imerode(bw1,SE); 
%subplot(2,3,4), imshow(bw2),title('1a Erosión');         
%bw3=imdilate(bw2,SE);
%bw4=imdilate(bw3,SE);                
%subplot(2,3,5), imshow(~bw4),title('Dilatada');        
boundary=bwperim(bw1);
[i,j]=find(boundary);                 
subplot(2,3,6), imshow(A),title('Cromosomas ubicados'); 
hold on; 
plot(j,i,'r.');
Im_label=bwlabel(~bw1,8);
n=max(max(Im_label));
display(n,'El numero de cromosomas es: ');