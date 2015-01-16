import numpy as np
import matplotlib.pyplot as plt

def pr1():
    # part (a)
    ts = np.array((0,1,2,3,4,5,6))
    ys = np.array((0,3,7,-1,0,5,10))
    Q = 2*np.array(((np.sum(np.power(ts,0)), np.sum(np.power(ts,1)), np.sum(np.power(ts,2)), np.sum(np.power(ts,3))),
                  (np.sum(np.power(ts,1)), np.sum(np.power(ts,2)), np.sum(np.power(ts,3)), np.sum(np.power(ts,4))),
                  (np.sum(np.power(ts,2)), np.sum(np.power(ts,3)), np.sum(np.power(ts,4)), np.sum(np.power(ts,5))),
                  (np.sum(np.power(ts,3)), np.sum(np.power(ts,4)), np.sum(np.power(ts,5)), np.sum(np.power(ts,6)))))
    b = 2*np.array(((np.sum(ys)),
                     (np.sum(ts*ys)), 
                     (np.sum(np.power(ts,2)*ys)),
                     (np.sum(np.power(ts,3)*ys))))
    x = np.zeros(4)
    iters = 0
    while np.linalg.norm(np.dot(Q,x) - b) >= 10e-5:
        alpha = np.dot(np.transpose(np.dot(Q,x) - b), np.dot(Q,x) - b)/np.dot(np.dot(np.transpose(np.dot(Q,x) - b), Q), np.dot(Q,x) - b)
        x = x - alpha*(np.dot(Q,x) - b)
        iters = iters + 1
    print x, iters
    f = np.zeros((7,4))
    for i in range(4):
        f[:,i] = np.power(ts, i)
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(ts, np.dot(f, x))
    ax.scatter(ts, ys)
    plt.show(fig)
    


if __name__=="__main__":
    pr1()
