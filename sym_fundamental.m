%l'hamiltoniana che uso per fare i conti è
% H = p^2/2 + x^2/2 - gx^3/2

n = 400; %ordine a cui voglio calcolare la perturbazione

%save the file
sa = 1;
loc = 'data/E_PERT_WORST.txt';

E = sym( zeros(1, n+1).' );
E(1) = sym(1/2);

%salvo le perturbazioni in delle matrici scritte secondo la base di H0
pert = cell(1, n+1);
pert{1} = sym( (zeros(1,3*n+6)).');
pert{1}(1) = sym(1);

%il propagatore che si ottiene è proiettato sul complementare allo stato
%iniziale
G = sym( zeros(3*n+6) );
for i=2:(3*n+6)
    G(i,i) = sym( -1/(i-1) );
end

a = sym( zeros(3*n+6) );
for i=1:3*n+6-1
    a(i,i+1) = sqrt(sym(i));
end
adag = a';

%dove è necessario ricordarsi della normalizzazione del potenziale e che è
%nella forma (x^3)/2
V = (adag^3 + a^3 + 3.*( (adag^2)*a + adag*(a^2) + a + adag ))./...
    (2*sqrt(2)^3);

if sa == 1
    datafile = fopen(loc, 'w', 'n');
    fprintf(datafile, '%s\n', E(1));
end

%in questo ciclo l'ordine perturbativo che sto calcolando è (i+1)
for i=1:n
    fprintf('Calculation #%d term\n', i);
    
    E(i+1) = pert{1}'*V*(pert{i});
    
    if sa == 1
        fprintf(datafile, '%s\n', E(i+1));
    end
    
    tmp = zeros(1,3*n+6).';
    for j=2:i
        tmp = tmp + E(i+1-j+1).*G*pert{j};
    end
    pert{i+1} = G*V*pert{i} - tmp;
end
if sa == 1
    fclose(datafile);
end

disp(E);