function xs = xvalues(xmax, kmax)
    xs = zeros(kmax, 1);
    for k = 1 : kmax
        x = xmax - 2^(-k);
        xs(k) = x;
    end
end