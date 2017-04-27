LoadProcessingTimes;

time_org=exp_num_people*t_org;

if num_stages==2
    r=(t_2nd*exp_num_people)+(t_org*tmp_num_last);
else
    r=(t_1st*exp_num_people)+(t_2nd*tmp_num_stage)+(t_org*tmp_num_last);
end

ratio=r/time_org;
