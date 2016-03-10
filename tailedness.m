% ?B ? ?1G(?B|?1, ?1) + ?2G(?B|?2, ?2),
% a Gaussian mixture model
% ie summation of 2 gaussian weighted with their initial probabilities is
% the required fn
% variance will be larger for sharp part (choosen as feature )
function [out] = tailedness(im, winsize)
[gx, gy]=imgradientxy(im,'IntermediateDifference');
gradmag=sqrt((gx.^2)+(gy.^2));
gradcol=im2col(gradmag,[winsize,winsize]);
mean0grad=[gradcol;-gradcol]; %2 parameters eleminated
siz=size(mean0grad);
len=siz(2);
out=size(1,len);
parfor i=1:len
%     %%%%%%%%%%%%%%%
%     [var1, var2] = EM_GMM_2(mean0grad(:,i));
    val=mean0grad(:,i);
    var1=0.5;
    var2=0.0001;
    pi=0.5;
    ln=length(val);
    chkdiff=2*pi;
    j=0;
    while (abs(chkdiff-pi)/chkdiff > 1e-3 && j < 100)
        j=j+1;
        chkdiff=pi;
        tmp=val.*val;
        expected=pi*exp(-(tmp)/(2*var2))/sqrt(2*pi*var2);
        ratio=expected./((1-pi)*exp(-(tmp)/(2*var1))/sqrt(2*pi*var1)+expected);
        var1=(1-ratio)'*(tmp)/sum(1-ratio);
        var2=ratio'*(tmp)/sum(ratio);
        pi = sum(ratio)/ln;
    end
    %%%%%%%%%%%%%%%
    stddiv1=sqrt(var1);
    stddiv2=sqrt(var2);
    out(i)=max(stddiv1,stddiv2);
end
[h,w]=size(im);
out=reshape(out,h-winsize+1,w-winsize+1);
end


