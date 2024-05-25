function xs = chebishevnodes(n)
    xs = zeros(n, 1);
    for i = 0 : (n-1)
        x = cos((2*i + 1)/(2*n)*pi);
        xs(i+1) = x;
    end
end