% benötigte anzahl der iteration n für min Genauigkeit von 100 eps
function [n, rel_err] = minimum_n_taylor(x)
    n = 0;
    rel_err = 1;
    comp = atan(x);
    arctan = 0;
    while rel_err > 100*eps
        arctan = arctan + nglied_taylor_arctan(x, n);
        rel_err = abs((arctan-comp) / comp);
        n = n + 1;
    end
    n = n - 1;
    disp(x);
    disp(n);
    disp(rel_err);
end
