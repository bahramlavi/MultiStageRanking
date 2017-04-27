%%%%%%%%%%%%
% (c) Copyright 2015-2016 PRA Lab - Pattern Recognitions and Applications Lab,
% University of Cagliari. Bahram Lavi <lavi.bahram@diee.unica.it>
% Source code is available at:
% 
%%%%%%%%%%%%%

* Introduction:

This code is this directory provides the implementation of the multi-stage 
ranking system from our paper 'A Multi-Stage Ranking Approach for Fast 
Person Re-Identification'. This code implements *only* the multi-stage system
and not features extraction and neither obtaining the simplified versions
of any given descriptor. In the 'data/' directory we provide also, as example,
the pre-computed matching scores for SDALF descriptor on VIPeR, i-LIDS, and ETHZ1 data sets. 

If one interested in use of different descriptors(e.g. gBiCov, LOMO, and MCM), 
the matching scores might be already computed for all the available templates 
in the gallery set for each simplified version, and stated the MAT file in 
the 'data/' directory. Then, the corresponding 'MAT' file name might be 
specified in 'Load_Scores.m' to be loaded for use of the multi-stage system. 

* Running the code:

To run the code you might run 'MainMS.m' at this directory. You may simply
initialize the parameters by yourself such as: the descriptor, data set, 
and number stages.
This code only implemented for two- and three-stage systems so far. 

* CMC curves in our paper:

Also, the figures presented in our paper can be found in 'CMC_cuves/' directory.
 
* Troubleshooting:

If you have any problem or find a bug mail <lavi.bahram@diee.unica.it>.

