% benötigte anzahl der iteration n für min Genauigkeit von 100 eps
function n = minimum_n(x)
    n = 0;
    rel_err = 1;
    comp = atan(x);
    while rel_err > 100*eps
        n = n + 1;
        arctan = taylor_arctan(x, n);
        rel_err = abs((arctan-comp) / comp);
    end
end