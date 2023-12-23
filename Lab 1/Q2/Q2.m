%(1)Clear the work space
clc
clear all
%(2)Load the colour image
figure3 = imread('Figure3.jpg');
%(3)Convert the image to grayscale
grayImage = rgb2gray(figure3);
%(4)Plot the histogram of the image
figure;
histogram(grayImage);
title('Histogram of Grayscale Image');
%(5)Get the peak of the histogram
[counts, grayLevels] = imhist(grayImage);
[~, maxIndex] = max(counts);
peakValue = grayLevels(maxIndex);
fprintf('Peak value of the histogram: %d\n', peakValue);
%(6)Assign '0' or '1' for each pixel using 'if' condition within 'for' loops
[row, col] = size(grayImage);
segmentedImage = zeros(row, col);
for i = 1:row
    for j = 1:col
        if grayImage(i, j) >= peakValue
            segmentedImage(i, j) = 1;
        else
            segmentedImage(i, j) = 0;
        end
    end
end
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


