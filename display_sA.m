function display_sA(sA)

% function display_sA(sA)
%
% sA = a binary matrix
% -> black squares are 1s
% -> white squares are 0s
% -> gray is for the diagonal, which is irrelevant
%
% last modified on may 18, 2020 (to lighten the middle gray and to make axes labels integers only)

% gray diagonal, 1s in black, 0s in white
A = sA - eye(size(sA,1)); % make diagonal -1

% colors, from lowest to highest values
cmap = [.8*[1 1 1]; 1 1 1; 0 0 0];
colormap(cmap);
imagesc(A)
title('adjacency mtx: black = 1, white = 0')

n=size(A,2);
if n<=20
    set(gca,'XTick',[1:n]); % to put tick marks on integers on x-axis
    set(gca,'YTick',[1:n]); % to put tick marks on integers on y-axis
else
    set(gca,'XTick',[]); % to remove tick marks on x-axis
    set(gca,'YTick',[]); % to remove tick marks on y-axis
end