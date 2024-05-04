clear all;
close all;

N = 10;
xmin = 0;
xmax = 0.9;

%5.1

%5.2
xs2 = xmin:xmax/N:xmax;
ns2 = zeros(length(xs2), 1);
ers2 = zeros(length(xs2), 1);
for k2 = 1:length(xs2)
    x2 = xs2(k2);
    [ns2(k2), ers2(k2)] = minimum_n_taylor(x2);
end

figure
plot(xs2, ns2);

%5.3
xs3 = zeros(N, 1);  % x values
ns3_taylor = zeros(N, 1);  % n calculated from taylor
ns3_ana = zeros(N, 1);
ers3 = zeros(length(xs3), 1);
for k = 1:N
    x = xmax - 2^(-k);
    xs3(k) = x;
    [ns3_taylor(k), ers3(k)] = minimum_n_taylor(x);
    ns3_ana(k) = n_aus_verfahrensfehler(x);
end

figure
plot(xs3, ns3_taylor, xs3, ns3_ana);

%5.4
ys = zeros(N, 1);
for k = 1:N
    x = xs3(k);
    n = n_aus_verfahrensfehler(x);
    ys(k) = minimum_n_reversetaylor(x, n);
end

figure
plot(xs3, ys)


