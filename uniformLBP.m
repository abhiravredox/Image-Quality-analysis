function [ulbp] = uniformLBP(lbp)
%Continuos pattern of 1's or else one category of random.
        lbp=lbp';
        total0s=sum(lbp==0);
        total1s=sum(lbp==1);
        max0s=max(diff([0 (find(~(lbp==0))) numel(lbp)+1])-1);
        max1s=max(diff([0 (find(~(lbp==1))) numel(lbp)+1])-1);
        if total0s==max0s
            ulbp=[ones(total1s,1);zeros(total0s,1)];
        elseif total1s==max1s
            ulbp=[ones(total1s,1);zeros(total0s,1)];
        else
            ulbp=[2;2;2;2;2;2;2;2];
        end
end

