% Taylorreihe von arctan
function termN = nglied_taylor_arctan(x, n)
       term = 2*n + 1;
       termN = (-1)^n * x^term/term;
end