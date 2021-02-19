function result= adaptive_control(y_true, y_ref, tolerance, dy)

global w_hat_rules;

error = 0.5*(y_true - y_ref)^2;

error_f = fuzzify(error, 0);
dy_f = fuzzify(dy, 1);

if error >= tolerance :

    // Calculate w strength using antecedant function
    
    w_hat1 = parametric([error_f(1) dy_f(2)], 1, 1);
    w_hat2 = parametric([error_f(2) dy_f(3)], 1, 1);
    w_hat3 = parametric([error_f(2) dy_f(2)], 1, 1);
    w_hat4 = parametric([error_f(2) dy_f(1)], 1, 1);
    w_hat5 = parametric([error_f(3) dy_f(2)], 1, 1);

    w_sum = w_hat1 + w_hat2 + w_hat3 + w_hat4 + w_hat5;
    w1 = w_hat1/w_sum;
    w2 = w_hat2/w_sum;
    w3 = w_hat3/w_sum;
    w4 = w_hat4/w_sum;
    w5 = w_hat5/w_sum;
    w = [w1 w2 w3 w4 w5]; % replace from pipeline.m

    [ _ , index] = max(w)
    
    if w_hats_rules{index}(1) > w_hats_rules{index}(2)
    DF  





