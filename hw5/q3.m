% Define the transfer variable
s = tf('s');

% System 1
sys1_open_loop = 5/(s*(5*s+1));
sys1_closed_loop = sys1_open_loop/(1 + sys1_open_loop);

% System 2
sys2_open_loop = (5*(1+0.8*s))/(s*(5*s+1));
sys2_closed_loop = sys2_open_loop/(1 + sys2_open_loop);

% System 3
sys3_open_loop = 5/(5*s+1);
sys3_loop_1 = sys3_open_loop/(1 + 0.8*sys3_open_loop) * 1/s;
sys3_closed_loop = sys3_loop_1/(1 + sys3_loop_1);

% Plot the response
fig = figure;
step(sys1_closed_loop)
title("Q3 - System 1 Unit Step Response")
waitfor(fig)

% Plot the response
fig = figure;
step(sys2_closed_loop)
title("Q3 - System 2 Unit Step Response")
waitfor(fig)

% Plot the response
fig = figure;
step(sys3_closed_loop)
title("Q3 - System 3 Unit Step Response")
waitfor(fig)