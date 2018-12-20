fileName = uigetfile('palmdown.png');
palmdownImageFile = imread(fileName);

%h = palmdownImageFile(:, :, 1); % hue
%s = palmdownImageFile(:, :, 2); % saturation
%v = palmdownImageFile(:, :, 3); % value

%skinBinary = h > 0.046 & h < 0.080 & s > 0.235 & s < 0.549 & v > 0.284 & v < 0.923; 
%skinIsolated = palmdownImageFile;
%skinIsolated(repmat(~skinBinary,[1 1 3])) = 0; 
r = palmdownImageFile(:, :, 1); 
g = palmdownImageFile(:, :, 2);
b = palmdownImageFile(:, :, 3);

skinBinary = r > 0.046 & r < 0.080 & g > 0.235 & g < 0.549 & b > 0.284 & b < 0.923; 
skinIsolated = palmdownImageFile;
skinIsolated(repmat(~skinBinary,[1 1 3])) = 0; 


palmdownImageFile = edge(palmDownBinary,'Prewitt');

%palmdownImageFile = edge(palmDownBinary,'Roberts');

%palmdownImageFile = edge(palmDownBinary,'Sobel');

%palmdownImageFile = edge(palmDownBinary,'Canny');

figure;
subplot('Position', [0.02 0.35 0.3 0.30]);
imshow(edges_prewittt);
subplot('Position', [0.35 0.35 0.3 0.30]);
imshow(edges_roberts);
subplot('Position', [0.68 0.35 0.3 0.30]);
imshow(edges_Sobel);
subplot('Position', [1.01 0.35 0.3 0.30]);
imshow(edges_Canny);
linkaxes;



