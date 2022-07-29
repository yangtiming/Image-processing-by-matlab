close all
c=imread('cameraman.tif');
     c1=imnoise(c,'salt & pepper',0.1);
     c2=imnoise(c,'gaussian',0,0.02);
     figure,imshow(c1)
     title("orgin")
     %roberts
     edge_r=edge(c1,'roberts');
     figure,imshow(edge_r)
     title("robertsc1")
     edge1_r=edge(c2,'roberts');
     figure,imshow(edge1_r)
     title("robertsc2")
     %prewitt
     %%%
    %px=[-1 0 1;-1 0 1;-1 0 1];
    %icx=filter2(px,c1);
    %figure,imshow(icx/255)
   % py=px';
    %icy=filter2(py,c1);
    %figure,imshow(icy/255)
    %edge_p=sqrt(icx.^2+icy.^2);
    %figure,imshow(edge_p/255)
    %edge_t=im2bw(edge_p/255,0.3);
    %title("prewittc1,")
     %%%%
     
     edge_r=edge(c1,'prewitt');
     figure,imshow(edge_r)
     title("prewittc1")
     edge1_r=edge(c2,'prewitt');
     figure,imshow(edge1_r)
     title("prewittc2")
     %  sobel
     edge_s=edge(c1,'sobel');
     figure,imshow(edge_s)
     title("sobelc1")
     edge_s=edge(c2,'sobel');
     figure,imshow(edge_s)
     title("sobelc2")
     %Marr-Hildreth method
     log=fspecial('log',30,2);
     edge_M=edge(c1, 'zerocross', log);
     figure,imshow(edge_M)
     title("MarrMc1")
     log=fspecial('log',30,2);
     
     edge_M=edge(c2, 'zerocross', log);
     figure,imshow(edge_M)
     title("MarrMc2")
     %canny
     edge_c=edge(c1,'canny');
     figure,imshow(edge_c)
     title("cannyc1")
     
     edge_c=edge(c2,'canny');
     figure,imshow(edge_c)
     title("cannyc2")