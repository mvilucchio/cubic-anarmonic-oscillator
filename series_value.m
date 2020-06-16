function val = series_value(x, a)
% series_value calculatetes the result of the sum of the power series in x
% with coefficients a.
%   x the point
%   a the coefficientes
tmp = 0;
for n=1:length(a)
    tmp = tmp + a(n).*(x.^n);
end

%maybe the iterate sum can be optimized wiht some matrix operators

val = tmp;
end