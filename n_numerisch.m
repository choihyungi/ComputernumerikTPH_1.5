function ns = n_numerisch(xs)
    % pure Verfahrensfehler
    % Rechenfehler ignoriert
    ns = zeros(length(xs), 1);
    for k = 1 : length(xs)
        res = 1;
        x = xs(k);
        n = -1;
        real = atan(x);
        while res > 100*eps
            n = n+1;
            res = x^(2*n+3)/(2*n+3)*real;
        end
        ns(k) = n;
    end
end