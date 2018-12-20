
close all;
clc;

flathand = imread('palmdown.png');
greyScaleFlatHand = rgb2gray(flathand);
catGreyScale = cat(3, greyScaleFlatHand , greyScaleFlatHand, greyScaleFlatHand );

greyWithColour = imadd(catGreyScale, orangeThumbIsolated); 
greyWithColour = imadd(greyWithColour, redPinkyIsolated); 
greyWithColour = imadd(greyWithColour, blueMiddleIsolated); 
greyWithColour = imadd(greyWithColour, greenRingIsolated); 
greyWithColour = imadd(greyWithColour, yellowIndexIsolated); 
imshow(greyWithColour);

OrangeCardinality = sum(orangeThumbBinary(:));
YellowCardinality = sum(yellowIndexBinary(:));
BlueCardinality = sum(blueMiddleBinary(:));
RedCardinality = sum(redPinkyBinary(:));
GreenCardinality = sum(greenRingBinary(:));



