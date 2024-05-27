function [arctans, ers] = taylor0_arctan(xs, ns)
%{
Parameter:
    xs: array of x values
    ns: array of n values
Todo:
    1.) approximate arctan(x) via Taylorsequence(0) in normal order
    2.) calculate relative error of that approximation
Return:
    [array01, array02]
    array01: array of arctan(x) to each x
    array02: array of relative errors to each x
%}
    arctans = zeros(length(xs),1);  % array of arctan(x)
    ers = zeros(length(xs), 1);     % arrax of relative errors
    for k = 1 : length(xs)
        x = xs(k);
        arctan = 0;
        comp = atan(x);
        for i = 0 : ns(k)
            arctan = arctan + nterm_taylor0_arctan(x,i);
        end
        arctans(k) = arctan;
        ers(k) = abs((arctan - comp)/comp);
    end
end