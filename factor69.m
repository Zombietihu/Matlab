I=imread('test96.bmp');

figure, imshow(I);

bw2=bwperim(~I);    %Detectar Perimetro

bw3=imfill(bw2,'holes');%Rellenar contenido de Perimetro

bw2=bwperim(bw3);    %Detectar Perimetro
bw3=imfill(bw2,'holes');  

bw4= imdilate(bw3,ones(3,3)); 
bw4= imdilate(bw4,ones(5,5)); 



[L,n] = bwlabel(bw4,4);

s=regionprops(L,'FilledImage');                    		%Calculate region properties
for i=1:n                                            		%object’s area and perimeter     
 o(i)=s(i).Orientation;%Calculate form factor
end

for i=1:80
 if 0>o(i)
      title('seis')
      s = 'r';
 else
      title('nueve')
        s = 'g';
 end
    
    plot(x,y,s)
    pause(0)
end
