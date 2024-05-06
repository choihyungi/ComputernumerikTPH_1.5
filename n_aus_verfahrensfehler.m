% n aus Verfahrensfehler
% |arctan(x) - taylorreihe(arctan(x))| <= x^(2n+3)/(2n+3)
function [n, rel_err] = n_aus_verfahrensfehler(x)
    n = log(100*eps/(1+x^2)) / (2*log(x)) - 1;
    comp = atan(x);
    arctan = 0;
    for i = 0:n
        arctan = arctan + nglied_taylor_arctan(x, n);
    end
    rel_err = abs((arctan-comp) / comp);
end