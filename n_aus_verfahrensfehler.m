% n aus Verfahrensfehler
% |arctan(x) - taylorreihe(arctan(x))| <= x^(2n+3)/(2n+3)
function n = n_aus_verfahrensfehler(x)
    n = log(100*eps/(1+x^2)) / (2*log(x)) - 1;
    comp = atan(x);
    
end