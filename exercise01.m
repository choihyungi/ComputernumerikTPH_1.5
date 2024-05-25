clear variables;
close all;

%-----------------------------
% x Values
%-----------------------------
% Parameters
kmax = 18;
xmin = 0;
xmax = 1;

%xs = xvalues(xmax, kmax);
xs = linspace(xmin, xmax, kmax);

%-----------------------------
% minimum n Values to each x
%-----------------------------
%ns_num = n_numerisch(xs);
%disp("ns_num, ok");
ns_ana = n_analytisch(xs);
disp("ns_ana, ok");

ns = ns_ana;

% plot necessary n-terms
figure;
hold on;
plot(xs, ns, 'DisplayName', 'n-terms');
title('necessary n-terms for relative error < 100 eps');
xlabel('x');
ylabel('n');
legend;
hold off;

%-----------------------------
% Taylorsequence around 0
%-----------------------------
% normal direction
[arctans0, ers0] = taylor_arctan(xs, ns);
% reverse direction
[rev_arctans0, rev_ers0] = reversetaylor_arctan(xs, ns);

%plot relative Error
figure
hold on;
idx_strt = 1;
idx_end = fix(kmax*0.9);
plot(xs(idx_strt:idx_end), ers0(idx_strt:idx_end), 'DisplayName', 'normal direction');
plot(xs(idx_strt:idx_end), rev_ers0(idx_strt:idx_end), 'DisplayName', 'reverse direction');

title('relative error of Taylorapproximation(0) of ArcTan')
xlabel('x');
ylabel('relative error');
legend;
hold off;

%-----------------------------
% Taylorapprox around 1
%-----------------------------
% Delta Approx 
[arctans1, ers1] = delta_arctan(xs, ns);
% reverse Delta Approx
[rev_arctans1, rev_ers1] = reversedelta_arctan(xs, ns);

%plot relative Error to arctan(x)
figure
hold on;
idx_strt = fix(kmax*0.7);
idx_end = kmax;
plot(xs(idx_strt:idx_end), ers1(idx_strt:idx_end), 'DisplayName', 'normal direction')
plot(xs(idx_strt:idx_end), rev_ers1(idx_strt:idx_end), 'DisplayName', 'reverse direction')

title('relative error of Taylorapproximation(1) of ArcTan');
xlabel('x');
ylabel('relative error');
legend;
hold off;
