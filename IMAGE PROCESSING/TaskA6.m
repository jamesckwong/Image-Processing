
RGB = imread('palmdown.png');


I = rgb2hsv(RGB);


channel1Min = 0.046;
channel1Max = 0.080;


channel2Min = 0.235;
channel2Max = 0.549;

channel3Min = 0.284;
channel3Max = 0.923;

sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

maskedRGBImage = RGB;


maskedRGBImage(repmat(~BW,[1 1 3])) = 0;


maskedSkin = rgb2gray(maskedRGBImage);
visboundaries(maskedSkin)

edges_prewitt = edge(maskedSkin,'Prewitt');

edges_roberts = edge(maskedSkin, 'Roberts');

edges_sobel = edge(maskedSkin, 'Sobel');

edges_canny = edge(maskedSkin, 'Canny');


figure;
subplot(2,2,1);
imshow(edges_prewitt);colormap gray;axis image;title('Prewitt'); 
subplot(2,2,2);
imshow(edges_roberts);colormap gray;axis image;title('Roberts'); 
subplot(2,2,3);
imshow(edges_sobel);colormap gray;axis image;title('Sobel'); 
subplot(2,2,4);
imshow(edges_canny);colormap gray;axis image;title('Canny'); 

linkaxes; 




