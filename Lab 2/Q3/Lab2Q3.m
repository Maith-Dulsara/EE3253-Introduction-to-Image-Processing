% Clear the workspace
clear all;
close all;

% Load the color image
image = imread('Figure2.jpg');

% Convert the image to grayscale
gray_image = rgb2gray(image);

% Normalize the histogram using in-built function with automatic intensity range
intensity_range = stretchlim(gray_image);
normalized_image = imadjust(gray_image, intensity_range, [0, 1]);

% Plotting the results
figure;
subplot(2, 2, 1);
imshow(gray_image);
title('Original Grayscale Image');

subplot(2, 2, 2);
imhist(gray_image);
title('Histogram of Original Image');

subplot(2, 2, 3);
imshow(normalized_image);
title('Normalized Image (MATLAB Built-in Function)');

subplot(2, 2, 4);
imhist(normalized_image);
title('Histogram of Normalized Image (MATLAB Built-in Function)');


