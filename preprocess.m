function [col,final]=preprocess(img)
%Makes input image properties easier for later processing.
%'Col' is colored and 'final' is grayscale with proper sizes.
    [x,y,z]=size(img);
    if z==3
        gray=rgb2gray(img);
    end
    if x>1000 || y>1000
        final=imresize(gray,1000/max([x,y]));
        col=imresize(img,1000/max([x,y]));
        final=im2double(final);
        col=im2double(col);
    else
        final=im2double(gray);
        col=im2double(img);
    end
    
end

