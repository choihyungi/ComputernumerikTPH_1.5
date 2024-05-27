function [ns, ers] = n_analytical(xs)
%{
Parameter:
    array of x values
Todo:
    calculate n values analytically
Return:
    [array, array]
    1st array: n-values to each x
    2nd array: relative error to each x from Verfahrensfehler
%}
    vmax = length(xs);
    ns = zeros(vmax,1);     % array of n values
    ers = zeros(vmax,1);    % array of relative errors
    for k = 1 : vmax
        o = xs(k);
        if abs(o) <= 1
            x = abs(o);
        else
            x = abs(1/o);
        end
        comp = atan(x);
        n = log(100*eps/(1+x^2)) / (2*log(x)) - 1;
        er = (x^(2*n+3)/(2*n+3))/comp;
        
        ers(k) = abs(er);
        ns(k) = fix(n);
    end
end