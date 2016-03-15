close all;clear all;clc;

img=imread('butterfly2.jpg');
[col,img]=preprocess(img);  %read explanation of 'preprocess()'.
figure,imshow(col);

winSize=3;
winSq=winSize*winSize;
mid=ceil(winSq/2);
imgCols=im2col(img,[winSize,winSize]);
len=size(imgCols,2);
Th=0.05;
lbp=cell(1,len);
for i=1:len
    curr=imgCols(:,i);
    x=curr(mid,1);
    curr=abs(curr-x)>Th;
    lbp{1,i}=uniformLBP([curr(1:mid-1);curr(mid+1:winSq)]);
    final(1,i)=sum(lbp{1,i}(mid+1:winSq-1))/(winSq-mid);
end
lbpImage=reshape(lbp,size(img,1)-winSize+1,size(img,2)-winSize+1);
final=reshape(final,size(img,1)-winSize+1,size(img,2)-winSize+1);