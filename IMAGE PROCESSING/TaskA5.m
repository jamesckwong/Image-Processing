
close all;
clc;

flathand = imread('palmdown.png');
greyScaleFlatHand = rgb2gray(flathand);
imshow(greyWithColour);

%Co-ordinates shown marked with a red circle from mean of x and y values. 
[y,x] = find(orangeBinary);
Orangexmean = mean(x);
Orangeymean = mean(y);


hold on;
plot(Orangexmean, Orangeymean, 'ro', 'MarkerSize', 30);


[y,x] = find(greenBinary);
Greenxmean = mean(x);
Greenymean = mean(y);

hold on;
plot(Greenxmean, Greenymean, 'ro', 'MarkerSize', 30);

[y,x] = find(blueBinary);
Bluexmean = mean(x);
Blueymean = mean(y);

hold on;
plot(Bluexmean, Blueymean, 'ro', 'MarkerSize', 30);

[y,x] = find(redBinary);
Redxmean = mean(x);
Redymean = mean(y);

hold on;
plot(Redxmean, Redymean, 'ro', 'MarkerSize', 30);

[y,x] = find(yellowBinary);
Yellowxmean = mean(x);
Yellowymean = mean(y);

hold on;
plot(Yellowxmean, Yellowymean, 'ro', 'MarkerSize', 30);




%Green line connecting adjacent fingers.
plot([Orangexmean, Yellowxmean] ,[Orangeymean ,Yellowymean], 'g')
plot([Yellowxmean, Bluexmean], [Yellowymean, Blueymean], 'g')
plot([Bluexmean, Greenxmean], [Blueymean, Greenymean], 'g')
plot([Greenxmean, Redxmean], [Greenymean ,Redymean], 'g')

%Euclidean distance from each adjacent pair of fingertips.
orange2Yellow = pdist([Orangexmean, Orangeymean; Yellowxmean,Yellowymean], 'euclidean');

yellow2Blue = pdist([Yellowxmean, Yellowymean ; Bluexmean,Blueymean], 'euclidean');

blue2Green = pdist([Bluexmean, Blueymean ; Greenxmean,Greenymean], 'euclidean');

green2Red = pdist([Greenxmean, Greenymean ; Redxmean,Redymean], 'euclidean');



