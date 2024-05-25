function [arctans, ers] = reversedelta_arctan(xs, ns)
    % Taylorapproximation of arctan around 1 in reverse
    arctans = zeros(length(xs),1);
    ers = zeros(length(xs), 1);
    for k = 1 : length(xs)
        x = xs(k);
        delta = x - 1;
        arctan = 0;
        comp = atan(x);
        for i = ns(k) : (-1) : 1
            arctan = arctan + nglied_taylor_arctan_nearOne(delta,i);
        end
        arctan = arctan + pi/4;
        arctans(k) = arctan;
        ers(k) = abs(arctan - comp)/comp;
    end
end