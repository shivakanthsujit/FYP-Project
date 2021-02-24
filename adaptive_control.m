function result= adaptive_control(y_true, y_ref, tolerance, dy)
global w_hat_rules
global parametersE
global parametersdy
    error = 0.5*(y_true - y_ref)^2;

    error_f = fuzzify(error, 0);
    dy_f = fuzzify(dy, 1);

    if error >= tolerance
        w_hats = zeros(length(w_hat_rules), 1);
        w = zeros(length(w_hat_rules), 1);
        for i=1:length(w_hat_rules)
        w_hats(i) = parametric([error_f(w_hat_rules{i}(1)) dy_f(w_hat_rules{i}(2))], 1, 1); 
        end
        w_sum = sum(w_hats);
        w = w_hats/w_sum;

        [ abc , index] = max(w);
        
        k2 = sum(w_hats) - w_hats(index);
        
        
        if error_f(w_hat_rules{index}(1)) > dy_f(w_hat_rules{index}(2))
            DF_index = w_hat_rules{index}(1);
            old_epsilon = parametersE{DF_index}(2);
            k1 = sum(w_hats)*y_true - parametersE{DF_index}(4)*w_hats(index);
            new_epsilon = final_wt_update(old_epsilon, old_epsilon, error, parametersE{DF_index}(3), 0.01, dy_f(w_hat_rules{index}(1)), parametersE{DF_index}(4), w(index), w_hats(index), k1,k2 );
            parametersE{DF_index}(2) = new_epsilon;
        else
            DF_index = w_hat_rules{index}(2);
            old_epsilon = parametersdy{DF_index}(2);
            k1 = sum(w_hats)*y_true - parametersdy{DF_index}(4)*w_hats(index);
            new_epsilon = final_wt_update(old_epsilon, old_epsilon, error, parametersdy{DF_index}(3), 0.01, dy_f(w_hat_rules{index}(2)), parametersdy{DF_index}(4), w(index), w_hats(index), k1,k2);
            parametersdy{DF_index}(2) = new_epsilon;
        end
    


    result=0;

    end