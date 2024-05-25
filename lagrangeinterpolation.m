function f = lagrangeinterpolation(xs)
    syms x;
    n = length(xs);
    ys = zeros(n,1);
    for i = 1 : n
        ys(i) = atan(xs(i));
    end
    Ls = sym(zeros(1,n));
    for i = 1 : n
        Ls(i) = 1;
        for j = [1:i-1, i+1:n]
            Ls(i) = Ls(i) * (x-xs(j))/(xs(i)-xs(j));
        end
    end
    disp("Ls, ok")
    p = Ls*ys;
    p = matlabFunction(p);
    f = p;
end
