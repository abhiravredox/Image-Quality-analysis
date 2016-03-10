% KURTOSIS is
% 4th central moment
% gamma=E((a^4))/E^2((a^2)) -3
function [out] = mistake(im, winsize)
    [gx, gy]=imgradientxy(im,'IntermediateDifference');
    gxcol=im2col(gx,[winsize,winsize]);
    gycol=im2col(gy,[winsize,winsize]);
%     gxcol=bsxfun(@rdivide,gxcol,sum(gxcol));
%     gycol=bsxfun(@rdivide,gycol,sum(gycol));
    %REASON TO NORMALIZE?
%     nx=mean(((bsxfun(@minus,gxcol,mean(gxcol))).^4));
%     ny=mean(((bsxfun(@minus,gycol,mean(gycol))).^4));
%     dx=mean((bsxfun(@minus,gxcol,mean(gxcol))).^2).^2;
%     dy=mean((bsxfun(@minus,gycol,mean(gycol))).^2).^2;
    nx=mean(gxcol.^4);
    ny=mean(gycol.^4);
    dx=std2(gxcol).^2;
    dy=std2(gycol).^2;

    gammax=(nx./dx); %%%%%% no -3 as our feature includes +3
    gammay=(ny./dy);
    [h,w]=size(im);
    outx=log(reshape(gammax,h-winsize+1,w-winsize+1));
    outy=log(reshape(gammay,h-winsize+1,w-winsize+1));
    out=min(outx,outy);
end
