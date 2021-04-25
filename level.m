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

qout = Ao*sqrt(2 * g * h);
hprime=(qin-qout)/At;
