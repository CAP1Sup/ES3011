clear

% Function
cs_rs = tf(36, [1,2,36]);

% Compute the relevant step response characteristics
step(cs_rs)
step_info = stepinfo(cs_rs, "RiseTimeLimits", [0,1])