
A = imread('circulos.png');
%A = imread('Imagen1.jpg');
imshow(A)
Rmin = 5; %30
Rmax = 200; %65
[centersBright, radiiBright] = imfindcircles(A,[Rmin Rmax],'ObjectPolarity','bright');
[centersDark, radiiDark] = imfindcircles(A,[Rmin Rmax],'ObjectPolarity','dark');
viscircles(centersBright, radiiBright,'EdgeColor','b');
viscircles(centersDark, radiiDark,'LineStyle','--');