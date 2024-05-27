function xs = chebishevnodes(n)
    xs = zeros(n, 1);
    for i = 0 : (n-1)
        x = cos(i/(n-1)*pi);
        xs(i+1) = x;
    end
end