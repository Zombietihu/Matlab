IM= imread('cromosomas.tif');
A=im2bw(IM,0.5); 
subplot(2,2,1);imshow(~A); 
%Elemento Estructurante
B=[0 1 0;1 1 1;0 1 0];
%Dilatación 2 veces
IM2=imdilate(~A,B);IM2=imdilate(IM2,B);
subplot(2,2,2);imshow(IM2); 
%Cuenta las regiones 
Im_label=bwlabel(IM2,8);
n=max(max(Im_label));
display(n,'El numero de cromosomas es: ');
%Da bordes a las regiones
boundary=bwperim(~IM2);
[i,j]=find(boundary);                 
subplot(2,2,3), imshow(IM),title('Cromosomas ubicados'); 
hold on; 
plot(j,i,'r.');
