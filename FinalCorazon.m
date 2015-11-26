function features  = FinalCorazon( I )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

gray = rgb2gray(I);
bw=im2bw(gray,0.45);
%figure, imshow(~bw);
bw4=imopen(bw,ones(8,8));

f = bwareaopen(bw, 800);

[L,num]=bwlabel(~f); 


features = zeros(num,7);
disp('Extrayendo Momentos de Hu...');
for i=1:num
    R = L==i;
    figure(2)
    imshow(R);
    pause(0);
    HM = HuMom(R);
    features(i,:) = HM;
end
imshow(bw)

