function [ im_gray,Im_pasaBaja ] = filtroPros( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    k=ones(3,3)/9;
    im_gray = rgb2gray(I);
    Im_pasaBaja=imfilter(im_gray,k);

end

