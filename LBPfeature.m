close all;clear all;clc;

in=input('Enter name of the image (in single quotes): ');
img=imread(in);
[col,img]=preprocess(img);  %read explanation of 'preprocess()'.
figure,imshow(col);

winSize=3;
winSq=winSize*winSize;
mid=ceil(winSq/2);
imgCols=im2col(img,[winSize,winSize]);
len=size(imgCols,2);
Th=0.02;    %threshold for pixel differences.
lbp=cell(1,len);
for i=1:len
    curr=imgCols(:,i);
    x=curr(mid,1);
    curr=abs(curr-x)>Th;    %converting to binary pattern depending on...
    ...difference b/w pixels.
    lbp{1,i}=uniformLBP([curr(1:mid-1);curr(mid+1:winSq)]); %see description...
    ...of 'uniformLBP'.
    %final(1,i)=sum(lbp{1,i}(mid+1:winSq-1))/(winSq-mid);
end
lbpImage=reshape(lbp,size(img,1)-winSize+1,size(img,2)-winSize+1);
%final=reshape(final,size(img,1)-winSize+1,size(img,2)-winSize+1);

[rows,cols]=size(lbpImage);
finalMap=zeros(rows-winSize+1,cols-winSize+1);
for i=winSize-1:rows-winSize+2
    for j=winSize-1:cols-winSize+2
        lbpRowSum=finalLBP(lbpImage,i,j);   %see description of 'finalLBP'.
        finalMap(i,j)=sum(lbpRowSum(6:8))/27;   %normalising so that finalMap...
        ...can be shown as image. And also 6:8 will be prominent in sharp and ...
            ...negligible in blurred. That's why it is taken as final feature.
    end
end

figure,imshow(finalMap); %showing finalMap as image.