randn ('seed', 1);
A=randn(7);
b=randn(7,1);
Q = transpose(A)*A;
c = transpose(A)*b;

x = randn(7,1);
g = Q*x-c;
d = -g;
k = 0;
Ds = zeros(7);
while norm(g) >= 1e-6
    k = k + 1;
    Ds(:,k) = d;
    a = -transpose(g)*d/(transpose(d)*Q*d);
    x = x + a*d;
    g = Q*x-c;
    beta = -transpose(g)*Q*d/(transpose(d)*Q*d);
    d = -g + beta*d;
end
k
norm(A\b - x)
G = zeros(7);
for i = 1:7
    for j = 1:7
        G(i,j) = transpose(Ds(:,i))*Q*Ds(:,j);
    end
end
G