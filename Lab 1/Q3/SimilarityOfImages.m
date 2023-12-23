% Read the segmented images
segmentedImage1 = imread('Segmented_Image1.jpg');
segmentedImage2 = imread('Segmented_Image2.jpg');

% Convert the segmented images to grayscale if necessary
if size(segmentedImage1, 3) == 1
    grayImage1 = segmentedImage1;
else
    grayImage1 = rgb2gray(segmentedImage1);
end

if size(segmentedImage2, 3) == 1
    grayImage2 = segmentedImage2;
else
    grayImage2 = rgb2gray(segmentedImage2);
end


% Calculate the SSIM
ssimValue = ssim(segmentedImage1, segmentedImage2);

% Calculate the MSE
mseValue = immse(segmentedImage1, segmentedImage2);

% Display the comparison results
fprintf('SSIM value: %f\n', ssimValue);
fprintf('MSE value: %f\n', mseValue);
