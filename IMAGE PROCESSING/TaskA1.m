clear all ;
fileName = uigetfile('palmdown.png');
palmdownImageFile = imread(fileName);


palmdownGreyScale = rgb2gray(palmdownImageFile);

subplot(2,2,1);
imshow(palmdownImageFile);colormap gray;axis image;title('i. RGB'); 
subplot(2,2,2); 
imshow(palmdownGreyScale);colormap gray;axis image;title('ii. GreyScale');

%state the equation and the name 