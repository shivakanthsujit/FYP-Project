function result=fuzzify(inp, choice)
global param_e
global param_dy
global param_sq
global limits_e
global limits_dy
global limits_sq

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
out = zeros(n_rules, 1);
inp = min(max(inp,limits(1)),limits(2));

for i=1:n_rules
    out(i) = DF(inp, params{i}(1), params{i}(2), params{i}(3), params{i}(4));
end
result = out;
end