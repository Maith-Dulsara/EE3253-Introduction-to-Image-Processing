%clear the work space
clc
clear all

%Loading the image
I = imread('Figure1.jpg');

%Convert the image into grayscale
gs = rgb2gray(I);

%Obtaining the equalized image
A = histeq(gs);

%Output
subplot(1,4,1);
imshow(I);
title("Original Image");

subplot(1,4,2);
imhist(I);
title("Histogram of the Equalized Image")

subplot(1,4,3);
imshow(A);
title("Equalized Image");

subplot(1,4,4);
imhist(A);
title("Histogram of the Equalized Image")

imwrite(A, 'Equalized_Image.jpg');

