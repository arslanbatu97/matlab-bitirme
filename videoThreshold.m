close all
clear 
clc

%%Load the Video
videoSample = VideoReader("traffic.mp4");
videoSample.CurrentTime = 0.1;
%% Import opencv package

import clib.opencv.*;
import vision.opencv.*;

%% specify parameter values for background subtractor
history = 300; threshold = 400; shadow = true;

%% Create a utility function for background subtractor class
cvPtr = cv.createBackgroundSubtractorKNN(history,threshold,shadow);
kNNBase = util.getBasePtr(cvPtr);
%% Select the number of k-nearest neighbors
kNNBase.setkNNSamples(2);
%% Extract the foreground region using backgroundSubtractorKNN
foregroundmask = zeros(videoSample.Height,videoSample.Winth,videoSample.NumFrames);
while hasFrame(videoSample)
    frame = readFrame(videoSample);
    [inMat,imgInput] = util.createMat(frame);
    [outMat,outImg] = utilcreateMat();
    kNNBase.apply(imgInput,outImg);
    foregroundmask = util.getImage(outImg);
    
    
    foregroundmask = rescale(foregroundmask);
    foregroundmask = cast(foregroundmask,"like",frame);
    
    foreground(:,:,1) = frame(:,:,1).*foregroundmask;
    foreground(:,:,2) = frame(:,:,2).*foregroundmask;
    foreground(:,:,3) = frame(:,:,3).*foregroundmask;
    
    image(foreground,Parent-gca);
    pause(0.01);
end

    