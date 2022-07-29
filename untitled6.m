% using MATLAB based on “circle” image

t=imread('circles.tif');
c3=imresize(t,[256,256]);

figure,imshow(c3)
p1=c3(:,1:64);
p2=c3(:,65:128);
p3=c3(:,129:192);
p4=c3(:,193:256);
g1=im2bw(p1,graythresh(p1));
g2=im2bw(p2,graythresh(p2));
g3=im2bw(p3,graythresh(p3));
g4=im2bw(p4,graythresh(p4));
figure,imshow([g1 g2 g3 g4])
