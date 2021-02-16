global parametersE
global parametersdy
global parametersq
global limitsE
global limitsdy
global limitsq

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