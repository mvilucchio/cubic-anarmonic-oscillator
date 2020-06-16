%l'hamiltoniana che uso per fare i conti è
% H = p^2/2 + x^2/2 - gx^3/2
%questa tecnica perturbativa si basa sull'utilizzo esplicito della forma
%della funzione d'onda

%cambia il valore se si vuole mostrare la figura dei coefficienti
stampa = 0;

%stampa i valori razionali o no
ra = 1;

%ordine perturbativo che si vuole calcolare
n = 10;

%valore del parametro perturbativo
g = 0.0010;

%pexr implementare questo metodo perturbativo creo delle matrici che saranno
%è sempre A(riga, colonna) = A(pert. order, coefficiente pol.)

%siccome i coefficicenti per A(k,j) = 0 per j > 3k faccio l'array di zeri
%un po' più grande, due termini in più dovrebbero bastare
A = zeros(n+1, 3*(n+1));
A(1,1) = 1;

%creo anche l'array riga della serie dell'energia
E_PERT = zeros(n+1, 1);
E_PERT(1) = 1;

%l'indice k è l'indice dell'ordine che stiamo calcolando
for k=2:(n+1)
    %la somma dello stesso ordine perturbativo (k) parte dai coefficienti
    %del polinomio di ordine più alto (l=3k, 3k-1, 3k-2, ... 1) shiftati
    %per MatLab
    
    %la l, ovvero le potenze di x, partono dalla potenza zero
    for l=(3*(k-1)+1):-1:2
        tmp = 0;
        
        %non c'è necessità di mettere il +1 perchè k è gia in formato
        %MatLab compatibile
        for s=2:(k-1)
            tmp = tmp + E_PERT(s)*A(k-s+1,l);
        end
        
        if l>3
            A(k,l) = 1/(2*(l-1))*( (l+2-1)*(l+1-1)*A(k,l+2) ...
                - A(k-1,l-3) + tmp);
        else
            A(k,l) = 1/(2*(l-1))*( (l+2-1)*(l+1-1)*A(k,l+2) ...
                + tmp); 
        end
        
    end
    
    E_PERT(k) = -2*A(k,2+1);
end

E_PERT = E_PERT./2;


if ra == 0
    disp(E_PERT);
else
    disp(rats(E_PERT));
end


if(stampa ~= 0)
    figure(1);
    plot(log(abs(E_PERT)), '.r');
    grid on, grid('minor');
    ylabel('log(|E_k|) '), xlabel('k'), title('E_k^0 perturbativo')
end
