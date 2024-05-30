clear variables;
close all;
%{
Task:
focused primarily on Analysing Approximations in the interval [0, 1]
%}

%-----------------------------
% x Values
%-----------------------------
% Parameters
xpts = 19;
xmin = 0;
xmax = 1;

xs = xvalues(xmax, xpts);
%xs = linspace(xmin, xmax, xpts);

%-----------------------------
% minimum n terms for the Taylorapproximation via Verfahrensfehler
% to keep relative Error below 100 eps
%----------------------------
[ns_num, ers_num] = n_numerical(xs); % numerically
[ns_ana, ers_ana] = n_analytical(xs); % analytically

ns = ns_num;        % n values
ers_ns = ers_num;   % relative error according to Verfahrensfehler
disp('ns ok');


% plot n-terms
figure;
    idx_strt = 1;%fix(length(xs) * 0.5);
    idx_end = fix(length(xs)*0.4); % 1 for fullrange; 0.4 for relevant range
    
    hold on;
    plot(xs(idx_strt:idx_end), ns_num(idx_strt:idx_end), 'DisplayName', 'n-terms numerical');
    plot(xs(idx_strt:idx_end), ns_ana(idx_strt:idx_end), 'DisplayName', 'n-terms analytical');
    title('necessary n-terms for relative error < 100 eps');
    xlabel('x');
    ylabel('n(x)');
    legend;
    hold off;


%-----------------------------
% Taylorsequence around 0untitled
%-----------------------------
[arctans_taylor0, ers_taylor0] = taylor0_arctan(xs, ns);                 % Taylorapprox(0) normal direction
[rev_arctans_taylor0, rev_ers_taylor0] = reversetaylor0_arctan(xs, ns);  % Taylorapprox(0) reverse direction

%plot relative Error
figure
    idx_strt = 1; %fix(length(xs)*0.17);
    idx_end = fix(length(xs)*0.7); % relevant range 0.7
    
    hold on;
    plot(xs(idx_strt:idx_end), ers_ns(idx_strt:idx_end), 'DisplayName', 'prediction via Verfahrensfehler');
    plot(xs(idx_strt:idx_end), ers_taylor0(idx_strt:idx_end), 'DisplayName', 'normal direction');
    plot(xs(idx_strt:idx_end), rev_ers_taylor0(idx_strt:idx_end), 'DisplayName', 'reverse direction');
    
    title('relative error of Taylorapproximation(0) of ArcTan')
    xlabel('x');
    ylabel('relative error');
    legend;
    hold off;

%-----------------------------
% Taylorapprox around 1
%-----------------------------
[arctans_taylor1, ers_taylor1] = taylor1_arctan(xs, ns);                  % Taylorapprox(1) normal order
[rev_arctans_taylor1, rev_ers_taylor1] = reversetaylor1_arctan(xs, ns);   % Taylorapprox(1) reverse order

%plot relative Error to arctan(x)
figure
    idx_strt = fix(length(xs)*0.13); %fix(length(xs)*0.15) für relevante range
    idx_end = length(xs);
    
    hold on;
    %plot(xs(idx_strt:idx_end), ers_ns(idx_strt:idx_end), 'DisplayName', 'prediction via Verfahrensfehler');
    plot(xs(idx_strt:idx_end), ers_taylor1(idx_strt:idx_end), 'DisplayName', 'normal direction')
    plot(xs(idx_strt:idx_end), rev_ers_taylor1(idx_strt:idx_end), 'DisplayName', 'reverse direction')
    
    title('relative error of Taylorapproximation(1) of ArcTan');
    xlabel('x');
    ylabel('relative error');
    legend;
    hold off;

%-----------------------------
% Compare Taylorapprox(0) and Taylorapprox(1)
%-----------------------------

figure
    idx_strt = fix(length(xs)*0.15);
    idx_end = length(xs);
    
    hold on;
    plot(xs(idx_strt:idx_end), ers_ns(idx_strt:idx_end), 'DisplayName', 'prediction via Verfahrensfehler');
    plot(xs(idx_strt:idx_end), ers_taylor0(idx_strt:idx_end), 'DisplayName', 'Taylor(0) normal direction');
    plot(xs(idx_strt:idx_end), rev_ers_taylor0(idx_strt:idx_end), 'DisplayName', 'Taylor(0) reverse direction');
    plot(xs(idx_strt:idx_end), ers_taylor1(idx_strt:idx_end), 'DisplayName', 'Taylor(1) normal direction')
    plot(xs(idx_strt:idx_end), rev_ers_taylor1(idx_strt:idx_end), 'DisplayName', 'Taylor(1) reverse direction')
    
    title('relative error of both Taylorapproximations');
    xlabel('x');
    ylabel('relative error');
    legend;
    hold off;


%-----------------------------
% selective Taylorapprox
%-----------------------------
[arctans_taylor,ers_taylor] = fulltaylor_arctan(xs, ns);    % selective Taylorapprox(0 or 1), reverse order

%-----------------------------
% Lagrangeapprox
%-----------------------------
refmin = 0;
refmax = 1;
refpts1 = 20;   % max approximation at 20, rel 0.3
refs1 = linspace(refmin, refmax, refpts1);
refpts2 = 36;   % min 36 to be comparable to taylor
refs2 = chebishevnodes(refpts2);

[arctans4, ers4] = lagrangeapprox(xs, refs1);
[arctans5, ers5] = lagrangeapprox(xs, refs2);

figure
    idx_strt = 1;
    idx_end = fix(length(xs)*1); % 0.5 for rel
    
    hold on;
    plot(xs(idx_strt:idx_end), ers_taylor(idx_strt:idx_end), "DisplayName", 'selective Taylorapproximation')
    plot(xs(idx_strt:idx_end), ers4(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation equidistant ref points')
    plot(xs(idx_strt:idx_end), ers5(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation Chebishev ref points')
    
    title('relative error of different Approximations of arctan');
    xlabel('x');
    ylabel('relative error');
    legend;
    hold off;
%{
figure
    idx_strt = 1;
    idx_end = length(xs);
    
    hold on;
    plot(xs(idx_strt:idx_end), arctans_taylor(idx_strt:idx_end), "DisplayName", 'selective Taylorapproximation')
    plot(xs(idx_strt:idx_end), arctans4(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation equidistant ref points')
    plot(xs(idx_strt:idx_end), arctans5(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation Chebishev ref points')
    
    title('arctan of different Approximations');
    xlabel('x');
    ylabel('arctan(x)');
    legend;
    hold off;
%}