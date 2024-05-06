clear all;
close all;

N = 100;
xmin = 0;
xmax = 0.99;

%5.1

%5.2
[xs2, ns2, ers2] = exc_52(xmin, xmax, N);

figure
plot(xs2, ns2, 'DisplayName', 'n < 100eps via Taylor');

%5.3
[xs3, ns3_taylor, ns3_ana, ers3_taylor, ers3_ana]= exc_53(xmax, N);

figure
plot(xs3, ns3_taylor, 'DisplayName','n < 100eps via taylor');
hold on;
plot(xs3, ns3_ana, 'DisplayName', 'n calculated from Verfahrensfehler');
hold off;
lgd = legend;

%5.4
[xs4, ns4_ana, ers4] = exc_54(xs3, N);

figure
plot(xs4, ers4, "DisplayName", "error reverse");
hold on;
plot(xs3, ers3_taylor, "DisplayName", "error normal taylor < 100esp");
plot(xs3, ers3_ana, "DisplayName", "error normal n from Verfahrensfehler")
hold off;
lgd = legend;

%5.5



