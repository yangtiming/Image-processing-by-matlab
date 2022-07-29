%%
close all
%%
%5.6 using MATLAB based on “flowers” gray image
f=imread('2.tif');
f=imresize(f,[1080,1080]);
fg=rgb2gray(f);
f=im2uint8(fg);
%%
%产生椒盐噪声
t_sp2=imnoise(f,'salt & pepper',0.05);
figure,imshow(t_sp2);

title('spnosiy');
%%
%average filtering
I_3=fspecial('average',[3,3]);%3*3均值滤波
I_3=imfilter(t_sp2,I_3);
figure,imshow(I_3);
title('average filtering')

%%
%median filtering
t_sp4=medfilt2(t_sp2);
figure,imshow(t_sp4);
title('median filtering')
%%
%outlier filtering
t_sp5=outlier(t_sp2,3);
figure,imshow(t_sp5);
title('outlier filtering')

%%
%pseudomedian filter
b = strel('square',3);
psmedIm = (0.5*imclose(t_sp2,b)) + (0.5*imopen(t_sp2,b));
figure,imshow(psmedIm);
title('pseudomedian filter')
%%



function res=outlier(im,d)
% OUTLIER(IMAGE,D) removes salt and pepper noise using an outlier method.
% This is done by using the following algorithm: %
% For each pixel in the image, if the difference between its grey value
% and the average of its eight neighbours is greater than D, it is
% classified as noisy, and its grey value is changed to that of the
% average of its neighbours. %
% IMAGE can be of type UINT8 or DOUBLE; the output is of type
% UINT8. The threshold value D must be chosen to be between 0 and 1.
f=[0.125 0.125 0.125; 0.125 0 0.125; 0.125 0.125 0.125]; imd=im2double(im);
imf=filter2(f,imd);
r=abs(imd-imf)-d>0;
res=im2uint8(r.*imf+(1-r).*imd);
end
