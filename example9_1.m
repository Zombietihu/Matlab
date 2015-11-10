A=imread('coins_and_keys.png'); subplot(1,2,1), imshow(A);       %Read in image and display
bw=~im2bw(rgb2gray(A),0.35);  bw=imfill(bw,'holes');    		%Threshold and fill in holes
bw=imopen(bw,ones(5)); subplot(1,2,2), imshow(bw,[0 1]);		%Morphological opening 
[L,num]=bwlabel(bw);                                    		%Create labelled image
s=regionprops(L,'area','perimeter','Solidity');                    		%Calculate region properties
for i=1:num                                             		%object’s area and perimeter     
x(i)=s(i).Area;
y(i)=s(i).Perimeter;
z(i)=s(i).Solidity;
form(i)=4.*pi.*x(i)./(y(i).^2);                         		%Calculate form factor
end
figure; plot(x./max(x),form,'ro');                      		%Plot area against form factor

