clc;
clearvars;
format long e


global params
params = 1;
global_variables;

global qin
global qout
global Ao
global g
global At
global hmin

% Operating Points
qin=25;
q_init= qin;
h_init= 0.5;
s_s1= h_init;
Ao = 8;
At = 10;
g = 9.8;
hmin=0.05;
qout = Ao*sqrt(2 * g * h_init);

t_init = 0;
dt = 0.1;
t_fin = dt;

h_sp = 1.5;
t_sp = 1;
k_sp = fix(t_sp/dt);
setpoint_vector = [ones(k_sp,1)*h_init;ones(60,1)*h_sp;ones(60,1)*h_init;ones(60,1)*h_sp;ones(21,1)*h_init]; % setpoint vector

tt_final = fix(length(setpoint_vector)*dt);
tt = 0:dt:tt_final;
k_fin=length(tt); % Sim Time

k_fin
q = zeros(k_fin, 1);
dq = zeros(k_fin, 1);
h = zeros(k_fin, 1);
E = zeros(k_fin, 1);
dh = zeros(k_fin, 1);

for k=1:k_sp
    q(k)=q_init;
    dq(k) = 0;
    h(k)=h_init;
    E(k)=0;
    dh(k) = 0;
end

for k=k_sp:k_fin
    E(k)=setpoint_vector(k)-h(k);
    dh(k) = h(k) - h(k-1);

    valve_action = fuzzy_controller(E(k), dh(k));
    ratio = (qin/qout);
    temp = qout * ((qin/qout)+valve_action);
    %q(k)
    %temp
    q(k) = temp;

    qin=q(k);
    t_init
    t_fin
    s_s1
    [t,m1] = ode45('level',[t_init,t_fin], s_s1);
    s_s1(1) = max(hmin, m1(length(t),1));
    h(k+1)=s_s1(1);

    t_init = t_fin;
    t_fin = t_fin+dt;
end

t_l = length(tt);
t_in = tt(1);
t_end = tt(t_l);

subplot(2,1,1)
stairs(tt, setpoint_vector(1:t_l), '--')
hold on
plot(tt, h(1:t_l))
grid on
legend("Setpoint", "Plant Output")
ylabel("Water Level in [m]")
xlabel("Time in [s]")
xlim([t_in t_end])
title("Setpoint Tracking")

subplot(2,2,3)
plot(tt, q(1:t_l))
grid on
legend("qc")
ylabel("Input Flow Rate in [l/min]")
xlabel("Time in [s]")
xlim([t_in t_end])
title("Input Flow Rate")

subplot(2,2,4)
plot(tt, E(1:t_l))
grid on
legend("Error")
ylabel("Water Level Error in [m]")
xlabel("Time in [s]")
xlim([t_in t_end])
title("Water Level Error")