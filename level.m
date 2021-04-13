function hprime=level(t, h)
global qin
global qout
global Ao
global g
global At
global hmin
global hmax
global qmax
global qmin

h = min(hmax,max(hmin, h));
qout = Ao*sqrt(2 * g * h);
qin = min(qmax,max(qmin, qin));
hprime=(qin-qout)/At;
