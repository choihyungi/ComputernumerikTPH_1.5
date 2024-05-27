function arctan = nterm_taylor1_arctan(delta, k)
%{
Parameter:
    delta: delta between x and 1
    k: order of term
Return:
    k-th term of the Taylorsequence around 1
%}
    arctan = 2^(-k/2)*delta^k*sin(3*k*pi/4)/k;
end