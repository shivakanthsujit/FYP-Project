function h_prime=level(t, h)
    global qin
    global qout
    global Ao
    global g
    global At
    global h_min
    h = max(h_min, h);
    qout = Ao*sqrt(2 * g * h);
    h
    h_prime=(qin-qout)/At;
    h_prime
end