clc; clear all; 
I = imread('Lena.bmp'); 
  
grayscale= rgb2gray(I); 
  
B=strel('cube',15); 
I1=imopen(grayscale,B); 
  
I2=grayscale-I1; 
  
I3=imadjust(I2); 
Threshold = graythresh(I3);
bw=imbinarize(I3,Threshold); 
    
I5=imgaussfilt(I2,0.05); 
I6=imgaussfilt(I2,1); 
I7=imgaussfilt(I2,10); 

subplot(1,3,1) ;imshow(I5); title ("Kernal = 0.5") 
subplot(1,3,2) ;imshow(I6); title ("Kernal = 1") 
subplot(1,3,3) ;imshow(I7); title ("Kernal = 3") 
  





