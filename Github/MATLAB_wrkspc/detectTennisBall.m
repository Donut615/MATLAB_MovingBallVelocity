%DigImg Final Project
%04-26-2020
%Joshua Snider

%
function outputImg = detectTennisBall(filepath)
whatAmI = imfinfo(filepath);
%test img passed in is binary
if whatAmI.BitDepth~=1
    bwImg=boundaryDetect('true',filepath,'3'); 
else
    bwImg=imread(filepath);
end
%invert binary image passed in
invertImg=~bwImg;
%set threshold such that pixel.x<1050 or pixel.x>2950 are detected and set
%them to 1. Do the same with pixel.y>2100
for y=1:size(invertImg,1)
    for x=1:size(invertImg,2)
       if x<1150
           invertImg(y,x)=0;
       end
       if x>2950
           invertImg(y,x)=0;
       end
       if y>1950
           invertImg(y,x)=0;
       end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%threshold detections smaller than the tennis ball with bwareaopen() and if
%this alone is not enough, use bwlabel() to test for connectivity
invertImg=bwareaopen(invertImg, 7000);

%now that we have isolated tennis ball to detect, use regionprops to detect
%and pass centroid as property we want.
outputImg = invertImg;
end