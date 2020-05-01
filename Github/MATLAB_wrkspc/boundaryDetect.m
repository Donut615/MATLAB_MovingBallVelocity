%DigImg Final Project
%04-20-2020
%Joshua Snider

%Morphological boundary detection
function outputImg = boundaryDetect(isColor,filepath,squareMaskSize)
%define variables
originImg = im2double(imread(filepath)); 
if strcmp(isColor,"true")
    originImg=rgb2gray(originImg);
end
mask=ones(str2double(squareMaskSize),str2double(squareMaskSize));
brighterHalf=originImg>0.5;
interior=imerode(brighterHalf,mask);
boundaryImg=originImg&~interior;

% %show starting img in a subplot @ index 1
% subplot(1,2,1), imshow(originImg) , title('Original Image');
% %show resulting outline image in a subplot @ index 2
% subplot(1,2,2), imshow(boundaryImg) ,title("BoundaryDetect Applied");
outputImg=boundaryImg;
end