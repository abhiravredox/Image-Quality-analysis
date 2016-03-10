close all; clear all; clc;

in=input('Enter name of the image (in single quotes): ');
img=imread(in);
[col,img]=preprocess(img);  %read explanation of 'preprocess()'.
figure,imshow(col);

[rows,cols]=size(img);

patchsize=11;
req=(patchsize+1)/2;    %few required. because few values in FT can be ignored.

%% generating cartesian coordinates and converting to polar.
r=1:req; c=1:req;
[x,y]=meshgrid(r,c);

[~,rho]=cart2pol(x,y);  %conversion.
rho=round(rho); 

%% Getting slope at each pixel.
alpha=[];
for j=1:cols-patchsize
    for i=1:rows-patchsize
        block=img(i:i+patchsize-1,j:j+patchsize-1);
        block=block/max(block(:));
        ft=abs(fft2(block)); %fourier transform.
        %for power spectrum we need square of fft and only first few terms have
        %considerable effect.
        psp=ft(1:req,1:req).^2/(req^2); %/normalize.
        sf=zeros(1,max(rho(:))); %it will contain data at each distance...
        ...value corresponding to 'dist' polar coordinates.
    
        for k=1:max(rho(:))
            sf(k)=sum(psp(rho==k));
        end
        sf=log(sf);
        boundedIdx= ~(isnan(sf)+isinf(sf)); 
        alpha=[alpha,sum(sf(boundedIdx))];
    end
end

alpha=reshape(alpha,[rows-patchsize,cols-patchsize]);

alpha=abs(alpha);
figure,imshow(alpha/max(alpha(:)));
