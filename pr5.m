G = [0 1 0 1 1 0 0 1 1 1 0 0;
1 0 1 0 0 1 0 0 0 0 1 1;
0 1 0 1 0 0 0 0 0 1 0 0;
1 0 1 0 0 1 0 0 1 0 1 1;
1 0 0 0 0 1 0 0 1 0 1 1;
0 1 0 1 1 0 1 0 0 1 0 0;
0 0 0 0 0 1 0 0 0 0 1 1;
1 0 0 0 0 0 0 0 1 0 1 1;
1 0 0 1 1 0 0 1 0 0 0 0;
1 0 1 0 0 1 0 0 0 0 1 0;
0 1 0 1 1 0 1 1 0 1 0 0;
0 1 0 1 1 0 1 1 0 0 0 0];
n = 12;

% LP relaxation                                                                                                                                                                                       
cvx_begin
    variables x(n);
    maximize(sum(x));
    subject to
    x >= 0;
    x <= 1;
    for i = 1:n
        for j = (i+1):n
            x(i) + x(j) <= 2 - G(i,j)
        end
    end
cvx_end


% SDP relaxation

J = ones(n);
cvx_begin
variables X(n,n);
maximize(trace(J*X));
subject to
trace(X) == 1;
for i = 1:n
    for j = 1:n
        if G(i,j) == 1
           X(i,j) == 0;
        end
    end
end
X == semidefinite(n)
cvx_end
