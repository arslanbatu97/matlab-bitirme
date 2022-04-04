videoReader = vision.VideoFileReader('people.mp4');
videoPlayer = vision.VideoPlayer('Position',[300 100 1000 500]);

detector = peopleDetectorACF();

while ~isDone(videoReader)
    frame = step(videoReader);
    I = double(frame);
    [bboxes,scores] = detect(detector,I);
    
    if ~isempty(bboxes)
        I = insertObjectAnnotation(I,'rectangle',bboxes,scores,'color','y','LineWidth',3);
    end
    
    step(videoPlayer,I);
    
end

release(videoReader);
release(videoPlayer);

