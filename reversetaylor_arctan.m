function [arctans, ers] = reversetaylor_arctan(xs, ns)
    % Taylorapproximation of arctan around 0 in reverse
    arctans = zeros(length(xs),1);
    ers = zeros(length(xs), 1);
    for k = 1 : length(xs)
        x = xs(k);
        arctan = 0;
        comp = atan(x);
        for i = ns(k) : (-1) : 0
            arctan = arctan + nglied_taylor_arctan(x,i);
        end
        arctans(k) = arctan;
        ers(k) = abs(arctan - comp)/comp;
    end
end