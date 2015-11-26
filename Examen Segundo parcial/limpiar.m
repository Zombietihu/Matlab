%leemos imagen
frijol=imread('habichuelas.jpg');
imshow(frijol);
pause
%binarizamos
bn=im2bw(frijol);
imshow(bn);
pause

%%Eliminar areas menores a 100 pixeles
bn=bwareaopen(bn,800);
imshow(bn);
pause

%% sacar total de frijoles
BW2 = edge(bn,'canny');
Im_bin=not(BW2);
imshow(BW2);
Im_label=bwlabel(Im_bin,4);
n=max(max(Im_label));







%%Etiquetar elementos conectados
[L Ne]=bwlabel(bn);
propied = regionprops(L);
hold on

%%Graficar cajas de frontera
for n=1:size(propied,1)
	rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2);
end
tqm=find([propied.Area]<1400);

%Marcamos las areas mayores a 1400

%Todas las Q son menores de 1400

for n=1:size(tqm,2)
	rectangle('Position',propied(tqm(n)).BoundingBox,'EdgeColor','r','LineWidth',2)
end
pause









