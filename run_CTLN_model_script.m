% run_CTLN_model_script
%
% calls: sA2soln.m, plot_soln.m
%
% updated May 22, 2016 for CTLN-basic package
% last updated Aug 23, 2023 for CTLN Basic 2.0

% STEP 1. Input any n x n adjacency matrix, called sA.
% Note: if i->j, then sA(j,i) = 1.
sA=[0 0 1; 1 0 0; 0 1 0]; % directed cycle 123

% To create other sA matrices, see make_my_sA_script.m 
% or run pre-made examples with run_CTLN_example_script.m

% STEP 2. Simulate dynamics for the corresponding threshlin network model

% simulation parameters
n = size(sA,1); % number of neurons
T = 100; % simulation time length, in units of membrane timescale
e = .25; % epsilon value (default is .25)
d = .5; % delta value (default is 2*e = .5)
theta = 1; % theta value

% solve ODEs (solution is returned in "soln" struct)
X0 = .1*rand(n,1); % initial conditions!
soln = sA2soln(sA,T,X0,e,d,theta);

% STEP 3. Plot the results!

% pick projection directions (they get normalized later)
proj = []; % to use defaults

% plot adjacency matrix and solution!
plot_soln(soln,proj);