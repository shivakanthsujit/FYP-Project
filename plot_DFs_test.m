% v, epsilon lamda c
function plot_DFs_test(choice)
global parametersE
global parametersdy
global parametersq
global limitsE
global limitsdy
global limitsq
global params

params = 1;
% global_variables;
% choice = 1;

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

inp = [-10:0.01:10];
out = {
    zeros(length(inp), 1),
    zeros(length(inp), 1),
    zeros(length(inp), 1),
    };
for k=1:length(inp)
    for i=1:n_rules
        out{i}(k) = DF(inp(k), parameters{i}(1), parameters{i}(2), parameters{i}(3), parameters{i}(4));
    end
end
figure(2)
for k=1:n_rules
plot(inp, out{k})
hold on
end
xlim(limits)
end