function [arctans, ers] = taylor_arctan(xs, ns)
    % Taylorreihe von arctan
    arctans = zeros(length(xs),1);
    ers = zeros(length(xs), 1);
    for k = 1 : length(xs)
        x = xs(k);
        arctan = 0;
        comp = atan(x);
        for i = 0 : ns(k)
            arctan = arctan + nglied_taylor_arctan(x,i);
        end
        arctans(k) = arctan;
        ers(k) = abs(arctan - comp)/comp;
    end
end