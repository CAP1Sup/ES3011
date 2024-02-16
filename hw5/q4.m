% Define the system
s = tf('s');
open_loop = 10/(s*(s+2)*(s+4));
closed_loop = open_loop/(1 + open_loop);

% Plot the response
step(closed_loop)
title("Q4 - Unit Step Response")

% Get the unit step info
response = stepinfo(closed_loop)