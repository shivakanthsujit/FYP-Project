global params
params = 1;
global_variables;

global limits_e
global limits_dy

E = [limits_e(1):0.01:limits_e(2)];
dy = [limits_dy(1):0.01:limits_dy(2)];

m = length(E);
n = length(dy);

q = zeros(m, n);

for i=1:m
    for j=1:n
        q(i, j) = fuzzy_controller(E(i), dy(j));
    end
end
surf(dy, E, q)