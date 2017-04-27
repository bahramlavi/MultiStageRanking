function [unlikeTemps,idx_for_next]=ComputeCriterion(scores,list_idx,exp_num_people, ip1)

if nargin<4
    ip1=0;
    ip2=0;
    
end

for i=1:exp_num_people
    a1=[];
    a1(1,:)=scores{i};
    a1(2,:)=list_idx{i};
    a1=sortrows(a1');a1=a1';
    idx_for_next{i}=a1(2,1:ip1);
    unlikeTemps{i}=a1(2,ip1+1:end);
end

end
