clc;
clear all;

% Load the color Figure 3
figure3 = imread('Figure3.jpg'); 

% Convert the image to grayscale
grayImage = rgb2gray(figure3);

% Plot the histogram of the image
figure;
histogram(grayImage);
title('Histogram of Grayscale Image');

% Get the peak of the histogram
[counts, grayLevels] = imhist(grayImage);
[~, maxIndex] = max(counts);
peakValue = grayLevels(maxIndex);
fprintf('Peak value of the histogram: %d\n', peakValue);

% Define two threshold values
threshold1 = peakValue - 20; 
threshold2 = peakValue + 20;

% Segment the image using two threshold values
[row, col] = size(grayImage);
segmentedImage = zeros(row, col);

for i = 1:row
    for j = 1:col
        if grayImage(i, j) <= threshold1
            segmentedImage(i, j) = 0;
        elseif grayImage(i, j) > threshold1 && grayImage(i, j) <= threshold2
            segmentedImage(i, j) = 1;
        else
            segmentedImage(i, j) = 2;
        end
    end
end

% Subplot the original image, grayscale image, and segmented image
figure;
subplot(1, 3, 1);
imshow(figure3);
title('Original Image');

subplot(1, 3, 2);
imshow(grayImage);
title('Grayscale Image');

subplot(1, 3, 3);
imshow(segmentedImage, [0 2]); % Displaying the segmented image with proper colormap
title('Segmented Image');

% Save the segmented image as a JPEG image
imwrite(segmentedImage, 'Segmented_Image.jpg'); 