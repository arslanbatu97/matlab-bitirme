s = dir('*.png');
v = VideoWriter('output.avi');
open(v);
for kk = 1:numel(s)
    filePath = fullfile(s(kk).folder,s(kk).name);
    I = imread(filePath);
    writeVideo(v,I);
end
close(v);