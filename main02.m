clear variables;
close all;

%-----------------------------
% x Values
%-----------------------------
% Parameters
xpts = 100;
xmin = -10;
xmax = 10;

%xs = xvalues(xmax, kmax);
xs = linspace(xmin, xmax, xpts);

%-----------------------------
% minimum n Values to each x
%-----------------------------
[ns_num, ers_num] = n_numerical(xs);
[ns_ana, ers_ana] = n_analytical(xs);

ns = ns_num;        % n values with which we will work
ers_ns = ers_num;
ns = ns + 1;
disp('ns, ok')

% plot necessary n-terms
figure;
hold on;
plot(xs, ns, 'DisplayName', 'n values');
title('necessary n-terms for relative error < 100 eps');
xlabel('x');
ylabel('n(x)');
legend;
hold off;

%-----------------------------
% Taylorapproximation of arctan
%-----------------------------
[arctans, ers] = fulltaylor_arctan(xs, ns);

figure
    idx_strt = 1;
    idx_end = length(xs);
    
    hold on;
    plot(xs(idx_strt:idx_end), arctans(idx_strt:idx_end))
    
    title('Taylorapproximation of ArcTan');
    xlabel('x');
    ylabel('arctan(x)');
    hold off;

figure
    idx_strt = 1;
    idx_end = length(xs);
    
    hold on;
    plot(xs(idx_strt:idx_end), ers(idx_strt:idx_end), 'DisplayName','Taylorapproximation')
    %plot(xs(idx_strt:idx_end), ers_ns(idx_strt:idx_end), 'DisplayName','Verfahrensfehler')
    
    title('relative error of Taylorapproximation of ArcTan');
    xlabel('x');
    ylabel('relative error');
    legend;
    hold off;
