% load the pre-computed scores for all the descriptors and datasets
% intialized at the begining of MainMS.m

function [scr_1st,scr_2nd,scr_org]=Load_Scores(desc_name,ds_name)

switch desc_name
    case 'MCM'
        switch ds_name
            case 'VIPeR'
                load('./Data/MCM_VIPeR_sccores.mat');
                scr_1st=MCM_VIPeR_1st;
                scr_2nd=MCM_VIPeR_2nd;
                scr_org=MCM_VIPeR_org;
            case 'i-LIDS'
                load('./Data/MCM_ilids_sccores.mat');
                scr_1st=MCM_ilids_1st;
                scr_2nd=MCM_ilids_2nd;
                scr_org=MCM_ilids_org;
            case 'ETHZ1'
                load('./Data/MCM_ETHZ1_scores.mat');
                scr_1st=MCM_ETHZ1_1st;
                scr_2nd=MCM_ETHZ1_2nd;
                scr_org=MCM_ETHZ1_org;                
        end
    case 'LOMO'
        switch ds_name
            case 'VIPeR'
                load('./Data/LOMO_VIPeR_scores.mat');
                scr_1st=LOMO_VIPeR_1st;
                scr_2nd=LOMO_VIPeR_2nd;
                scr_org=LOMO_VIPeR_org;
            case 'i-LIDS'
                load('./Data/LOMO_ilids_scores.mat');
                scr_1st=LOMO_ilids_1st;
                scr_2nd=LOMO_ilids_2nd;
                scr_org=LOMO_ilids_org;
            case 'ETHZ1'
                load('./Data/LOMO_ETHZ1_scores.mat')
                scr_1st=LOMO_ETHZ1_1st;
                scr_2nd=LOMO_ETHZ1_2nd;
                scr_org=LOMO_ETHZ1_org;
        end        
        
    case 'gBiCov'
        switch ds_name
            case 'VIPeR'
                load('./Data/gBiCov_VIPeR_scores.mat')
                scr_1st=gBiCov_VIPeR_1st;
                scr_2nd=gBiCov_VIPeR_2nd;
                scr_org=gBiCov_VIPeR_org;
            case 'i-LIDS'
                load('./Data/gBiCov_ilids_scores.mat')
                scr_1st=gBiCov_ilids_1st;
                scr_2nd=gBiCov_ilids_2nd;
                scr_org=gBiCov_ilids_org;
            case 'ETHZ1'
                load('./Data/gBiCov_ETHZ1_scores.mat');
                scr_1st=gBiCov_ETHZ1_1st;
                scr_2nd=gBiCov_ETHZ1_2nd;
                scr_org=gBiCov_ETHZ1_org;
        end        
        
    case 'SDALF'
        switch ds_name
            case 'VIPeR'
                load('./Data/SDALF_VIPeR_scores.mat')
                scr_1st=SDALF_VIPeR_1st;
                scr_2nd=SDALF_VIPeR_2nd;
                scr_org=SDALF_VIPeR_org;
            case 'i-LIDS'
                load('./Data/SDALF_ilids_scores.mat')
                scr_1st=SDALF_ilids_1st;
                scr_2nd=SDALF_ilids_2nd;
                scr_org=SDALF_ilids_org;
            case 'ETHZ1'
                load('./Data/SDALF_ETHZ1_scores.mat')
                scr_1st=SDALF_ETHZ1_1st;
                scr_2nd=SDALF_ETHZ1_2nd;
                scr_org=SDALF_ETHZ1_org;
        end        
        
end
                    
        
end
    