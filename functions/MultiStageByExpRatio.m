% this is the main file which computes the multi-stage system for different
% values of application requirments. This also runs the experiments in 10
% times for each specific determined t_{max}.


LoadProcessingTimes;


ratios=[0.3 0.4 0.5]; % for computing the t_{max}, which known as \beta in the paper. 

time_org=exp_num_people*t_org;

for ratio=1:3
    disp(['Ratio=' num2str(ratios(ratio))])
    if num_stages==2
        n3=round(((time_org * ratios(ratio))-(exp_num_people*t_2nd))/(t_org));  % eq. 9  
    else
        v1=(ratios(ratio)*t_org)-t_1st;
        [n2,n3]=Find_num_templs_stages(exp_num_people,v1,t_2nd,t_org); % eq. 7 and eq. 10
    end

    if n3 < 0
        disp(['Not possible for the ratio of ' num2str(ratios(ratio))])
        break;
    end


    %% Evaluating eigther two- or three-stage. 

    for rep = 1:10
        %disp(['Run=' num2str(rep)])

        probIndx=probIndx_allRuns(:,rep);
        tempIndx=tempIndx_allRuns(:,rep);

        idx_for_next=repmat({1:exp_num_people},exp_num_people,1);
        unlikeTemps1st={};
        unlikeTemps2nd={};
        scores = {};

        % First Stage of our proposed approach, if we evaluate for three-stage
        if num_stages==3
            scores={};
            for p=1:exp_num_people
                scores{p}(1,:) = scr_1st(probIndx(p),tempIndx);        
            end
            [unlikeTemps1st,idx_for_next]=ComputeCriterion(scores,idx_for_next,exp_num_people,n2);

        else
            unlikeTemps1st={};
        end


        % Second Stage of three-stage systme. And first stage of two-stage.
        scores = {};
        rank=[];
        for p=1:exp_num_people
            scores{p}(1,:) = scr_2nd(probIndx(p),tempIndx(idx_for_next{p}));        
        end
        [unlikeTemps2nd,idx_for_next]=ComputeCriterion(scores,idx_for_next,exp_num_people,n3);


        % Last stage
        rank=[];
        scores={};
        for p=1:exp_num_people
            scores{p}(1,:) = scr_org(probIndx(p),tempIndx(idx_for_next{p}));        
        end

        a1=[];rank=[];tempRank=[];
        for i=1:exp_num_people
            a1=[];
            a1(1,:)=scores{i};
            a1(2,:)=idx_for_next{i};
            a1=sortrows(a1');a1=a1';
            if num_stages==3
                tempRank=[a1(2,:) unlikeTemps2nd{i}(1,:) unlikeTemps1st{i}(1,:)];
            else
                tempRank=[a1(2,:) unlikeTemps2nd{i}(1,:)];
            end
            rank(i,1)=find(tempRank==i);

        end
        for i=1:exp_num_people
            cmcs3(i,rep) = length(find(rank<=i & rank>0))/exp_num_people; 
        end

    end

    CMC3(:,ratio)=(sum(cmcs3')./10)*100;

end


if num_stages==3
    plotPR_3S
else
    plotPR_2S
end