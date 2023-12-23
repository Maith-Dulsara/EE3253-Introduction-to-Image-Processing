%(1)Clear the workspace
clc;
clear all;
%(2)Load the color Figure 3
figure3 = imread('Figure3.jpg'); 
%(3)Convert the image to grayscale
grayImage = rgb2gray(figure3);
%(4)Plot the histogram of the image
figure;
histogram(grayImage);
title('Histogram of Grayscale Image');
%(5)Find the global threshold of the image
threshold = graythresh(grayImage);
fprintf('Global threshold: %f\n', threshold);
%(6)Segment the image using the im2bw function
segmentedImage = im2bw(figure3, threshold);
%(7)Subplot the original image, grayscale image, and segmented image
figure;
subplot(1, 3, 1);
imshow(figure3);
title('Original Image');

subplot(1, 3, 2);
imshow(grayImage);
title('Grayscale Image');

subplot(1, 3, 3);
imshow(segmentedImage);
title('Segmented Image');
%(8)Save the segmented image as a JPEG image
imwrite(segmentedImage, 'Segmented_Image.jpg'); 
