function F = innerF(y,k)
    
    g_max = double(sqrt(4/27));
    
    if y == 0
        F = 0;
    elseif  y >= g_max
        F = exp(-2)./(y.^(2.*k+1));
    else
        syms x real
        
        points = solve(1 - x.^2 + y.*x.^3 == 0, x);
        b = double(points(end));
        a = double(points(end-1));
        
        fun = @(x) sqrt(x.^2 - y.*x.^3 - 1);
        
        F = exp(-2.*integral(fun, a, b))./(y.^(2.*k+1));
    end
end