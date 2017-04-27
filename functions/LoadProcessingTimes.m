% load the pre-computed processing time for different descriptors.

switch desc_name
    case 'SDALF'
        t_1st=1.6;
        t_2nd=2.08;
        t_org=9.44;
    case 'gBiCov'
        t_1st=0.0015;
        t_2nd=0.0057;
        t_org=0.04;
    case'LOMO'
        t_1st=0.0017;
        t_2nd=0.0023;
        t_org=0.037;
    case 'MCM'
        t_1st=0.051;
        t_2nd=0.06;
        t_org=27.4;
end