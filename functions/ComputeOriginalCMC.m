% here compute the recognition rate for all the templates in the galley
% set to visiualize in the plot. This might be used for different stages
% such as first, second, ... , and last stage of the multi-stage system. 

function CMC=ComputeOriginalCMC(scorses,probIndx_allRuns,tempIndx_allRuns,n)

cmcs1 = zeros(n,10);

for rep=1:10    
    probIndx=probIndx_allRuns(:,rep);
    tempIndx=tempIndx_allRuns(:,rep);
    
    %First Stage-----------------------------------------------
    scores=zeros(n,n);
    scores(:,:)=scorses(probIndx,tempIndx');
    for i=1:n
        [B,idx]=sort(scores(i,:),'ascend');
        rank(i,1)=find(idx==i);        
    end
    for i=1:n
        cmcs1(i,rep) = length(find(rank<=i & rank>0))/n; 
    end 
    
end

CMC=(sum(cmcs1')./10)*100;
