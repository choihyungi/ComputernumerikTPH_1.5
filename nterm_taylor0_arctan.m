function termN = nterm_taylor0_arctan(x, n)
%{
Parameter:
    x: x value
    n: order of term
Return:
    n-th term of the Taylorsequence around 0
%}
    term = 2*n + 1;
    termN = (-1)^n * x^term/term;
end