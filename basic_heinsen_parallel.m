% This is a naive implementation of the Heisen parallel algorithm for
% positive sequence
clf

a = ones(1, 100);
b = ones(1, 100) * 0.1;

x = 1;
figure(1)
title('Recurrent Computation')
axis([0 100 0 20])
hold on
for t = 1:100
    x = a(t)*x + b(t);
    scatter(t, x)
    hold on
    pause(0.1)
end
hold off

%% parallel computation
a_star = cumsum(log(a));
b_star = cumsum(exp(log(b) - a_star));

figure(2)
title('Parallel Computation')
axis([0 100 0 20])
x0 = 1;
x = exp(a_star + log(x0 + b_star));
hold on
scatter(1:100, x)
hold off


    