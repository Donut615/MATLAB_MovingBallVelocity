%DigImg Final Project
%04-27-2020
%Joshua Snider

%MASTER SCRIPT FOR VelocityOfTennisBall PROJECT ~7s on 3840x2160p images
function velocity = tennisballVelocity(filepath1, filepath2, timePassed)
    %manip image 1, our starting image
    startImg = im2double(imread(filepath1));
    extractedBallImg1 = detectTennisBall(filepath1);
    centroid1 = getBallCenter(extractedBallImg1);
    %manip image 2, our ending image
    endImg = im2double(imread(filepath2));
    extractedBallImg2 = detectTennisBall(filepath2);
    centroid2 = getBallCenter(extractedBallImg2);
    %calculate distance based on locations of our centroids to give us
    %distance. time between two images = 0.05; Will vary depending on clip
    timePassed = str2double(timePassed);
    %
    location = [centroid1.Centroid;centroid2.Centroid];
    %location.X1-location.X2/timePassed , **Doing X2-X1 to get (-)=left
    %location.Y1-location.Y2/timePassed
    % = velocity
    
    %convert distance in pixels-->mm-->cm-->m
    distInMtrX=(location(2,1)-location(1,1))/3.779/10/100;
    distInMtrY=(location(1,2)-location(2,2))/3.779/10/100;
    %calculate velocity using above formula and get m/s for x and y.
    velocity = [distInMtrX/timePassed , distInMtrY/timePassed];
end