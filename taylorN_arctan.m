% Taylorreihe von arctan
function termN = taylorN_arctan(x, n)
       term = 2*n + 1;
       termN = (-1)^n * x^term/term;
end