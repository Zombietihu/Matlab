function [ im_gray,Im_pasaBaja,Im_pasaAlta,Im_gauss, Im_mediana, Im_media, Im_min, Im_max ] = filtroPros( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    k=ones(3,3)/9;
    j=[-1 -1 -1;-1 8 -1 ; -1 -1 -1];
    im_gray = rgb2gray(I);
    %Pasa Baja
    Im_pasaBaja=imfilter(im_gray,k);
    %Pasa Alta
    Im_pasaAlta=imfilter(im_gray,j);
    %Gaussian
    %fn = imnoise(im_gray,'gaussian');
    h1=fspecial('gaussian');
    Im_gauss=imfilter(im_gray,h1); 
    %Mediana
    Im_mediana=medfilt2(im_gray);
    %Media
    h2=fspecial('average'); 
    Im_media = imfilter(im_gray,h2);
    %Minimo
    Im_min = nlfilter(im_gray,[3 3], @minimo);
    %maximo
    Im_max = nlfilter(im_gray,[5 5], @maximo);
    
    

end

