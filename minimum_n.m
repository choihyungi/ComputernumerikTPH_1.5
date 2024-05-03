% benötigte anzahl der iteration n für min Genauigkeit von 100 eps
function n = minimum_n(x)
    n = 0;
    rel_err = 1;
    comp = atan(x);
    %comp = exp(x);
    arctan = 0;
    while rel_err > 100*eps

        arctan = arctan + taylor_arctan(x, n);
        rel_err = abs((arctan-comp) / comp);
        if mod(n, 10000000) == 0
            disp(n);
            disp(rel_err);
        end
        n = n + 1;
    end
end
