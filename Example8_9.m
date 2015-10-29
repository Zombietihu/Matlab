A=imread('text.png');                        				%Read in text 
B=imcrop(A);
se1=B; se2=~B;
bw=bwhitmiss(A,se1,se2);%se buscan horizontales
%%
se1=imrotate(B,90); se2=~(imrotate(B,90)); %se rota la imagen 90°
bw2=bwhitmiss(A,se1,se2); %se buscan verticales
[i,j]=find( bw==1 | bw2==1 ); %busca horizontales o verticales
%%
subplot(1,3,1), imshow(A);
subplot(1,3,2), imagesc(B); axis image;
axis off;
subplot(1,3,3), imshow(A); hold on;
plot(j,i,'r*');
