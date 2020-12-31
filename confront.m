%this script is made to confront the two results for the perturbative
%approach and the WKB approach
clear variables; clc;

%do you want to save it?
sa = 1;

WKB_loc = 'data/E_WKB.txt';
PERT_loc = 'data/E_PERT_WORST.txt';

%number of digits
dig = 2000;
digits(dig);

fidP = fopen(PERT_loc,'r');
P = [];
tmp = fgetl(fidP);
while tmp ~= -1
%     P = [P, vpa(tmp)];
    if contains(tmp, '/')
%         TMP = sscanf(tmp, '%d/%d');
        P = [P, vpa(tmp)];
%     else
%         TMP = sscanf(tmp, '%d');
%         P = [P, vpa(TMP)];
    end
    tmp = fgetl(fidP);
end
fclose(fidP);

fidW = fopen(WKB_loc,'r');
W = [];
tmp = fgetl(fidW);
while tmp ~= -1
    W = [W, vpa(tmp)];
    tmp = fgetl(fidW);
end
fclose(fidW);

disp(P);
disp(W);

%creating a mask for the array
m = zeros(1, length(P));
for i=1:length(P) + 1
    if rem(i, 3) == 0
        m(i) = 1;
    end
end

P_m = P .* m;

n = 0:200;
A = (-1).*double(P./W) + 1;

n = n(3:end);
A = A(3:end);

figure(1);
plot(n, A);

% figure(1);
% hold on;
% plot(log(abs(W)), 'c-', 'LineWidth', 1, 'DisplayName', 'WKB');
% plot(log(abs(P_m)), 'r.', 'MarkerSize', 8, 'DisplayName', 'Perturbativo');
% lgn = legend; set(lgn, 'location', 'best');
% grid on, grid('minor');
% ylabel('log(|E_k|) '), xlabel('k');
% xlim([-1 201]);
% title('Perturbative Coefficients');
% 
% if sa == 1
%     print(gcf, 'graphs/perturbative_coeff_confront.png', '-dpng', ...
%         '-r300');
% end
% 
% pause(3);
% 
% %print it black
% set(gcf, 'Color', [18/255 18/255 18/255]);
% ax = gca;
% set(ax, 'Color', [18/255 18/255 18/255]);
% ax.XAxis.Color = [208/255 208/255 208/255]; ax.YAxis.Color = [208/255 208/255 208/255];
% set(lgn, 'Color', [208/255 208/255 208/255]);
% title('Perturbative Coefficients', 'Color', [208/255 208/255 208/255]);
% % ax.GridColorMode = 'manual'; ax.GridColorMode = 'manual';
% % ax.GridColor = [208/255 208/255 208/255]; ax.MinorGridColor = [208/255 208/255 208/255];
% 
% set(gcf, 'InvertHardcopy', 'off');
% 
% if sa == 1
%     print(gcf, 'graphs/black_perturbative_coeff_confront.png', '-dpng', ...
%         '-r175');
% end
% 
% figure(2);
% hold on;
% plot(vpa(W./W), 'c-', 'LineWidth', 1, 'DisplayName', 'WKB');
% plot(vpa(P./W), 'r.', 'MarkerSize', 8, 'DisplayName', 'Perturbative');
% grid on, grid('minor');
% ylabel('N_k^0 / A_k^0'), xlabel('k');
% xlim([-1 201]);
% title('Perturbative Coefficients');
% 
% if sa == 1
%     print(gcf, 'graphs/perturbative_coeff_rapport.png', '-dpng', ...
%         '-r300');
% end
% 
% pause(3);
% 
% %print it black
% set(gcf, 'Color', [18/255 18/255 18/255]);
% ax = gca;
% set(ax, 'Color', [18/255 18/255 18/255]);
% set(ax.XAxis, 'Color', [208/255 208/255 208/255]);
% set(ax.YAxis, 'Color', [208/255 208/255 208/255]);
% title('Perturbative Coefficients', 'Color', [208/255 208/255 208/255]);
% % ax.GridColorMode = 'manual'; ax.GridColorMode = 'manual';
% % ax.GridColor = [208/255 208/255 208/255]; ax.MinorGridColor = [208/255 208/255 208/255];
% set(gcf, 'InvertHardcopy', 'off');
% 
% if sa == 1
%     print(gcf, 'graphs/black_perturbative_coeff_rapport.png', '-dpng', ...
%         '-r175');
% end
% 
