function [ Naranjas, Mandarinas, promedioN, promedioM ] = detectedFruit( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

gr=rgb2gray(I);     %Pasar a escala de grises
bw=im2bw(gr,0.5);   %Binarizar
bw2=bwperim(bw);    %Detectar Perimetro
bw3=imfill(bw2,'holes');  		%Rellenar contenido de Perimetro
bw4=imopen(bw3,ones(5));        %Aplicar apertura

[L,num]=bwlabel(bw4);                                    		%Create labelled image
s=regionprops(L,'area','perimeter');                    		%Calculate region properties
for i=1:num                                             		%object’s area and perimeter     
x(i)=s(i).Area;
y(i)=s(i).Perimeter;
form(i)=4.*pi.*x(i)./(y(i).^2);                         		%Calculate form factor
end

%%
%MostrarImgen Naranjas
d= imdistline;
delete(d);
[centers2, radii2] = imfindcircles(~bw4,[44 47], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
Naranjas=length(centers2) 
h=viscircles(centers2,radii2,'EdgeColor' , 'b');

%%
%MostrarImagen Mandarinas
d= imdistline;
delete(d);
[centers2, radii2] = imfindcircles(~bw4,[29 30], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
Mandarinas=length(centers2) 
h=viscircles(centers2,radii2,'EdgeColor' , 'r');

%%
for i=1:num
    if y(i)<200;
        mandarinas(i)=y(i);
    else
        naranjas(i)=y(i);
    end
end
m=1;
n=1;
for i=1:num
    if mandarinas(i)>0 ;
        radioM(m)=(mandarinas(i))/(2*pi);
        m=m+1;
    
    
    else if naranjas(i)>0;
       radioN(n)=(naranjas(i))/(2*pi);
       n=n+1;
        end
    end
end
promedioM = sum(radioM)/length(radioM);
promedioN = sum(radioN)/length(radioN);

end


