% Declare s to be a transfer function
clear
s = tf("s");

% Function
gs = 9/(s*(s+3));

% Responses
y_t = gs/(1 + gs*1);

% Compute the relevant step response characteristics
step(y_t)
step_info = stepinfo(y_t, "RiseTimeLimits", [0,1])
