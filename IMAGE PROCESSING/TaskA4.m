
close all;
clc;

flathand = imread('palmdown.png');
greyScaleFlatHand = rgb2gray(flathand);
catGreyScale = cat(3, greyScaleFlatHand , greyScaleFlatHand, greyScaleFlatHand );

greyWithColour = imadd(catGreyScale, orangeIsolated); 
greyWithColour = imadd(greyWithColour, redIsolated); 
greyWithColour = imadd(greyWithColour, blueIsolated); 
greyWithColour = imadd(greyWithColour, greenIsolated); 
greyWithColour = imadd(greyWithColour, yellowIsolated); 
imshow(greyWithColour);

%Cardinality of each set. 
OrangeCardinality = sum(orangeBinary(:));
YellowCardinality = sum(yellowBinary(:));
BlueCardinality = sum(blueBinary(:));
RedCardinality = sum(redBinary(:));
GreenCardinality = sum(greenBinary(:));



