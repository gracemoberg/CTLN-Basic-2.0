function sA = make_cyclic_union(graphs)

% function sA = make_cyclic_union(graphs)
%
% takes a cell array of graphs, where graphs{i} is an sA matrix, 
% and returns the full sA matrix for the cyclic union
%
% rewritten on Aug 23, 2023 by CC to simplify code

% first, determine the index sets tau_1,...,tau_N for the 
% N graphs in the cyclic union

N = length(graphs);
tau = cell(N,1); % tau{i} will be the index set tau_i
start_idx = 0;
for i = 1:N
    N_i = size(graphs{i},1); % number of neurons in i-th subgraph
    tau{i} = start_idx + [1:N_i];
    start_idx = start_idx + N_i; % update start_idx
end
n = start_idx; % final start_idx is the total number of nodes n

% next, (i) initialize full nxn cyclic union sA matrix, 
% (ii) insert each of the graphs as a block on the diagonal, and
% (iii) add forward edges from tau_i to tau_{i+1}, mod N

sA = zeros(n);
for i = 1:N
    sA(tau{i},tau{i}) = graphs{i}; % insert i-th graph
    sA(tau{modn(i+1,N)},tau{i}) = 1; % connect tau_i -> tau_{i+1}
end

% note that modn(i+1,N) = i+1 for i=1:N-1, but modn(N+1,N) = 1.