% make_my_sA_script
%
% This is a script showing how to use pre-built functions to construct
% sA matrices for graphs with certain common structures. 
% 
% Recall that in an sA adjacency matrix, the entry 
% sA(i,j) = 1 if j -> i, and sA(i,j) = 0 if j -X-> i.
%
% created Aug 23, 2023 by KM and CC


% Initialize a cell array that will store all five of
% the sA adjacency matrices created below
sAcell=cell(5,1);    


% To generate a clique, use make_clique.m:
n = 10;         % number of neurons
sAcell{1} = make_clique(n);


% To generate a cycle 1->2 ... ->n->1, use make_cycle.m:
n = 10;         % number of neurons
sAcell{2} = make_cycle(n);


% To generate a cyclically symmetric graph where each node sends edges
% forward to the next k nodes mod n (i.e. node i sends edges 
% to i+1, ..., i+k mod n), use make_kcyclic_graph.m:

n = 10;         % number of neurons
k = 3;            % number of outgoing edges to neighboring nodes
sAcell{3} = make_kcyclic_graph(n,k);


% To generate a cyclic union of component subgraphs tau_1 ... tau_N:
%
% A cyclic union has all edges forward from nodes in tau_i to tau_{i+1}
% (cyclically identifying tau_N with tau+0) and no other nodes between
% components

% First, create a cell array of the component subgraphs with indices
% tau_1 ... tau_N, listed in cyclic order:  
graphs{1} = 0;                  % the first component is a singleton
graphs{2} = make_cycle(3);      % the second component is a 3-cycle
graphs{3} = make_clique(2);     % the third component is a 2-clique

% Next, create the cyclic union using make_cyclic_union.m:
sAcell{4} = make_cyclic_union(graphs);


% To generate a random oriented graph:
n = 10;         % number of neurons
deg = 3;          % average out-degree of each node 
                % (note that this equals the average in-degree as well)

% if oriented_flag is set to 1, this makes the graph oriented 
% to allow bidirectional edges, set to oriented_flag to 0
oriented_flag = 1;      

% if set to 1, this ensures that the graph does *not* contain sinks
% to allow sinks, set no_sinks_flag to 0
no_sinks_flag = 1;      

% Finally, create a random oriented graph with no sinks
sAcell{5} = randDigraph(n,deg,oriented_flag,no_sinks_flag);


% ______________________________________________________

% Use the command below to select a particular sA matrix
sA = sAcell{4};

% Plot the graph of the chosen sA matrix with plot_graph.m:
figure(1);
subplot(1,2,1)
plot_graph(sA);

% Display the adjacency matrix sA with display_sA.m:
subplot(1,2,2)
display_sA(sA);

% Plot all five graphs
figure(2)
for i=1:5
    subplot(2,3,i)
    plot_graph(sAcell{i})
    title(['graph ' int2str(i)])
end

% Display adjacency matrices for all five graphs
figure(3)
for i=1:5
    subplot(2,3,i)
    display_sA(sAcell{i})
    title(['graph ' int2str(i)])
end