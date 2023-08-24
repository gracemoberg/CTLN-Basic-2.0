function plot_soln(soln,proj,colors,middleflag,popflag,X0flag);

% function plot_soln(soln,proj,colors,middleflag,popflag,X0flag);
%
% soln = the structure which is the output of sA2soln or Wb2soln
% proj = nx2 matrix, each column a projection direction
% colors = matrix of RGB colors for neurons
% middleflag = 1 for plotting last node in graph in the middle, else ignore
% popflag = 1 for plotting total population activity, else ignore
% X0flag = 1 for including X0 in the subplot title, otherwise don't print
%
% calls functions: plot_graph.m, plot_projection.m,
%   plot_grayscale.m, plot_ratecurves.m, plot_colors.m
%
% modified May 20, 2017 to remove plotting Y 
%
% updated Aug 16, 2023 to handle if soln.X0 is a row vector, 
% and to include the default colors for graphs of size n<=5.  
% also, default set to not print X0.
%
% updated Aug 23, 2023 to change default colors to our new standard
% and to stop displaying the adjacency matrix; this can be displayed
% separately, if desired, using display_sA.m.

sA = soln.sA;
n = size(sA,1);

if nargin < 2 || isempty(proj)
    proj = rand(n,2); % pick 2 random directions
end;

if nargin < 3 || isempty(colors)
    colors = [0 .5 .7; .15 .6 0; .5 .5 .5; .8 .55 0; .8 0 0];
    if n > 5
        colors = lines(n);
    end
end

if nargin<4 || isempty(middleflag)
    middleflag = 0;
end;

if nargin<5 || isempty(popflag)
    popflag = 0;
end;

if nargin<6 || isempty(X0flag)
    X0flag = 0;
end;


% make figure............................................................
% make sure a new figure was initialized outside, like "figure(1)"

subplot(3,3,1); 
plot_graph(sA,colors,middleflag); % draw the graph

% display phase space projection, for each 1/4 of recording
interv = [0 .25;.25 .5;.5 .75;.75 1];
pl = [3 4 8 9];
for i=1:4
    subplot(8,5,pl(i))
    plot_projection(soln.X,proj,interv(i,:));
    title(['quarter ' int2str(i)])
end;

% define title strings
if size(soln.X0,1)>1
    X0=soln.X0';        % make sure that the X0 to be printed on the figure is a row vector
else
    X0=soln.X0;
end
titlestr1 = ['X0 = [' num2str(X0, '% 7.2f') ']'];
if ~isempty(soln.eps) % these fields are empty if Wb2soln was used
    titlestr2 = ['eps = ' num2str(soln.eps) ', delta = ' num2str(soln.delta)];
else
    titlestr2 = 'x_i(t) rate curves';
end;

% plot grayscale and ratecurves
subplot(3,10,11:19); plot_grayscale(soln.X); 
if X0flag
    xlabel(titlestr1);
end
subplot(3,10,21:29); plot_ratecurves(soln.X,soln.time,colors,titlestr2);

% plot total pop activity
if popflag
    Xtot = sum(soln.X,2);
    hold on; plot(soln.time,Xtot,'-k'); 
    ylim([min(soln.X(:)),1.05*max(Xtot)]); hold off;
end;

% plot colorbar for ratecurves
subplot(3,15,45); plot_colors(colors(1:n,:));