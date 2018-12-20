
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

%imshow(BW);
maskedSkin = rgb2gray(maskedRGBImage);


edges_prewitt = edge(maskedSkin,'Prewitt');
edges_roberts = edge(maskedSkin, 'Roberts');
edges_sobel = edge(maskedSkin, 'Sobel');
edges_canny = edge(maskedSkin, 'Canny');

lineStructure = strel('line',11,90);



prewittContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_prewitt)),lineStructure);

robertContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_roberts)),lineStructure);

sobelContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_sobel)),lineStructure);

cannyContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_canny)),lineStructure);



subplot(2,2,1); 
imshow(RGB + prewittContour);colormap gray;axis image;title('Prewitt');


subplot(2,2,2); 
imshow(RGB + robertContour);colormap gray;axis image;title('Roberts'); 


subplot(2,2,3);
imshow(RGB + sobelContour);colormap gray;axis image;title('Sobel');


subplot(2,2,4);
imshow(RGB + cannyContour);colormap gray;axis image;title('Canny');







