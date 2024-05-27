function [arctans, ers] = reversetaylor1_arctan(xs, ns)
%{
Parameter:
    xs: array of x values
    ns: array of n values
Todo:
    1.) approximate arctan(x) via Taylorsequence(1) in reverse order
    2.) calculate relative error of that approximation
Return:
    [array01, array02]
    array01: array of arctan(x) to each x
    array02: array of relative errors to each x
%}
    arctans = zeros(length(xs),1);  % array of arctan(x)
    ers = zeros(length(xs), 1);     % array of relative errors
    for k = 1 : length(xs)
        x = xs(k);
        delta = x - 1;
        arctan = 0;
        comp = atan(x);
        for i = ns(k) : (-1) : 1
            arctan = arctan + nterm_taylor1_arctan(delta,i);
        end
        arctan = arctan + pi/4;
        arctans(k) = arctan;
        ers(k) = abs((arctan - comp)/comp);
    end
end