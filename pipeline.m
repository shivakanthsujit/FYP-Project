function result=pipeline(E, dy)
global parametersq

E = fuzzify(E, 0);
dy = fuzzify(dy, 1);

w_hat1 = parametric([E(1) dy(2)], 1, 1);
w_hat2 = parametric([E(2) dy(3)], 1, 1);
w_hat3 = parametric([E(2) dy(2)], 1, 1);
w_hat4 = parametric([E(2) dy(1)], 1, 1);
w_hat5 = parametric([E(3) dy(2)], 1, 1);


w_sum = w_hat1 + w_hat2 + w_hat3 + w_hat4 + w_hat5;
w1 = w_hat1/w_sum;
w2 = w_hat2/w_sum;
w3 = w_hat3/w_sum;
w4 = w_hat4/w_sum;
w5 = w_hat5/w_sum;
w = [w1 w2 w3 w4 w5];

c = cellfun(@(a) a(1, 4), parametersq);
e = cellfun(@(a) a(1, 2), parametersq);
c_agg = w * c;
e_agg = w * e;

result = c_agg;
end