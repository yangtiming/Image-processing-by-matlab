close all
[x,y]=meshgrid(1:256,1:256);
s1=1+sin(x/3+y/5);
s2=1+sin(x/5+y/1.5);
s3=1+sin(x/6+y/6);
tt=imread('2.tif');
t=rgb2gray(tt);
t=imresize(t,[256,256]);
tp=(double(t)/128+s1)/4;
figure,imshow(tp);

%Band reject filtering
z=sqrt((x-129).^2+(y-129).^2);
br=(z < 14 | z > 18);
tf=fftshift(fft2(tp));
tbr=tf.*br;
%figure,fftshow(tbr,'log')
tb=ifft2(tbr)
%figure,fftshow(tb,'abs')

%Notch filtering
btt=(z < 255 | z >255);
btt(136,:)=0;btt(137,:)=0;
btt(120,:)=0;btt(121,:)=0;
btt(:,143)=0;btt(:,142)=0;
btt(:,115)=0;btt(:,114)=0;
tf=fftshift(fft2(tp));
tbr=tf.*btt;
figure,fftshow(tbr,'log')
tb1=ifft2(tbr)
figure,fftshow(tb1,'abs')







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

 
 