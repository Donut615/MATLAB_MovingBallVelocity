%DigImg Final Project
%04-26-2020
%Joshua Snider

%Use result from detectTennisBall to getBallCenter and return that point.

function dataPoint = getBallCenter(bwImg)  
    %test img passed in is binary, assume true
    binaryCheck=1;
    for y=1:size(bwImg,1)
        for x=1:size(bwImg,2)
            if (bwImg(y,x)~= 0) && (bwImg(y,x)~=1)
                binaryCheck=0;
            end
        end
    end
    if binaryCheck==0
        dataPoint.x=0; dataPoint.y=0;
        return;
    end
    dataPoint=regionprops(bwImg,'Centroid');
end