% benötigte anzahl der iteration n für min Genauigkeit von 100 eps
function rel_err = minimum_n_reversetaylor(x, n)
    i = n;
    comp = atan(x);
    arctan = 0;
    while i >= 0
        arctan = arctan + nglied_taylor_arctan(x, i);
        i = i - 1;
    end
    rel_err = abs((arctan-comp) / comp);
end
