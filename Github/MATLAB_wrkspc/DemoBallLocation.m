%DigImg Final Project
%04-29-2020
%Joshua Snider

%Modified getBallCenter called get DemoBallLocation

function location = DemoBallLocation(bwImg)  
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
        location.c.Centroid=[0,0];
        location.bb.BoundingBox=[0,0,0,0];
    else
        location.c=regionprops(bwImg,'Centroid');
        location.bb=regionprops(bwImg,'BoundingBox');
    end
end