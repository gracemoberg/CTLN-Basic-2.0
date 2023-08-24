% run_CTLN_example_script
%
% script to run examples from the figures in the CTLN paper:
% "Diversity of emergent dynamics in competitive threshold-linear networks"
% available at: https://arxiv.org/abs/1605.04463
%
% created Aug 16, 2023 by KM
% updated on Aug 23, 2023 by CC to list examples 
% matching each figure in the CTLN paper

clear all

% first, uncomment *one* line below to run the file with the data 
% for the example of interest - CTLN paper figure is indicated for each.

% run('examples/CTLN_example_0_3cycle.m')             % Fig 1C
% run('examples/CTLN_example_1_n25_quasiperiodic.m')  % Fig 2C
% run('examples/CTLN_example_2_deg_matched_A.m')      % Fig 3A
% run('examples/CTLN_example_3_deg_matched_B.m')      % Fig 3B
% run('examples/CTLN_example_4_deg_matched_C.m')      % Fig 3C
% run('examples/CTLN_example_5_baby_chaos.m')         % Fig 3D
% run('examples/CTLN_example_6_n9_coexistence.m')     % Fig 4
% run('examples/CTLN_example_7_old_n7_sequence.m')    % Fig 5
 run('examples/CTLN_example_8_gaudi.m')              % Fig 6
% run('examples/CTLN_example_9_7star_quasiperiodic.m') % Fig 7
% run('examples/CTLN_example_10_n7_rhythm.m')         % Fig 8
% run('examples/CTLN_example_11_gallop_trot.m')       % Fig 10
% run('examples/CTLN_example_12_cell_assembly_chain.m') % Fig 11A
% run('examples/CTLN_example_13_5star_chain.m')      % Fig 11B
% run('examples/CTLN_example_14_quasiperiodic_3cycles.m') % Fig 12
% run('examples/CTLN_example_15_phone_number.m')      % Fig 13


% second, select the initial conditions X0.
% by default, X0 = X0cell{1}; if there are multiple stored initial
% conditions, you can access them by setting X0 = X0cell{2}, etc.
X0 = X0cell{1};

% next, solve ODEs for CTLN (solution is returned in "soln" struct)
soln = sA2soln(sA,T,X0,e,d,theta);

% finally, plot the results of the simulation
figure(1)
plot_soln(soln,proj,colors);

% display the sA matrix
figure(2)
display_sA(sA);