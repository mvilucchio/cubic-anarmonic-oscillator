%voglio applicare il metodo variazionale all'hamiltoniana dell'oscillatore
%armonico con perturbazione x^3. L'hamiltoniana completa è:
%H = p^2/2 + x^2/2 -gx^3/2

%parametro per cui minimizzare
syms alpha g

%dimnesioni da usare
n = 5;

a = zeros(n);
for i=1:n-1
    a(i,i+1) = sqrt(i);
end
adag = a';

x = (a + adag)./sqrt(2);
p = -(1i/sqrt(2)).*(a - adag);

H = (alpha^2)/2.*(p^2) + (1/(2*alpha^2)).*x^2 - (g/(2*alpha^3)).*x^3;

E = eig(H);

Emin = fminsearch(E, alpha);
