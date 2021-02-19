clc;
clearvars;
format long e

global_variables;

global qin
global limits_sq

% Operating Points
qin=25;
q_init= qin;
q_low=0;
q_high=100;
l_init= 0.5;
s_s1= l_init;

tinitial = 0;
dt = 0.1;
tfinal = dt;

l_sp = 1.5;
timesp = 1;
ksp = fix(timesp/dt);
r = [ones(ksp,1)*l_init;ones(60,1)*l_sp;ones(60,1)*l_init;ones(60,1)*l_sp;ones(21,1)*l_init]; % setpoint vector
% r = [ones(ksp,1)*l_bar;ones(length(r)-ksp,1)*l_sp]; % setpoint vector
ttfinal = fix(length(r)*dt);
tt = 0:dt:ttfinal;
kfinal=length(tt); % Sim Time

Kc=10;
tau_I=0.3367;
tau_D=0.1926;

for k=1:ksp
q(k)=q_init;
dq(k) = 0;
l(k)=l_init;
r(k)=l_init;
E(k)=0;
dl(k) = 0;
end

for k=ksp:kfinal
if k>=80
    d(k)=0.05;
else
    d(k)=0;
end
E(k)=r(k)-l(k);
dl(k) = l(k) - l(k-1);

dq(k)=Kc*(E(k)-E(k-1)+(dt/tau_I)*E(k)+(tau_D/dt)*(E(k)-2*E(k-1)+E(k-2)));
q(k)=q(k-1)+dq(k);

qin=q(k);
[t,m1] = ode45('level',[tinitial,tfinal],s_s1);
s_s1(1) = max(0.0001, m1(length(t),1));
l(k+1)=s_s1(1);

tinitial = tfinal;
tfinal = tfinal+dt;
end

t_l = length(tt);
t_in = tt(1);
t_end = tt(t_l);

subplot(2,1,1)
stairs(tt, r(1:t_l), '--')
hold on
plot(tt, l(1:t_l))
grid on
legend("Plant Output", "Setpoint")
ylabel("Water Level in [m]")
xlabel("Time in [s]")
xlim([t_in t_end])

subplot(2,2,3)
plot(tt, q(1:t_l))
grid on
legend("qc")
ylabel("Input Flow Rate in [l/min]")
xlabel("Time in [s]")
xlim([t_in t_end])

subplot(2,2,4)
plot(tt, E(1:t_l))
grid on
legend("Error")
ylabel("Water Level in [m]")
xlabel("Time in [s]")
xlim([t_in t_end])
