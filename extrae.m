function [ Im_dilate ] = extrae( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Im_Bin=im2bw(I,0.5);
SE=strel('square',10);
Im_dilate=imdilate(Im_Bin,SE);


end

