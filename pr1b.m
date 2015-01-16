t = [0,1,2,3,4,5,6];
y = [0,3,7,-1,0,5,10];

f = zeros(7,4);
for i = 1:4
    f(:,i) = power(t, i-1);
end

% 1a, from python output
c = [6.76054667e-05;   6.94034253e+00;  -3.35709199e+00;   4.16661510e-01];

hold on;
plot(t, f*c, 'c');

% 1b
cvx_begin
    variables a(7) c(4)
    minimize(sum(a))
    subject to
       for i = 1:7
           a(i) >= c(1) + t(i)*c(2) + t(i)^2*c(3) + t(i)^3*c(4) - y(i);
           a(i) >= -(c(1) + t(i)*c(2) + t(i)^2*c(3) + t(i)^3*c(4) - y(i));
       end
cvx_end

plot(t, f*c, 'r');

% 1c
cvx_begin
    variables a c(4)
    minimize(a)
    subject to
       for i = 1:7
           a >= c(1) + t(i)*c(2) + t(i)^2*c(3) + t(i)^3*c(4) - y(i);
           a >= -(c(1) + t(i)*c(2) + t(i)^2*c(3) + t(i)^3*c(4) - y(i));
       end
cvx_end


plot(t, f*c, 'g');
scatter(t, y);
legend('1a', '1b', '1c', 'data')
