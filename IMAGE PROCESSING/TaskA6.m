
RGB = imread('palmdown.png');

%Converting from rgb to hsv.
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

imshow(BW);
maskedSkin = rgb2gray(maskedRGBImage);

%Edge Detection 
edges_prewitt = edge(maskedSkin,'Prewitt');
edges_roberts = edge(maskedSkin, 'Roberts');
edges_sobel = edge(maskedSkin, 'Sobel');
edges_canny = edge(maskedSkin, 'Canny');

%Red line
redLine = strel('line',11,90);



prewittContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_prewitt)),redLine);

robertContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_roberts)),redLine);

sobelContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_sobel)),redLine);

cannyContour = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(edges_canny)),redLine);


%Displaying each edge detection method side by side. 
subplot(2,2,1); 
imshow(RGB + prewittContour);colormap gray;axis image;title('Prewitt');


subplot(2,2,2); 
imshow(RGB + robertContour);colormap gray;axis image;title('Roberts'); 


subplot(2,2,3);
imshow(RGB + sobelContour);colormap gray;axis image;title('Sobel');


subplot(2,2,4);
imshow(RGB + cannyContour);colormap gray;axis image;title('Canny');







