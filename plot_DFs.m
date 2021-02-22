% v, epsilon lamda c
global parametersE
global parametersdy
global parametersq
global limitsE
global limitsdy
global limitsq
global params
global fuzzynames
global fuzzymems

params = 1;
global_variables;
choice = 3;

switch choice
    case 1
        parameters = parametersE;
        limits = limitsE;
    case 2
        parameters = parametersdy;
        limits = limitsdy;
    case 3
        parameters = parametersq;
        limits = limitsq;
end

n_rules = length(parameters);

% inp = 0.3;
% out = zeros(n_rules, 1);
% for i=1:n_rules
%     out(i) = DF(inp, parameters{i}(1), parameters{i}(2), parameters{i}(3), parameters{i}(4));
% end

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

for k=1:n_rules
plot(inp, out{k})
hold on
end
xlim(limits)
legend(fuzzynames{choice})
ylabel("Membership Value")
xlabel(fuzzymems(choice))

