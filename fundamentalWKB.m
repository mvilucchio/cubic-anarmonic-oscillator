%l'hamiltoniana che uso è sempre la medesima
% H = p^2/2 + x^2/2 - gx^3/2
%in questo caso si tratta di calcolare l'integrale in modo numerico e
%vedere se torna con quanto abbiamo fatto con la serie perturbativa

syms g real

%metà dell'ordine a cui viene calcolat la serie perturbativa (testato fino 
%a 100)
n = 10;

%valore del parametro perturbativo
% g = 0.0010;

% points = vpasolve(x^2 - g*x^3 -1 == 0, x);
% a = points(2);
% b = points(3);

% sigma = vpaintegral(sqrt(x^2 - g*x^3 - 1), x, a, b);
% 
% Gamma = vpa(exp(-2*sigma)/(4*pi));

% E2 = (2/(8*pi))*integral( exp(-2*sigma(g)) , g, 0, Inf);

% E = zeros(2*n+1, 1);
% E(1) = 1;
% 
% for i=1:n
%     E(2*i+1) = vpa(Gamma/(2*pi)*vpaintegral(x^(n), x, 0, Inf));
% end

vpaintegral(exp(-sigma(g)), g, 1e-20, 0.01);