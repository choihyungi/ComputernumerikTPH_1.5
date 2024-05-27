function [arctans, ers] = fulltaylor_arctan(xs, ns)
    % selective taylorapproximation of arctan
    arctans = zeros(length(xs),1);
    ers = zeros(length(xs), 1);
    
    for k = 1 : length(xs)
        % selective x value
        o = xs(k);
        if abs(o) <= 1
            x = abs(o);
        else
            x = abs(1/o);
        end
        
        % Taylorapproximation
        arctan = 0;
        comp = atan(o);
        if(x<0.75)
            for i = ns(k) : (-1) : 0
                arctan = arctan + nterm_taylor0_arctan(x,i);
            end
        else
            delta = x - 1;
            for i = ns(k) : (-1) : 1
                arctan = arctan + nterm_taylor1_arctan(delta,i);
            end
            arctan = arctan + pi/4;
        end
        
        % range adjustments
        if abs(o) > 1
            arctan = pi/2 - arctan;
        end
        % sign adjustments
        if o < 0
            arctan = arctan * (-1);
        end

        % return
        arctans(k) = arctan;
        ers(k) = abs((arctan - comp)/comp);
    end
end