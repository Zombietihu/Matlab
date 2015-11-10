I = imread('nm.png');
figure,title('Mandarinas'),imshow(I);
gr=rgb2gray(I);
%figure,title('Mandarinas'),imshow(gr);
bw=im2bw(gr,0.5);  
bw2=bwperim(bw);
bw3=imfill(bw2,'holes');  		
bw2=bwperim(bw3);
bw3=imfill(bw2,'holes'); 
bw4=imopen(bw3,ones(5));
%figure,title('MandarinasBinarizada'),imshow(bw);
%figure,title('MandarinasPerimetro'),imshow(bw2);
%figure,title('MandarinasRellenadas'),imshow(bw3);
%figure,title('MandarinasOpen'),imshow(bw4);
%%
[L,num]=bwlabel(bw4);                                    		%Create labelled image
s=regionprops(L,'area','perimeter');                    		%Calculate region properties
for i=1:num                                             		%object’s area and perimeter     
x(i)=s(i).Area;
y(i)=s(i).Perimeter;
form(i)=4.*pi.*x(i)./(y(i).^2);                         		%Calculate form factor
end
%%
for i=1:num
    if y(i)<200;
        mandarinas(i)=y(i);
    else
        naranjas(i)=y(i);
    end
end
%%
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
%%
sort(radioM);
sort(radioN);
%%
%MostrarImagen Mandarinas
d= imdistline;
delete(d);
%MostrarImgen Naranjas
min=radioN(1);
max=radioN(end);
[centers2, radii2] = imfindcircles(~bw4,[44 47], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
Naranjas=length(centers2) 
h=viscircles(centers2,radii2,'EdgeColor' , 'b');

%%
%MostrarImagen Mandarinas
d= imdistline;
delete(d);
min=radioN(1);
max=radioN(end);
[centers2, radii2] = imfindcircles(~bw4,[29 30], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
Mandarinas=length(centers2) 
h=viscircles(centers2,radii2,'EdgeColor' , 'r');