function result=fuzzify(inp, choice)
global parametersE
global parametersdy
global parametersq
global limitsE
global limitsdy
global limitsq

switch choice

    case 0
        parameters = parametersE;
        limits = limitsE;
    case 1
        parameters = parametersdy;
        limits = limitsdy;
    case 2
        parameters = parametersq;
        limits = limitsq;
end
n_rules = length(parameters);
out = zeros(n_rules, 1);
inp = min(max(inp,limits(1)),limits(2));

for i=1:n_rules
    out(i) = DF(inp, parameters{i}(1), parameters{i}(2), parameters{i}(3), parameters{i}(4));
end
result = out;
end