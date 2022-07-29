
a=[0 1 0 ; 1 1 1 ;  0 1 0];
b=[ 1 1 1 ; 1 1 1 ; 1 1 1 ];
c=[1 0 0 ; 0 0 0;  0 0 1 ];


A=[0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0; 
   0 0 0 1 1 1 1 0   0 1 1 1 1 1 1 0   0 0 0 0 0 1 1 0; 
   0 0 0 1 1 1 1 0   0 1 1 1 1 1 1 0   0 1 1 1 0 1 1 0; 
   0 1 1 1 1 1 1 0   0 1 1 0 0 1 1 0   0 1 1 1 0 1 1 0; 
   0 1 1 1 1 1 1 0   0 1 1 0 0 1 1 0   0 1 1 1 0 1 1 0; 
   0 1 1 1 1 0 0 0   0 1 1 1 1 1 1 0   0 1 1 1 0 0 0 0;  
   0 1 1 1 1 0 0 0   0 1 1 1 1 1 1 0   0 1 1 1 0 0 0 0;  
   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0; 
   ];
A1=A(:,1:8)
A2=A(:,9:16)
A3=A(:,17:24)
%开运算
open11=imopen(imclose(A1,a),a);
open12=imopen(imclose(A1,b),b);
open13=imopen(imclose(A1,c),c);
open21=imopen(imclose(A2,a),a);
open22=imopen(imclose(A2,b),b);
open23=imopen(imclose(A2,c),c);
open31=imopen(imclose(A3,a),a);
open32=imopen(imclose(A3,b),b);
open33=imopen(imclose(A3,c),c);
%闭运算
close11=imclose(imopen(A1,a),a);
close12=imclose(imopen(A1,b),b);
close13=imclose(imopen(A1,c),c);
close21=imclose(imopen(A2,a),a);
close22=imclose(imopen(A2,b),b);
close23=imclose(imopen(A2,c),c);
close31=imclose(imopen(A3,a),a);
close32=imclose(imopen(A3,b),b);
close33=imclose(imopen(A3,c),c);


