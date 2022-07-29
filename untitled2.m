%题4.4验证卷积定理
x1=[7,6,5,4,-4,-5,-6,-7];
x2=[2,2,-5,-5,6,6,-7,-7];
yx1=fft(x1);
yx2=fft(x2);
xx=cconv(x1, x2, 8); 
fftxx=fftshift(fft(xx));
test=fftshift(yx1).* fftshift(yx2);





