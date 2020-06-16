
stampa = 0;

n = 150;

E_WKB = zeros(n+1, 1);
E_WKB(1) = 0.5;

for k=2:(n+1)
    E_WKB(k) = - sqrt(15/(2*pi^3)) .* (15/18)^(k-1) .* gamma(k - 1 + 1/2);
end

disp(E_WKB);

if(stampa ~= 0)
    figure(1);
    plot(log(abs(E_WKB)), '.r');
    grid on, grid('minor');
    ylabel('log(|E_k|) '), xlabel('k'), title('E_k^0 perturbativo')
end