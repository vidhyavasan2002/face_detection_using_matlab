clc
close all
warning off
mycam=webcam;
while true
e=mycam.snapshot;
imshow(e);
ms=rgb2gray(e);
[BW,maskedImage] = segmentImage(ms);
filta=imfill(imdilate(bwareaopen(BW,300),ones(5,5)),'holes');
[a,b]=bwlabel(filta,8);
mesurements=regionprops(a,'BoundingBox');
imshow(e);
hold on;
for k=1:length(mesurements)
    thisBB=mesurements(k).BoundingBox;
    rectangle('Position',[thisBB(1),thisBB(2),thisBB(3),thisBB(4)] ,...
    'EdgeColor','r','LineWidth',2);
end
title(b);
hold off;
drawnow;
end