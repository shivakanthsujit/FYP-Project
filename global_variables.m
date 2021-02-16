global parametersE
global parametersdy
global parametersq
global limitsE
global limitsdy
global limitsq

para = 0;
switch para
    
    case 0
        % v, epsilon lamda c
        parametersE = {
                        [0.6 0.3 2.6 -1],
                        [0.7 0.3 6.7 0],
                        [0.6 0.3 2.6 1]
                        };
        limitsE = [-1 1];
        
        parametersdy = {
                        [0.005 0.3 2.6 -0.1],
                        [0.00001 1 2.0 0],
                        [0.005 0.3 2.6 0.1]
                        };
        limitsdy = [-0.1 0.1];
        
        parametersq = {
                        [0.08 0.3 2 -1],
                        [0.08 0.3 2 -0.5],
                        [0.08 0.3 2 0],
                        [0.08 0.3 2 0.5],
                        [0.08 0.3 2 1]
                        };
        limitsq = [-1 1];
    case 1
        % v, epsilon lamda c
        parametersE = {
                        [0.5 0.3 2 -1],
                        [0.5 0.1 2 0],
                        [0.5 0.3 2 1]
                        };
        limitsE = [-1 1];

        parametersdy = {
                        [0.5 0.3 2 -0.1],
                        [0.5 0.1 2 0],
                        [0.5 0.3 2 0.1]
                        };
        limitsdy = [-0.1 0.1];

        parametersq = {
                        [0.5 0.3 2 -1],
                        [0.5 0.2 2 -0.5],
                        [0.5 0.1 2 0],
                        [0.5 0.2 2 0.5],
                        [0.5 0.3 2 1]
                        };
        limitsq = [-1 1];
end