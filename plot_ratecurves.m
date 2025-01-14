function plot_ratecurves(X,time,colors,titlestr)

% function plot_ratecurves(X,time,colors,titlestr)
%
% X = solution matrix, like soln.X from output of threshlin_ode.m.
% time = times accompanying X, like soln.time from output threshlin_ode.m.
% colors = matrix of colors for the line plots.
%
% updated jan 6, 2021 to change default colors

n = size(X,2); % no. of neurons

if nargin < 3 || isempty(colors)
    colors = [0 .5 .7; .15 .6 0; .5 .5 .5; .8 .55 0; .8 0 0];
    if n > 5
        colors = lines(n);
    end
end

if nargin<4 || isempty(titlestr)
    titlestr = '';
end;



M = mean(X); % calculate mean of each column ?> to be used to determine which to label?


labels = {};
incLines = zeros(1,n);
h = gobjects(1,n);
included = gobjects(0);
for i=1:n
    h(i) = plot(time,X(:,i),'-','color',colors(i,:),'LineWidth',1.5);
%     disp(h(i))
%     labelpoints(time(i), X(i,i), i);
    if (M(i)>0.05)
        labels{i} = int2str(i);
        incLines(i) = i;
    else
        labels{i}='--';
    end
    hold on
end;
% disp(h(1))
% disp(incLines)
% k = incLines;
% class(k)
% class(h)
% size(k)
% size(h)
% included = h(k);
% disp(included)
% disp(incLines)
% class(incLines)
% disp(labels)
legend(labels)

xlabel('time')
ylabel('firing rate')
title(titlestr);
hold off