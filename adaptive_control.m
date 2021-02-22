global w_hat_rules
global param_e
global param_dy

function result= adaptive_control(y_true, y_ref, tolerance, dy)

    error = 0.5*(y_true - y_ref)^2;

    error_f = fuzzify(error, 0);
    dy_f = fuzzify(dy, 1);

    if error >= tolerance :
        global w_hat_rules;
        w_hat_rules = {
            [1 2],
            [2 3],
            [2 2],
            [2 1],
            [3 2]
        }

        w_hats = zeros(length(w_hat_rules), 1);
        w = zeros(length(w_hat_rules), 1);
        for i=1:length(w_hat_rules);
        w_hats(i) = parametric([error_f(w_hat_rules{i}(1)) dy_f(w_hat_rules{i}(2))], 1, 1); 
        end

        w_sum = sum(w_hats);
        w = w_hats/w_sum;

        [ _ , index] = max(w);

        if error_f(w_hats_rules{index}(1)) > dy_f(w_hats_rules{index}(2))
            DF_index = w_hats_rules{index}(1);
            old_epsilon = param_e{DF_index}(2);
            new_epsilon = final_wt_update(old_epsilon, old_epsilon, error, param_e{DF_index}(3), 0.01, dy_f(w_hats_rules{index}(1), param_e{DF_index}(4), w(index), w_hat(index), );
            param_e{DF_index}(2) = new_epsilon;
        else
            DF_index = w_hats_rules{index}(2);
            old_epsilon = param_dy{DF_index}(2);
            new_epsilon = final_wt_update(old_epsilon, old_epsilon, error, param_dy{DF_index}(3), 0.01, dy_f(w_hats_rules{index}(2), param_dy{DF_index}(4), w(index), w_hat(index), );
            param_dy{DF_index}(2) = new_epsilon;
end

function result = final_wt_update(epi_t, epi_i, error_f, lambda, n_s, d_x, c, w, w_cap, k1, k2)
    num = 2*lambda*n_s*error_f*d_x*(1 - d_x)*(2*c*w_cap + c*k2 + k1);
    dtr = epi_i(w + k2)^2;
    result = epi_t - num/dtr;
end





