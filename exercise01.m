clear all;
close all;

% Parameters
kmax = 17;
xmin = 0.0;
xmax = 1;

% basic Values
xs = xvalues(xmax, kmax);
disp(xs);
ns_num = n_numerisch(xs);
disp("ns_num, ok");
ns_ana = n_analytisch(xs);
disp("ns_ana, ok");

% Taylor with given n values
[arctans, ers] = taylor_arctan(xs, ns_num);
% Taylor reverse
[rev_arctans, rev_ers] = reversetaylor_arctan(xs, ns_num);


figure
plot(xs, arctans, 'DisplayName', 'Arctan(x) via Taylor');
hold on;
plot(xs, rev_arctans, 'DisplayName', 'Arctan(x) via reverse Taylor');
hold off;
lgd = legend;

figure
plot(xs, ers, 'DisplayName', 'rel. Error via Taylor')
hold on;
plot(xs, rev_ers, 'DisplayName', 'rel. Error via reverse Taylor')
hold off;
lgd = legend

