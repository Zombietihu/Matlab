im = imread('cromo.jpg');
gris = rgb2gray(im);
% separa en RGB
imR=double(im(:,:,1))+10; 
imG=double(im(:,:,2)); 
imB=double(im(:,:,3)); 
A3= histeq(uint8(imR));
figure;imshow(A3);
[f,c]=size(A3);
   for i=1:f
       for j=1:c
         if double(A3(i,j))<6;
             A3(i,j)=0;
         else
             A3(i,j)=255;
         end
       end
   end
figure;imshow(A3);   
SE = strel('disk',1);
BW2 = imdilate(A3,SE);
figure, imshow(BW2);
d= imdistline;
delete(d);

rgb = BW2;


[centers, radii] = imfindcircles(rgb,[12 30], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
cromosomas_azules=length(centers)% cuenta el numero de centros 
h=viscircles(centers,radii);%dibuja los circulos 

[centers2, radii2] = imfindcircles(rgb,[6 7], 'ObjectPolarity','dark', ...
          'Sensitivity',0.95,'Method','twostage');
con_micronucleo=length(radii2)% cuenta el numero de centros 
h2=viscircles(centers2,radii2,'EdgeColor' , 'b' );%dibuja los circulos 


