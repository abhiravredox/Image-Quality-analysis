close all;clear all;clc;

img=imread('butterfly2.jpg');
[col,img]=preprocess(img);  %read explanation of 'preprocess()'.
figure,imshow(col);

winSize=3;
winSq=winSize*winSize;
imgCols=im2col(img,[winSize,winSize]);
len=size(imgCols,2);
Th=0.02;

for i=1:len
    for j=1:winSq
        if abs(imgCols(ceil(winSq/2),i)-imgCols(j,i))<Th && j~=ceil(winSq/2)
            
        else if abs(imgCols(ceil(winSq/2),i)-imgCols(j,i))>=Th && j~=ceil(winSq/2)
        end
    end
end
            
        