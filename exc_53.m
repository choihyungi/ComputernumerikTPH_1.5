function [xs, ns_taylor, ns_ana, ers_taylor, ers_ana] = exc_53(xmax, N)
    xs = zeros(N, 1);           % x values
    ns_taylor = zeros(N, 1);    % n values recurved from taylor
    ns_ana = zeros(N, 1);       % n values calculated from Verfahrensfehlerungleichung
    ers_taylor = zeros(length(xs), 1);
    ers_ana = zeros(length(xs), 1);
    for k = 1:N
        x = xmax - 2^(-k);
        xs(k) = x;
        [ns_taylor(k), ers_taylor(k)] = minimum_n_taylor(x);
        [ns_ana(k), ers_ana(k)] = n_aus_verfahrensfehler(x);
    end    
end