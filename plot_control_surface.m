global params
params = 1;
global_variables;

global limitsE
global limitsdy

E = [limitsE(1):0.01:limitsE(2)];
dy = [limitsdy(1):0.01:limitsdy(2)];

m = length(E);
n = length(dy);

q = zeros(m, n);

for i=1:m
    for j=1:n
        q(i, j) = pipeline(E(i), dy(j));
    end
end
surf(dy, E, q)
xlabel("Level Rate")
ylabel("Level Error")
zlabel("Valve Action")