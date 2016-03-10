clear;
%%%%% dct3
winsize=11;
i1=imread('abc.jpg');
%i1=double(i1);
siz=size(i1);
str=i1;
i1=double(rgb2gray(i1));
[Gx, Gy] = gradient(i1);
temp=zeros(winsize,winsize);
Th=10;
% for i=1:winsize:siz(1)
%     for j=1:winsize:siz(2)
%         if i+winsize-1<siz(1)&& j+winsize-1<siz(2)
%             sum=0;
%             for ii=0:winsize-1
%                 for jj=0:winsize-1
%                     %                     r=i1(i+ii,j+jj,1);
%                     %                     g=i1(i+ii,j+jj,2);
%                     %                     b=i1(i+ii,j+jj,3);
%                     %                     sum=double(r)+double(g)+double(b);
%                     %                     mymin=double(min(i1(i+ii,j+jj,:)));
%                     %                     temp(ii+1,jj+1)=1-((3/sum)*mymin);
%                     if abs(Gx(i+ii,j+jj))> Th
%                         sum=sum+abs(Gx(i+ii,j+jj));
%                     end
%                 end
%             end
%             ans(i:i+winsize,j:j+winsize)=sum;
%         end
%     end
% end

m=[1 1 -1 -1; 1 1 -1 -1; -1 -1 1 1;-1 -1 1 1];
ans=conv2(i1,m);
ans=im2bw(ans);
ans=bwareaopen(ans,50);