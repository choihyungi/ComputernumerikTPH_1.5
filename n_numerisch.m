function [ns, ers] = n_numerisch(xs)
    % pure Verfahrensfehler
    % Rechenfehler ignoriert
    vmax = length(xs);
    ns = zeros(vmax, 1);
    ers = zeros(vmax, 1);
    for k = 1 : vmax
        er = 1;
        o = xs(k);
        if abs(o)<=1
            x = abs(o);
        else
            x = abs(1/o);
        end
        n = -1;
        real = atan(x);
        if real == 0
            n = 0;
        else
            while er > 100*eps
                n = n+1;
                er = (x^(2*n+3)/(2*n+3))/real;
            end
        end
        ns(k) = n;
        ers(k) = er;
    end
end