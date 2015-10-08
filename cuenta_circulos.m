A = imread('circulos.png');
Rmin = 5; %30
Rmax = 200; %65
B=[0 1 0;1 1 1;0 1 0];
%%
%Se tratan circulos obscuros
bw = im2bw(A,0.4);
subplot(2,2,1);imshow(bw); 
[centersDark, radiiDark] = imfindcircles(bw,[Rmin Rmax],'ObjectPolarity','dark');
viscircles(centersDark, radiiDark,'LineStyle','--');
IM2 = imdilate(bw,B);IM2=imdilate(IM2,B);
Im_label=bwlabel(~IM2,8);
n=max(max(Im_label));
display(n,'El numero de circulos obscuros es: ');
%%
%Se tratan circulos claros
bw2 = im2bw(A,0.8);
subplot(2,2,2);imshow(bw2); 
[centersBright, radiiBright] = imfindcircles(bw2,[Rmin Rmax],'ObjectPolarity','bright');
viscircles(centersBright, radiiBright,'EdgeColor','b');
IM = imdilate(bw2,B);
Im_label=bwlabel(IM,8);
n=max(max(Im_label));
display(n,'El numero de circulos blancos es: ');