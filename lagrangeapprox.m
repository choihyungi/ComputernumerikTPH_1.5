function [arctans, ers] = lagrangeapprox(xs, refs)
    max = length(xs);
    arctans = zeros(max,1);
    ers = zeros(max,1);
    p = lagrangepolynom(refs);
    
    for i = 1 : max
        x = xs(i);
        arctan = p(x);
        comp = atan(x);
        er = abs(arctan - comp)/comp;
     
        arctans(i) = arctan;
        ers(i) = er;
    end
end