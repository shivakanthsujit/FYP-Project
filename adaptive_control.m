function result= adaptive_control(y_true, y_ref, tolerance)

error = 0.5*(y_true - y_ref)^2;

while error >= tolerance :
    
    // Calculate w strength using antecedant function

