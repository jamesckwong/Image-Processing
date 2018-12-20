close all;
clc;

fileName = uigetfile('palmdown.png');
palmdownImageFile = imread(fileName);

%Converting from rgb to greyscale.

palmdownGreyScale = rgb2gray(palmdownImageFile);

palmdownGreyScaleHistogram = imhist(palmdownGreyScale);

%Splitting up histogram with RGB components so there are three coloured
%lines for the intensity. 

R = palmdownImageFile(:,:,1);
G = palmdownImageFile(:,:,2);
B = palmdownImageFile(:,:,3);

RedChannelHist = imhist(R);
GreenChannelHist = imhist(G);
BlueChannelHist = imhist(B);
%ArithmeticMean of each individual RGB. 
greyScaleArithmeticMean = mean2(palmdownGreyScale);
rArithmeticMean = mean2(R);
gArithmeticMean = mean2(G);
bArithmeticMean = mean2(B);

figure;

subplot(1,2,1);
plot(0:255, RedChannelHist, 'r','LineWidth', 1);hold on
plot(0:255, GreenChannelHist, 'g','LineWidth', 1);hold on
plot(0:255, BlueChannelHist, 'b','LineWidth', 1);
%Labelling of X axis 
xlabel('Intensity', 'FontSize', 14); ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
rgbHistYLength = get(gca,'YLim');
%Show vertical dotted bars down  as Artihmetic Means. 
ylim([0 max(RedChannelHist)]);
line([rArithmeticMean,rArithmeticMean],rgbHistYLength,'Color','r','LineWidth', 1,'LineStyle', '--');hold on
ylim([0 max(GreenChannelHist)]);
line([gArithmeticMean,gArithmeticMean],rgbHistYLength,'Color','g','LineWidth', 1,'LineStyle', '--');hold on
ylim([0 max(BlueChannelHist)]);
line([bArithmeticMean,bArithmeticMean],rgbHistYLength,'Color','b','LineWidth', 1,'LineStyle', '--');


%Displaying the Histogram showing Lumninance with only one arithmetic mean
%= GreyScale
subplot(1,2,2);
plot(0:255, palmdownGreyScaleHistogram, 'black','LineWidth', 1);
%Labelling of Y axis.
xlabel('Luminance', 'FontSize', 14);ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
%Show vertical dotted bar down  as Artihmetic Mean. 
ylim([0 max(palmdownGreyScaleHistogram)]);
greyScaleHistYLength = get(gca,'YLim');
line([greyScaleArithmeticMean,greyScaleArithmeticMean],greyScaleHistYLength,'Color','black','LineWidth', 1,'LineStyle','--');


