clear variables;
close all;

%-----------------------------
% x Values
%-----------------------------
% Parameters
kmax = 100;
xmin = -10;
xmax = 10;

%xs = xvalues(xmax, kmax);
xs = linspace(xmin, xmax, kmax);

%-----------------------------
% minimum n Values to each x
%-----------------------------
[ns_num, ers_num] = n_numerisch(xs);
[ns_ana, ers_ana] = n_analytisch(xs);

ns = ns_ana;
ns = ns + 1;
disp('ns, ok')

% plot necessary n-terms
figure;
hold on;
plot(xs, ns, 'DisplayName', 'n values');
title('necessary n-terms for relative error < 100 eps');
xlabel('x');
ylabel('n');
legend;
hold off;

%-----------------------------
% Taylorapproximation of arctan
%-----------------------------
[arctans, ers] = fulltaylor_arctan(xs, ns);

figure
hold on;
idx_strt = 1;
idx_end = kmax;
plot(xs(idx_strt:idx_end), arctans(idx_strt:idx_end))

title('Taylorapproximation of ArcTan');
xlabel('x');
ylabel('arctan');
hold off;

figure
hold on;
idx_strt = 1;
idx_end = kmax;
plot(xs(idx_strt:idx_end), ers(idx_strt:idx_end))

title('relative error of Taylorapproximation of ArcTan');
xlabel('x');
ylabel('relative error');
hold off;
