function outputArg1 = sigma(g)
%SIGMA calculates the sigma WKB coefficient for the potential
%   Detailed explanation goes here

if g==vpa(0) || g==0
    sigma = vpa(0.0);
else
    syms x real

    points = vpasolve(1 - x^2 + g*x^3 == 0, x);
    a = points(end-1);
    b = points(end);

    B = @(x) sqrt(x^2 - g*x^3 - 1);

    sigma = vpaintegral(B, a, b);
end
outputArg1 = sigma;
end

