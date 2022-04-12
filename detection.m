v = VideoReader("people.mp4");

i = 0;

while hasFrame(v)
    frame = readFrame(v);
    gray_frame = rgb2gray(frame)
    binary_frame = imbinarize(gray_frame);;
    file = sprintf("a_frame_%d.png",i);
    imwrite(binary_frame);
    i = i+1


    