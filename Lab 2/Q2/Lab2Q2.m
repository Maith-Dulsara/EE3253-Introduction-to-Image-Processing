% Clear the workspace 
clc
clear all
% Read the input image
I=imread('Figure2.jpg');

% Convert the input image to grayscale
A=rgb2gray(I);

% Number of rows and columns in the image
x = size(I,1);
y = size(I,2);

% Total number of pixels in the image
n = x*y;

% Initialize variables for histogram equalization
ah = uint8(zeros(x,y));% Output image after custom histogram equalization
f = zeros(256,1);   % Frequency of each pixel intensity
pdf = zeros(256,1); % Probability density function (PDF) of each pixel intensity
cdf = zeros(256,1); % Cumulative distribution function (CDF) of each pixel intensity
cum = zeros(256,1); % Cumulative sum of pixel frequencies
out = zeros(256,1); % Output pixel intensities after histogram equalization

% Calculate the histogram of the input grayscale image
for i = 1:x
    for j = 1:y
        value = I(i,j);
    f(value + 1) = f(value + 1) +1;
    pdf(value + 1) = f(value + 1)/n;
    end
end

% Calculate the cumulative distribution function (CDF) and perform histogram equalization
sum = 0;
L = 255;
for i = 1:size(pdf)
    sum = sum + f(i);
    cum(i) = sum;
    cdf(i) = cum(i)/n;
    out(i) = round(cdf(i)*L);
end

% Apply histogram equalization to create the custom equalized image
for i = 1:x
    for j = 1:y
        ah(i,j)=out(I(i,j)+1);
    end
end

% Perform histogram equalization using built-in 'histeq' function
b = histeq(I);

% Display the original and equalized images with their histograms
imshow(b)
subplot(3,2,1),imshow(I),title('Original image');
subplot(3,2,2),imhist(I),title('Histogram of original image');
subplot(3,2,3),imshow(b),title('Custom equalized image');
subplot(3,2,4),imhist(b),title('Histogram of custom equalized imagee');
subplot(3,2,5),imshow(ah),title('Equalized image');
subplot(3,2,6),imhist(ah),title('Histogram of equalized image');