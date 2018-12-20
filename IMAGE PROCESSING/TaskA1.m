clear all ;
fileName = uigetfile('palmdown.png');
palmdownImageFile = imread(fileName);

%Converting RGB Image to GrayScale.
palmdownGreyScale = rgb2gray(palmdownImageFile);

%Displaying images side by side.
subplot(2,2,1);
imshow(palmdownImageFile);colormap gray;axis image;title('i. RGB'); 
subplot(2,2,2); 
imshow(palmdownGreyScale);colormap gray;axis image;title('ii. GreyScale');

%State the equation and the name 