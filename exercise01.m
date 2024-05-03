clear all;
close all;

%5.1
%

%5.2
N = 10;
xmin = 0;
xmax = 0.9;

xs = xmin:xmax/N:xmax;
ys = zeros(length(xs), 1);
for k = 1:length(xs)
    x = xs(k);
    ys(k) = minimum_n(x);
end

figure
plot(xs, ys);