% Declare s to be a transfer function
clear
s = tf("s");

% Function
cs_rs = 10/(s^2 + 2*s + 10);

% Responses
fig = figure;
step(cs_rs)
waitfor(fig)

fig = figure;
impulse(cs_rs)
waitfor(fig)

fig = figure;
step(cs_rs/s) % ramp
title("Ramp Response")
waitfor(fig)
