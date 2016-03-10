%%%%% Thresholded absolute gradient
winsize=11;
i1=imread('abc.jpg');
%i1=double(i1);
siz=size(i1);
str=i1;
i1=double(rgb2gray(i1));
[Gx, Gy] = gradient(i1);
temp=zeros(winsize,winsize);
Th=10;
for i=1:winsize:siz(1)
    for j=1:winsize:siz(2)
        if i+winsize-1<siz(1)&& j+winsize-1<siz(2)
            sum1=0;
            sum2=0;
            for ii=0:winsize-1
                for jj=0:winsize-1
                    sum1=sum1+(i1(i+ii,j+jj)*i1(i+ii+1,j+jj));
                    sum2=sum2+(i1(i+ii,j+jj)*i1(i+ii+2,j+jj));
                end
            end
            ans(i:i+winsize,j:j+winsize)=sum1-sum2;
        end
    end
end
