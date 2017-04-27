% computes the number of templates withing the different stages with
% respect to the application requirment t_{max}.

function [n2,n3]=Find_num_templs_stages(exp_num_people,exRatio,t_2nd,t_org)

    poly_r=max(roots([t_org t_2nd -exRatio]));
    
    n2=floor(poly_r*exp_num_people)
    n3=floor(poly_r*n2)
    