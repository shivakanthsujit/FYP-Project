% Algo 1

function result=fuzzy_controller(E, dy)
global param_sq

% Step 1, 2 
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
}

w_hats = zeroes(length(w_hat_rules), 1)
w = zeroes(length(w_hat_rules), 1)
for i=1:length(w_hat_rules)
w_hats(i) = parametric([E(w_hat_rules{i}(1)) dy(w_hat_rules{i}(2))], 1, 1) 
end


% Step 5
w_sum = sum(w_hats);
w = w_hats/w_sum;

c = cellfun(@(a) a(1, 4), param_sq);
e = cellfun(@(a) a(1, 2), param_sq);
c_agg = w * c;  % Center of gravity of resulting DF
e_agg = w * e;

result = c_agg;
end