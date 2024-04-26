% Taylorreihe von arctan
function res = taylor_arctan(x, n)
    res = 0;
    for i = 0:n
       term = 2*i + 1;
       res = res + (-1)^i * x^term/term;
    end
end