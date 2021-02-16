% v, epsilon lamda c
parameters = {
    [0.5 0.3 2 -1],
    [0.5 0.1 2 0],
    [0.5 0.3 2 1]
    };
n_rules = length(parameters);

inp = 0.3;
out = zeros(n_rules, 1);
for i=1:n_rules
    out(i) = DF(inp, parameters{i}(1), parameters{i}(2), parameters{i}(3), parameters{i}(4));
end

% inp = [-10:0.01:10];
% out = {
%     zeros(length(inp), 1),
%     zeros(length(inp), 1),
%     zeros(length(inp), 1),
%     };
% for k=1:length(inp)
%     for i=1:length(parameters)
%         out{i}(k) = DF(inp(k), parameters{i}(1), parameters{i}(2), parameters{i}(3), parameters{i}(4));
%     end
% end
% 
% plot(inp, out{1})
% hold on
% plot(inp, out{2})
% hold on
% plot(inp, out{3})
% hold on
% xlim([-1 1])