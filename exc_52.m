function [xs, ns, ers] = exc_52(xmin, xmax, N)
    xs = xmin:xmax/N:xmax;
    ns = zeros(length(xs), 1);
    ers = zeros(length(xs), 1);

    for k = 1:length(xs)
        x = xs(k);
        [ns(k), ers(k)] = minimum_n_taylor(x);
    end
end