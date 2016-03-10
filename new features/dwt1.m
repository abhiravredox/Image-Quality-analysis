clear;
%%%%% dwt1
winsize=3;
i1=imread('abc.jpg');
%i1=double(i1);

str=i1;
i1=double(rgb2gray(i1));
[Gx, Gy] = gradient(i1);
temp=zeros(winsize,winsize);
Th=10;
[a b c d]=dwt2(i1,'db1','mode','sym');
siz=size(a);
for i=1:winsize:siz(1)
    for j=1:winsize:siz(2)
        if i+winsize-1<siz(1)&& j+winsize-1<siz(2)
            sum=0;
            for ii=0:winsize-1
                for jj=0:winsize-1
                    %                     r=i1(i+ii,j+jj,1);
                    %                     g=i1(i+ii,j+jj,2);
                    %                     b=i1(i+ii,j+jj,3);
                    %                     sum=double(r)+double(g)+double(b);
                    %                     mymin=double(min(i1(i+ii,j+jj,:)));
                    %                     temp(ii+1,jj+1)=1-((3/sum)*mymin);
                    
                        sum=sum+b(i+ii,j+jj)+c(i+ii,j+jj)+d(i+ii,j+jj);

                end
            end
            ans(i:i+winsize,j:j+winsize)=sum;
        end
    end
end
ans=uint8(ans);
ans=imresize(ans,2);

% mymin=min(ans(:));
% ans=ans-mymin;
% mymax=max(ans(:));
% factor=mymax/255;
% factor=factor+1;
% ans=ans./factor;

