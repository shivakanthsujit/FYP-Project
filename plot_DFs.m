% v, epsilon lamda c
global param_e
global param_dy
global param_sq
global limits_e
global limits_dy
global limits_sq
global params

params = 1;
global_variables;
choice = 1;

switch choice
    case 0
        params = param_e;
        limits = limits_e;
    case 1
        params = param_dy;
        limits = limits_dy;
    case 2
        params = param_sq;
        limits = limits_sq;
end

n_rules = length(params);

% inp = 0.3;
% out = zeros(n_rules, 1);
% for i=1:n_rules
%     out(i) = DF(inp, params{i}(1), params{i}(2), params{i}(3), params{i}(4));
% end

inp = [-10:0.01:10];
out = {
    zeros(length(inp), 1),
    zeros(length(inp), 1),
    zeros(length(inp), 1),
    };
for k=1:length(inp)
    for i=1:n_rules
        out{i}(k) = DF(inp(k), params{i}(1), params{i}(2), params{i}(3), params{i}(4));
    end
end

for k=1:n_rules
plot(inp, out{k})
hold on
end
xlim(limits)