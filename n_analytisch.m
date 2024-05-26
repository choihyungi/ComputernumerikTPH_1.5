function [ns, ers] = n_analytisch(xs)
    % n analytisch
    % |arctan(x) - taylorreihe(arctan(x))| <= x^(2n+3)/(2n+3)
    vmax = length(xs);
    ns = zeros(vmax,1);
    ers = zeros(vmax,1);
    for k = 1 : vmax
        o = xs(k);
        if abs(o) <= 1
            x = abs(o);
        else
            x = abs(1/o);
        end
        exact = atan(x);
        n = log(100*eps/(1+x^2)) / (2*log(x)) - 1;
        er = (x^(2*n+3)/(2*n+3))/exact;
        
        ers(k) = er;
        ns(k) = fix(n);
    end
end