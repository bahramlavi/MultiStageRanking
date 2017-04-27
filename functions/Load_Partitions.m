% This function load the same images of SDALF paper for 10 runs of
% experiments.

function [probIndex,tempIndex]=Load_Partitions(ds_name, exp_num_people)

switch ds_name
            case 'VIPeR'
                load('./Data/LoadViperIds.mat');
                fid = fopen('./Data/VIPeR_sets.txt');
                data = textscan(fid,'%*s %*s cam_a/%d_%*s %*[^\n]', 'commentStyle', '%');
                fclose(fid);
                partitions = reshape(data{1}, 316 , 10); % 10 sets of 316 (over 632) subjects
                all_indexs=unique(data{1});
                for rep=1:10
                    rand_indexes_10runs(rep,:)=randsample(all_indexs,exp_num_people);
                    rand_indexes_10runs(rep,:)=find(ismember(ids,  rand_indexes_10runs(rep,:)) > 0);
                    probIndex(:,rep)=rand_indexes_10runs(rep,:);
                    tempIndex(:,rep)=rand_indexes_10runs(rep,:);
                end

            case 'i-LIDS'
                load('./Data/indexes_iLIDS.mat')
                for rep=1:10
                    [S1,S2] = ExtractDataset(dset);
                    probIndex(:,rep)=S1(1:exp_num_people);
                    tempIndex(:,rep)=S2(1:exp_num_people);
                end
            case 'ETHZ1'
                tmp_idx=reshape(1:830,83,10);
                
                for rep=1:10
                    probIndex(:,rep)=1:exp_num_people;
                    tempIndex(:,rep)=tmp_idx(1:exp_num_people,rep);
                end
        end
