function result = final_wt_update(epi_t, epi_i, error_f, lambda, lr, d_x, c, w, w_cap, k1, k2)
    num = 2*lambda*lr*error_f*d_x*(1 - d_x)*(2*c*w_cap + c*k2 + k1);
    dtr = epi_i*(w + k2)^2;
    result = epi_t - num/dtr;
end