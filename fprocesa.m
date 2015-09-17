function [ im_binariza, im_gray] = fprocesa(I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  im_gray = rgb2gray(I);
  im_binariza = im2bw(I);


end

