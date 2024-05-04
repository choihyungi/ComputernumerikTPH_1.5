clear all;
close all;

%5.1

%5.2
N = 30;
xmin = 0;
xmax = 1;

xs = xmin:xmax/N:xmax;
ys = zeros(length(xs), 1);
for k = 1:length(xs)
    x = xs(k);
    ys(k) = minimum_n(x);
end

figure
plot(xs, ys);

%5.3
xs = zeros(N, 1);
ys = zeros(N, 1);
for k = 1:N
    x = 1 - 2^(-k);
    xs(k) = x;
    ys(k) = minimum_n(x);
end

figure
plot(xs, ys);


