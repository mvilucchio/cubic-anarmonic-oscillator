%this file implements the calculation of the elements by the WKB method
%where one evaluates the tuttneling coefficient

%print it in rationals (1)? print them (0)? don't print them (-1)? 
ra = -1;

%stampa il grafico
stampa = 0;

%ordine perturbativo a cui vogliamo calcolare la serie
n = 200;

%salvare il file
sa = 1;
loc = 'data/E_WKB.txt';

%number of digits of precision
dig = 2000;

digits(dig);

E_WKB = vpa(zeros(n+1, 1));
E_WKB(1) = vpa(0.5);

if sa ~= 0
    datafile = fopen(loc, 'w', 'n');
    fprintf(datafile, '%s\n', (E_WKB(1)));
end

for k=vpa(2:(n+1))
    fprintf('Calcolo Ordine #%d\n', k-1);
    
    E_WKB(k) = - vpa( sqrt(15/(2*pi^3)) ) .* vpa((15/8))^(k-1) .* ...
               gamma(vpa(k - 1 + 1/2));
    
    if sa ~= 0
        fprintf(datafile, '%s\n', (E_WKB(k)));
    end
end

if sa ~= 0
    fclose(datafile);
end

if(ra == 1)
    disp(rats(E_WKB));
elseif(ra == 0)
    disp(E_WKB);
end

if(stampa ~= 0)
    figure(1);
    plot(log(abs(E_WKB)), '.r');
    grid on, grid('minor');
    ylabel('log(|E_k|) '), xlabel('k'), title('E_k^0 perturbativo')
end