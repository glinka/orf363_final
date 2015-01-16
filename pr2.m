cvx_begin
    variables a b c
    maximize(c)
    subject to
        [1, -.5, a, 0.1; -.5, 1, b, c; a, b, 1, -.3; .1, c, -.3, 1] == semidefinite(4);
cvx_end