clear all
%4.9 using MATLAB based on “twins” gray image

cm=imread('2.tif');
%理想低通滤波器
[x,y]=meshgrid(-1645:1644,-824:823);
z=sqrt(x.^2+y.^2);
c=(z<20);
cf=fftshift(fft2(cm));
%figure,fftshow(cf,'log')
cfl=cf.*c;
%figure,fftshow(cfl,'log')
cfhi=ifft2(cfl);

%figure,fftshow(cfhi,'abs')
 
%理想高通滤波器
[x,y]=meshgrid(-1645:1644,-824:823);
z=sqrt(x.^2+y.^2);
c=(z>20);
cf=fftshift(fft2(cm));
%figure,fftshow(cf,'log')
cfh=cf.*c;
%figure,fftshow(cfh,'log')
cfhi=ifft2(cfh);

%figure,fftshow(cfhi,'abs')
 
%巴特沃滋低通滤波器

cf=fftshift(fft2(cm));
%figure,fftshow(cf,'log')
bl=lbutter(cm,15,1);
cfbl=cf.*bl;
%figure,fftshow(cfbl,'log')
cfli=ifft2(cfbl);

%figure,fftshow(cfli,'abs')

%巴特沃滋高通滤波器

cf=fftshift(fft2(cm));
%figure,fftshow(cf,'log')
bh=hbutter(cm,15,1);
cfbh=cf.*bh;
%figure,fftshow(cfbh,'log')
cfhi=ifft2(cfbh);

%figure,fftshow(cfhi,'abs')

%高斯滤波器
cm=imresize(cm,[256,256]);
cf=fftshift(fft2(cm));
g1=mat2gray(fspecial('gaussian',256,10));
    cg1=cf.*g1;
    fftshow(cg1,'log')
    cg11=ifft2(cg1);
    fftshow(cg11,'log')
    
    
function fftshow(f,type)
% Usage: FFTSHOW(F,TYPE) %
% Displays the fft matrix F using imshow, where TYPE must be one of
% ’abs’ or ’log’. If TYPE=’abs’, then then abs(f) is displayed; if
% TYPE=’log’ then log(1+abs(f)) is displayed. If TYPE is omitted, then
% ’log’ is chosen as a default. %
% Example:
%    c=imread(’cameraman.tif’);
%    cf=fftshift(fft2(c));
%    fftshow(cf,’abs’)
%
if nargin<2,
  type='log';
end
if (type=='log')
  fl = log(1+abs(f));
  fm = max(fl(:));
  imshow(im2uint8(fl/fm))
elseif (type=='abs') fa=abs(f); fm=max(fa(:)); imshow(fa/fm)
else
error('TYPE must be abs or log.');
end
end

 
function out=lbutter(im,d,n)
% LBUTTER(IM,D,N) creates a low-pass Butterworth filter
% of the same size as image IM, with cutoff D, and order N %
% Use:
%   x=imread(’cameraman.tif’);
% l=lbutter(x,25,2);
%
height=size(im,1);
width=size(im,2); [x,y]=meshgrid(-floor(width/2):floor((width-1)/2),-floor(height/2): ...
floor((height-1)/2)); out=1./(1+(sqrt(2)-1)*((x.^2+y.^2)/d^2).^n);
end
 
function out=hbutter(im,d,n)
% HBUTTER(IM,D,N) creates a high-pass Butterworth filter
% of the same size as image IM, with cutoff D, and order N %
% Use:
%   x=imread(’cameraman.tif’);
%   l=hbutter(x,25,2);
%
out=1-lbutter(im,d,n);
end
