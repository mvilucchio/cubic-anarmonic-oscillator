%questo script serve per confrontare i due metodi sullo stesso grafico

clear all; clc;

better_fundamental;
paffuti_metodo;

figure(1);
hold on;
plot(log(abs(E_WKB)), 'bo', 'DisplayName', 'WKB');
plot(log(abs(E_PERT)), 'ro', 'DisplayName', 'Perturbativo');
lgn = legend; set(lgn, 'location', 'best');
grid on, grid('minor');
ylabel('log(|E_k|) '), xlabel('k'), title('E_k^0')
