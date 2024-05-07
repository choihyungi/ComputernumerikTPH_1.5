function [xs, ns, ers] = exc_54(xs, N)
    ers = zeros(N, 1);
    ns = zeros(N, 1);
    for k = 1:N
        x = xs(k);
        n = n_aus_verfahrensfehler(x);
        ns(k) = n;
        ers(k) = minimum_n_reversetaylor(x, n);
    end
end