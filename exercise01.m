clear variables;
close all;

%-----------------------------
% x Values
%-----------------------------
% Parameters
kmax = 18;
xmin = 0;
xmax = 1;

xs = xvalues(xmax, kmax);
%xs = linspace(xmin, xmax, 5);

%-----------------------------
% minimum n Values to each x
%-----------------------------
ns_num = n_numerisch(xs);
disp("ns_num, ok");
ns_ana = n_analytisch(xs);
disp("ns_ana, ok");

% plot necessary n-terms
figure;
hold on;
plot(xs, ns_num, 'DisplayName', 'n-terms numerical');
plot(xs, ns_ana, 'DisplayName', 'n-terms analytical');
title('necessary n-terms for relative error < 100 eps');
xlabel('x');
ylabel('n');
legend;
hold off;

%-----------------------------
% Taylorsequence around 0
%-----------------------------
% normal direction
[arctans_num, ers_num] = taylor_arctan(xs, ns_num);
[arctans_ana, ers_ana] = taylor_arctan(xs, ns_ana);
% reverse direction
[rev_arctans_num, rev_ers_num] = reversetaylor_arctan(xs, ns_num);
[rev_arctans_ana, rev_ers_ana] = reversetaylor_arctan(xs, ns_ana);

%plot relative Error
figure
hold on;
plot(xs, ers_num, 'DisplayName', 'normal Taylor, numeric n values');
plot(xs, rev_ers_num, 'DisplayName', 'reverse Taylor, numerisch');
%plot(xs, ers_ana, 'DisplayName', 'rel. Error via Taylor analytisch');
%plot(xs, rev_ers_ana, 'DisplayName', 'rel. Error via reverse Taylor
%analytisch');

title('relative error of Taylorapproximation(0) of ArcTan')
xlabel('x');
ylabel('relative error');
legend;
hold off;

%-----------------------------
% Taylorapprox around 1
%-----------------------------
% Delta Approx 
[arctans_delta, ers_delta] = delta_arctan(xs, ns_num);
% reverse Delta Approx
[rev_arctans_delta, rev_ers_delta] = reversedelta_arctan(xs, ns_num);

%plot relative Error to arctan(x)
figure
hold on;
%plot(xs, ers_num, 'DisplayName', 'rel. Error via Taylor numerisch');
%plot(xs, rev_ers_num, 'DisplayName', 'rel. Error via reverse Taylor numerisch');
plot(xs, ers_delta, 'DisplayName', 'rel. Error via Taylor(1)');
plot(xs, rev_ers_delta, 'DisplayName', 'rel. Error via reverse Taylor(1)');
%plot(xs, ers_ana, 'DisplayName', 'rel. Error via Taylor analytisch');
%plot(xs, rev_ers_ana, 'DisplayName', 'rel. Error via reverse Taylor
%analytisch');

title('relative error to arctan(x)')
xlabel('x');
ylabel('relative error');
legend;
hold off;

















%{
% plot arctan(x)
figure;
hold on;
plot(xs, arctans_num, 'DisplayName', 'Arctan(x) via Taylor numerisch');
plot(xs, rev_arctans_num, 'DisplayName', 'Arctan(x) via reverse Taylor numerisch');
plot(xs, arctans_delta, 'DisplayName', 'rel. Error via Taylor around 1');
%plot(xs, arctans_ana, 'DisplayName', 'Arctan(x) via Taylor analytisch');
%plot(xs, rev_arctans_ana, 'DisplayName', 'Arctan(x) via reverse Taylor analytisch');
title('arctan(x)');
xlabel('x');
ylabel('arctan(x)');
legend;
hold off;
%}

