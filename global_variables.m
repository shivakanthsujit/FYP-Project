global parametersE
global parametersdy
global parametersq
global limitsE
global limitsdy
global limitsq
global params
global fuzzynames
global fuzzymems

fuzzynames = {
    ["High", "OK", "LOW"],
    ["Negative", "Dont Care", "Positive"],
    ["Close Fast", "Close Slow", "No Change", "Open Slow", "Open Fast"]
    };

fuzzymems = ["Level Error", "Level Rate", "Valve Action"];

switch params

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
                        [0.5 0.1 2 -0.1],
                        [0.5 0.05 2 0],
                        [0.5 0.1 2 0.1]
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