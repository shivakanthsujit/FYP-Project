global param_e
global param_dy
global param_sq
global limits_e
global limits_dy
global limits_sq
global params

switch params
    
    case 0
        % v, epsilon lamda c
        param_e = {
                        [0.6 0.3 2.6 -1],
                        [0.7 0.3 6.7 0],
                        [0.6 0.3 2.6 1]
                        };
        limits_e = [-1 1];
        
        param_dy = {
                        [0.005 0.3 2.6 -0.1],
                        [0.00001 1 2.0 0],
                        [0.005 0.3 2.6 0.1]
                        };
        limits_dy = [-0.1 0.1];
        
        param_sq = {
                        [0.08 0.3 2 -1],
                        [0.08 0.3 2 -0.5],
                        [0.08 0.3 2 0],
                        [0.08 0.3 2 0.5],
                        [0.08 0.3 2 1]
                        };
        limits_sq = [-1 1];
    case 1
        % v, epsilon lamda c
        param_e = {
                        [0.5 0.3 2 -1],
                        [0.5 0.1 2 0],
                        [0.5 0.3 2 1]
                        };
        limits_e = [-1 1];

        param_dy = {
                        [0.5 0.1 2 -0.1],
                        [0.5 0.05 2 0],
                        [0.5 0.1 2 0.1]
                        };
        limits_dy = [-0.1 0.1];

        param_sq = {
                        [0.5 0.3 2 -1],
                        [0.5 0.2 2 -0.5],
                        [0.5 0.1 2 0],
                        [0.5 0.2 2 0.5],
                        [0.5 0.3 2 1]
                        };
        limits_sq = [-1 1];
end