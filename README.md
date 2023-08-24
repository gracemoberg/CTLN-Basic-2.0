# CTLN Basic 2.0

This is a package of Matlab code to run simulations for the CTLN model introduced in the paper:

Diversity of emergent dynamics in competitive threshold-linear networks.
Katherine Morrison, Anda Degeratu, Vladimir Itskov, Carina Curto.  
Available at https://arxiv.org/abs/1605.04463

This is a bare bones package to run simple simulations and make plots using the CTLN model. 
All figures from the above paper (version 3+) can be reproduced using this code.

The code was written by Carina Curto and Katherine Morrison, and packaged together on August 23, 2023.

CTLN Basic 2.0 may be considered an update to the previous packages in 
github.com/nebneuron: CTLN and CTLN-bookchapter.

SUMMARY OF THE CODE:

1. The sA matrix:
The basic input object that defines a CTLN model is an nxn matrix "sA", 
which is the adjacency matrix for a simple directed graph on n nodes (neurons).  
sA should be a binary matrix with zeros on the diagonal.  
Our convention (due to the form of the ODEs) is that sA(i,j) = 1 iff j --> i in the graph. 
sA is thus the transpose of the usual adjacency matrix.

2. Basic computing and plotting routines:
Simulations of CTLN dynamics are performed by the function sA2soln.m, which returns a "soln" structure.  
The results are plotted using the function plot_soln.m, using "soln" as input.

3. run_CTLN_model_script.m:
This is a sample executable that allows you to enter any sA matrix, and then simulate 
the corresponding CTLN model with a choice of parameters and initial conditions. 
The script uses sA2soln.m and plot_soln.m.

4. All graphs, parameters, and initial conditions for recreating the figures in the 
CTLN paper "Diversity of emergent dynamics..." (see above) 
are available in scripts within the 'examples' subfolder.

5. run_CTLN_example_script.m:
This executable file loads data from the example scripts, and then implements commands
to simulate and plot the corresponding CTLN dynamics shown in each figure of the paper.

6. make_my_sA_script.m:
This script illustrates how to use all the additional functions provided for generating 
structured sA matrices.  In particular, the script generates sA matrices of any size for 
cliques, cycles, cyclically symmetric graphs, cyclic unions, and random directed graphs.

7. The other functions are 
        a) display_sA.m, to make a grayscale image of the adjacency matrix
	b) plotting routines called by plot_soln.m: 
	    plot_colors.m, plot_graph.m, plot_grayscale.m, plot_projection.m, plot_ratecurves.m
	c) functions used in the simulations, called by sA2soln.m: 
	    graph2net.m, threshlin_ode.m
	d) functions for analyzing the fixed points of a CTLN: 
	    sA2fixpts.m, check_fixedpt.m, check_stability.m

This README file was created on August 24, 2023, as part of the original commit to
the CTLN-Basic-2.0 repository.
