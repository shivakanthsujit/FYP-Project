function hprime=level(t, h)
global qin
global qout
global Ao
global g
global At
global hmin
h = max(hmin, h);
qout = Ao*sqrt(2 * g * h);
hprime=(qin-qout)/At;
