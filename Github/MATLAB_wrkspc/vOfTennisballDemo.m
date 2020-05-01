%DigImg Final Project
%04-29-2020
%Joshua Snider

%Demo for Final Project presentation, basically copy+paste of
%tennisballVelocity() and uses modified getBallCenter designed for demo.
function vOfTennisballDemo()
%     filepath1 = input('Please input filepath for starting image: ','s');
%     filepath2 = input('Please input filepath for ending image: ','s');
    filepath1 = uigetfile('*.*','Select Starting Image');
    filepath2 = uigetfile('*.*','Select Ending Image');
    timePassed = inputdlg('Please input time(seconds) elapsed from starting image to ending image: ','Enter Time Passed');
    %manip image 1, our starting image
    startImg = im2double(imread(filepath1));
    extractedBallImg1 = detectTennisBall(filepath1);
    ball1 = DemoBallLocation(extractedBallImg1);
    %manip image 2, our ending image
    endImg = im2double(imread(filepath2));
    extractedBallImg2 = detectTennisBall(filepath2);
    ball2 = DemoBallLocation(extractedBallImg2);
    %calculate distance based on locations of our centroids to give us
    %distance. time between two images = 0.05; Will vary depending on clip
    timePassed = str2double(timePassed);
    %
    location = [ball1.c.Centroid;ball2.c.Centroid];
    %location.X1-location.X2/timePassed , **Doing X2-X1 to get (-)=left
    %location.Y1-location.Y2/timePassed
    % = velocity
    
    %convert distance in pixels-->mm-->cm-->m
    distInMtrX=(location(2,1)-location(1,1))/3.779/10/100;
    distInMtrY=(location(1,2)-location(2,2))/3.779/10/100;
    %calculate velocity using above formula and get m/s for x and y.
    velocity = [distInMtrX/timePassed , distInMtrY/timePassed];
    startImgCpy=startImg;
    endImgCpy=endImg;
    subplot(2,1,1), imshow(startImgCpy), title('StartImg w/ Target');
    hold on;
    plot(ball1.c.Centroid(:,1),ball1.c.Centroid(:,2),'r*');
    rectangle('Position', ball1.bb.BoundingBox, 'EdgeColor','r');
    hold off;
    subplot(2,1,2), imshow(endImgCpy), title('EndImg w/ Target');
    hold on;
    plot(ball2.c.Centroid(:,1),ball2.c.Centroid(:,2),'r*');
    rectangle('Position', ball2.bb.BoundingBox, 'EdgeColor','r');
    hold off;
    impixelinfo;
    f = msgbox("PrintOut of final results:"+char(10)+"Velocity X: "+velocity(1)+char(10)+"Velocity Y: "+velocity(2)+char(10)+"Img1 Ball @: "+ball1.c.Centroid(:,1)+','+ball1.c.Centroid(:,2)+char(10)+"Img2 Ball @: "+ball2.c.Centroid(:,1)+','+ball2.c.Centroid(:,2),"Done!");
end