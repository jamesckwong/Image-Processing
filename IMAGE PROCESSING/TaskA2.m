clear all;
close all;
clc;

fileName = uigetfile('palmdown.png');
palmdownImageFile = imread(fileName);

palmdownGreyScale = rgb2gray(palmdownImageFile);

palmdownGreyScaleHistogram = imhist(palmdownGreyScale);

R = palmdownImageFile(:,:,1);
G = palmdownImageFile(:,:,2);
B = palmdownImageFile(:,:,3);

RedChannelHist = imhist(R);
GreenChannelHist = imhist(G);
BlueChannelHist = imhist(B);

greyScaleArithmeticMean = mean2(palmdownGreyScale);
rArithmeticMean = mean2(R);
gArithmeticMean = mean2(G);
bArithmeticMean = mean2(B);

figure;

subplot(1,2,1);
plot(0:255, RedChannelHist, 'r','LineWidth', 1);hold on
plot(0:255, GreenChannelHist, 'g','LineWidth', 1);hold on
plot(0:255, BlueChannelHist, 'b','LineWidth', 1);
xlabel('Intensity', 'FontSize', 14); ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
rgbHistYLength = get(gca,'YLim');
ylim([0 max(RedChannelHist)]);
line([rArithmeticMean,rArithmeticMean],rgbHistYLength,'Color','r','LineWidth', 1,'LineStyle', '--');hold on
ylim([0 max(GreenChannelHist)]);
line([gArithmeticMean,gArithmeticMean],rgbHistYLength,'Color','g','LineWidth', 1,'LineStyle', '--');hold on
ylim([0 max(BlueChannelHist)]);
line([bArithmeticMean,bArithmeticMean],rgbHistYLength,'Color','b','LineWidth', 1,'LineStyle', '--');

subplot(1,2,2);
plot(0:255, palmdownGreyScaleHistogram, 'black','LineWidth', 1);
xlabel('Luminance', 'FontSize', 14);ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
ylim([0 max(palmdownGreyScaleHistogram)]);
greyScaleHistYLength = get(gca,'YLim');
line([greyScaleArithmeticMean,greyScaleArithmeticMean],greyScaleHistYLength,'Color','b','LineWidth', 1,'LineStyle','--');


