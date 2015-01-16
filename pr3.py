import numpy as np

def pr3():
    C = np.array(((0.1, 0, 0.15, 0.15),
                 (0.15, 0.12, 0, 0),
                 (0.1, 0, 0.2, 0.15),
                 (0, 0, 0.2, 0.1)))
    I = np.identity(4)
    Q = C - I
    demand = np.array((20, 10, 2, 5))
    x = np.random.randn(4)
    fp = lambda x: np.dot(Q, x) + demand
    g = fp(x)
    d = -g
    while np.linalg.norm(g) > 1e-15:
        alpha = -np.dot(np.transpose(g), d)/np.dot(np.transpose(d), np.dot(Q, d))
        x = x + alpha*d
        g = fp(x)
        beta = np.dot(np.transpose(g), np.dot(Q, d))/np.dot(np.transpose(d), np.dot(Q, d))
        d = -g + beta*d
    print x

if __name__=='__main__':
    pr3()
