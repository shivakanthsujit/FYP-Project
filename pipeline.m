function result=pipeline(E, dy)
global parametersq

E = fuzzify(E, 0);
dy = fuzzify(dy, 1);

% Step 3 + 4
global w_hat_rules;
w_hat_rules = {
    [1 2],
    [2 3],
    [2 2],
    [2 1],
    [3 2]
};

w_hats = zeros(length(w_hat_rules), 1);
for i=1:length(w_hat_rules)
w_hats(i) = parametric([E(w_hat_rules{i}(1)) dy(w_hat_rules{i}(2))], 1, 1);
end


w_sum = w_hat1 + w_hat2 + w_hat3 + w_hat4 + w_hat5;
w1 = w_hat1/w_sum;
w2 = w_hat2/w_sum;
w3 = w_hat3/w_sum;
w4 = w_hat4/w_sum;
w5 = w_hat5/w_sum;
w = [w1 w2 w3 w4 w5];

c = cellfun(@(a) a(1, 4), parametersq);
e = cellfun(@(a) a(1, 2), parametersq);
c_agg = w' * c;  % Center of gravity of resulting DF
e_agg = w' * e;

result = c_agg;
end