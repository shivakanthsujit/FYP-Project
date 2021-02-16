% v, epsilon lamda c

% % v, epsilon lamda c
% parametersE = {
%                 [0.6 0.3 2.6 -1],
%                 [0.7 0.3 6.7 0],
%                 [0.6 0.3 2.6 1]
%                 };
% limitsE = [-1 1];
% 
% parametersdy = {
%                 [0.005 0.3 2.6 -0.1],
%                 [0.00001 1 2.0 0],
%                 [0.005 0.3 2.6 0.1]
%                 };
% limitsdy = [-0.1 0.1];
% 
% parametersq = {
%                 [0.08 0.3 2 -1],
%                 [0.08 0.3 2 -0.5],
%                 [0.08 0.3 2 0],
%                 [0.08 0.3 2 0.5],
%                 [0.08 0.3 2 1]
%                 };
% limitsq = [-1 1];


parameters = {
                [0.08 0.3 2 -1],
                [0.08 0.3 2 -0.5],
                [0.08 0.3 2 0.0],
                [0.08 0.3 2 0.5],
                [0.08 0.3 2 1.0]
                };
            
limits = [-1 1];
n_rules = length(parameters);

inp = 0.3;
out = zeros(n_rules, 1);
for i=1:n_rules
    out(i) = DF(inp, parameters{i}(1), parameters{i}(2), parameters{i}(3), parameters{i}(4));
end

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