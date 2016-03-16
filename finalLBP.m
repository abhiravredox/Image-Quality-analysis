function [lbpRowSum] = finalLBP(lbpImage,x,y)
%Only for 3X3 window.
        lbpRow1Sum=lbpImage{x-1,y-1}+lbpImage{x-1,y}+lbpImage{x-1,y+1};
        lbpRow2Sum=lbpImage{x,y-1}+lbpImage{x,y}+lbpImage{x,y+1};
        lbpRow3Sum=lbpImage{x+1,y-1}+lbpImage{x+1,y}+lbpImage{x+1,y+1};
        lbpRowSum=(lbpRow1Sum+lbpRow2Sum+lbpRow3Sum)';
end

