winsize=11;
i1=imread('abc.jpg');
i1=double(i1);
siz=size(i1);
sp=zeros(siz(1),siz(2),1);
for i=1:siz(1)
    for j=1:siz(2)
        r=i1(i,j,1);
        g=i1(i,j,2);
        b=i1(i,j,3);
        sum=double(r)+double(g)+double(b);
        mymin=double(min(i1(i,j,:)));
        sp(i,j)=1-((3/sum)*mymin);
    end
end
    ans=zeros(siz(1),siz(2),1);
    so=max(sp(:));
%%%%%%%%%%%%%%%%
temp=zeros(winsize,winsize);
for i=1:winsize:siz(1)
    for j=1:winsize:siz(2)
        if i+winsize-1<siz(1)&& j+winsize-1<siz(2)
            for ii=0:winsize-1
                for jj=0:winsize-1
                    r=i1(i+ii,j+jj,1);
                    g=i1(i+ii,j+jj,2);
                    b=i1(i+ii,j+jj,3);
                    sum=double(r)+double(g)+double(b);
                    mymin=double(min(i1(i+ii,j+jj,:)));
                    temp(ii+1,jj+1)=1-((3/sum)*mymin);
                end
            end
            patspmax=max(temp(:));
            q=(so-patspmax)/so;
            ans(i:i+winsize,j:j+winsize)=q;
        end
    end
end