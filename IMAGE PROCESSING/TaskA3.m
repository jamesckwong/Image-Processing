clear all;
close all;
clc;
fileName = uigetfile('palmdown.png');
palmdownImageFile = imread(fileName);


r = palmdownImageFile(:, :, 1); 
g = palmdownImageFile(:, :, 2); 
b = palmdownImageFile(:, :, 3); 

%Thresholds of all isolated RGB pixels. 
orangeBinary = r > 142 & r < 210 & g > 65 & g < 107 & b < 52; 
orangeIsolated = palmdownImageFile;
orangeIsolated(repmat(~orangeBinary,[1 1 3])) = 0; 


yellowBinary = r > 141 & r < 202 & g > 123 & g < 194 & b > 61 & b < 81;
yellowIsolated = palmdownImageFile;
yellowIsolated(repmat(~yellowBinary,[1 1 3])) = 0;


blueBinary = r > 5 & r < 30 & g > 40 & g < 60 & b > 70 & b < 170;
blueIsolated = palmdownImageFile;
blueIsolated(repmat(~blueBinary,[1 1 3])) = 0;


greenBinary = r > 0 & r < 50 &  g > 70 & g < 100 & b > 70 & b < 105;
greenIsolated = palmdownImageFile;
greenIsolated(repmat(~greenBinary,[1 1 3])) = 0;

redBinary = r > 160 & r < 200 & g > 90 & g < 120 & b > 84 & b < 119;
redIsolated = palmdownImageFile;
redIsolated(repmat(~redBinary,[1 1 3])) = 0;
redBinaryFilledin = imfill(redIsolated,'holes');

%Displaying images side by side. 
figure;
subplot(6,2,1);
imshow(orangeBinary);colormap gray;axis image;title('Binary Masks'); 

subplot(6,2,2); 
imshow(orangeIsolated);colormap gray;axis image;title('Isolated Pixels');

subplot(6,2,3);
imshow(yellowBinary);

subplot(6,2,4);
imshow(yellowIsolated);
subplot(6,2,5);
imshow(blueBinary);

subplot(6,2,6);
imshow(blueIsolated);

subplot(6,2,7);
imshow(greenBinary);

subplot(6,2,8);
imshow(greenIsolated);

subplot(6,2,9);
imshow(redBinary);

subplot(6,2,10);
imshow(redIsolated);




