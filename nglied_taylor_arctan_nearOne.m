function arctan = nglied_taylor_arctan_nearOne(delta, k)
    arctan = 2^(-k/2)*delta^k*sin(3*k*pi/4)/k;
end