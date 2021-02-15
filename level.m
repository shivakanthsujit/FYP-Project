function hprime=level(t, h)
global qin
Ao = 8;
At = 10;
g = 9.8;
hprime=(qin-Ao*sqrt(2 * g * h))/At;
