fileName = uigetfile();
HandImage = imread(fileName);

r = HandImage(:, :, 1); 
g = HandImage(:, :, 2); 
b = HandImage(:, :, 3); 






greyScaleHand = rgb2gray(HandImage);
catGreyScale = cat(3, greyScaleHand , greyScaleHand, greyScaleHand );

orangeThumbBinary = r > 142 & r < 208 & g > 68 & g < 109 & b < 54; 
orangeThumbIsolated = HandImage;
orangeThumbIsolated(repmat(~orangeThumbBinary,[1 1 3])) = 0; 


yellowIndexBinary = r > 174 & r < 235 & g > 142 & g < 206 & b > 33 & b < 108;
yellowIndexIsolated = HandImage;
yellowIndexIsolated(repmat(~yellowIndexBinary,[1 1 3])) = 0;


blueMiddleBinary = r > 5 & r < 30 & g > 40 & g < 60 & b > 70 & b < 170;
blueMiddleIsolated = HandImage;
blueMiddleIsolated(repmat(~blueMiddleBinary,[1 1 3])) = 0;


greenRingBinary = r > 0 & r < 50 &  g > 70 & g < 100 & b > 70 & b < 105;
greenRingIsolated = HandImage;
greenRingIsolated(repmat(~greenRingBinary,[1 1 3])) = 0;

redPinkyBinary = r > 140 & r < 180 & g > 55 & g < 80 & b > 50 & b < 80;
redPinkyIsolated = HandImage;
redPinkyIsolated(repmat(~redPinkyBinary,[1 1 3])) = 0;


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

[y,x] = find(orangeThumbBinary);
Orangexmean = mean(x);
Orangeymean = mean(y);

hold on;
plot(Orangexmean, Orangeymean, 'ro', 'MarkerSize', 30);


[y,x] = find(greenRingBinary);
Greenxmean = mean(x);
Greenymean = mean(y);

hold on;
plot(Greenxmean, Greenymean, 'ro', 'MarkerSize', 30);

[y,x] = find(blueMiddleBinary);
Bluexmean = mean(x);
Blueymean = mean(y);

hold on;
plot(Bluexmean, Blueymean, 'ro', 'MarkerSize', 30);

[y,x] = find(redPinkyBinary);
Redxmean = mean(x);
Redymean = mean(y);

hold on;
plot(Redxmean, Redymean, 'ro', 'MarkerSize', 30);

[y,x] = find(yellowIndexBinary);
Yellowxmean = mean(x);
Yellowymean = mean(y);

hold on;
plot(Yellowxmean, Yellowymean, 'ro', 'MarkerSize', 30);



plot([Orangexmean, Yellowxmean] ,[Orangeymean ,Yellowymean], 'g')
plot([Yellowxmean, Bluexmean], [Yellowymean, Blueymean], 'g')
plot([Bluexmean, Greenxmean], [Blueymean, Greenymean], 'g')
plot([Greenxmean, Redxmean], [Greenymean ,Redymean], 'g')






[y,x] = find(greenRingBinary);
Greenxmean = mean(x);
Greenymean = mean(y);



[y,x] = find(blueMiddleBinary);
Bluexmean = mean(x);
Blueymean = mean(y);



[y,x] = find(redPinkyBinary);
Redxmean = mean(x);
Redymean = mean(y);



[y,x] = find(yellowIndexBinary);
Yellowxmean = mean(x);
Yellowymean = mean(y);

orange2Yellow = pdist([Orangexmean, Orangeymean; Yellowxmean,Yellowymean], 'euclidean');

orange2Blue = pdist([Orangexmean, Orangeymean ; Bluexmean,Blueymean], 'euclidean');

orange2Red = pdist([Orangexmean, Orangeymean ; Redxmean,Redymean], 'euclidean');

orange2Green = pdist([Orangexmean, Orangeymean ; Greenxmean,Greenymean], 'euclidean');

if orange2Yellow<orange2Blue && orange2Yellow<orange2Red && orange2Yellow<orange2Green 
    disp('This is thumb to Index Finger.')
end
if orange2Blue<orange2Yellow && orange2Blue<orange2Red && orange2Blue<orange2Green
    disp('This is thumb to Middle Finger.')
end
if orange2Green<orange2Yellow && orange2Green<orange2Red && orange2Green<orange2Blue
    disp('This is thumb to Ring Finger.')
end
if orange2Red<orange2Yellow && orange2Red<orange2Blue && orange2Red<orange2Green
    disp('This is thumb to Pinky Finger.')
end 
    

