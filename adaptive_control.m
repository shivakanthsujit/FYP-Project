global w_hat_rules
global parametersE
global parametersdy

function result= adaptive_control(y_true, y_ref, tolerance, dy)



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

    if error_f(w_hats_rules{index}(1)) > dy_f(w_hats_rules{index}(2))
        DF_index = w_hats_rules{index}(1)
        old_epsilon = parametersE{DF_index}(2)
        new_epsilon = final_wt_update(old_epsilon, old_epsilon, error, parametersE{DF_index}(3), 0.01, dy_f(w_hats_rules{index}(1), parametersE{DF_index}(4), w(index), w_hat(index), )
        parametersE{DF_index}(2) = new_epsilon
    else
        DF_index = w_hats_rules{index}(2)
        old_epsilon = parametersdy{DF_index}(2)
        new_epsilon = final_wt_update(old_epsilon, old_epsilon, error, parametersdy{DF_index}(3), 0.01, dy_f(w_hats_rules{index}(2), parametersdy{DF_index}(4), w(index), w_hat(index), )
        parametersdy{DF_index}(2) = new_epsilon
end

function result = final_wt_update(epi_t, epi_i, E, lambda, n_s, d_x, c, w, w_cap, k1, k2)
    num = 2*lambda*n_s*E*d_x*(1 - d_x)*(2*c*w_cap + c*k2 + k1);
    dtr = epi_i(w + k2)^2;
    result = epi_t - num/dtr;
end





