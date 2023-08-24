function j=modn(i,n)

% function j=modn(i,n)
% converts from 0 to n-1 for typical mod n to instead using 1 to n 


if mod(i,n)==0
    j=n;
else
    j=mod(i,n);
end
