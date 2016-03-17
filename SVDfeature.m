close all;clear all;clc;

in=input('Enter name of the image (in single quotes): ');
img=imread(in);
[col,img]=preprocess(img);  %read explanation of 'preprocess()'.
figure,imshow(col);
[rows,cols]=size(img);

winSize=11;
winSq=winSize*winSize;
mid=ceil(winSq/2);
imgCols=im2col(img,[winSize,winSize]);
len=size(imgCols,2);
offset=round(0.2*winSize);

for i=1:len
    block=reshape(imgCols(:,i),winSize,winSize);
    svdMat=svd(block);
    finalMap(1,i)=sum(svdMat(1:offset))/sum(svdMat);
end

finalMap=reshape(finalMap,rows-winSize+1,cols-winSize+1);
figure,imshow(finalMap);