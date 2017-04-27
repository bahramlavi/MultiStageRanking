% A Multi-Stage Ranking Approach for Fast Person Re-Identification
% Bahram Lavi
% lavi.bahram@diee.unica.it

clear all
close all
clc

addpath('./functions/')
%% Intializing the parameters
ds_name         =   'VIPeR'; % VIPeR, i-LIDS, ETHZ1
desc_name       =   'SDALF'; % SDALF, gBiCov, LOMO, MCM

num_stages      =   3;      % only implemented for 2 or 3 stages, for now!
exp_num_people  =   316;    % for VIPeR=316, i-LIDS=119, and ETHZ1=83


%% Loading scores and corresponding template/probe indexes for 10runs of experiments.
[scr_1st,scr_2nd,scr_org]=Load_Scores(desc_name,ds_name);
[probIndx_allRuns,tempIndx_allRuns]= Load_Partitions(ds_name,exp_num_people);

%% Computeing the original re-id for each stage separately. 
CMC1_org=ComputeOriginalCMC(scr_1st,probIndx_allRuns,tempIndx_allRuns,exp_num_people);
CMC2_org=ComputeOriginalCMC(scr_2nd,probIndx_allRuns,tempIndx_allRuns,exp_num_people);
CMC3_org=ComputeOriginalCMC(scr_org,probIndx_allRuns,tempIndx_allRuns,exp_num_people);

%% Multi-Stage system

MultiStageByExpRatio;
     