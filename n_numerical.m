function [ns, ers] = n_numerical(xs)
%{
Parameter:
    array of x values
Todo:
    determine n values numerically
Return:
    [array, array]
    1st array: n-values to each x
    2nd array: relative error to each x from Verfahrensfehler
%}
    vmax = length(xs);
    ns = zeros(vmax, 1);    % array of n values
    ers = zeros(vmax, 1);   % array of relative errors
    for k = 1 : vmax
        er = 1;
        o = xs(k);
        if abs(o)<=1
            x = abs(o);
        else
            x = abs(1/o);
        end
        n = -1;
        comp = atan(x);
        if comp == 0
            n = 0;
        else
            while er > 100*eps
                n = n+1;
                er = (x^(2*n+3)/(2*n+3))/comp;
                er = abs(er);
            end
        end
        ns(k) = n;
        ers(k) = er;
    end
end