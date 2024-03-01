% Define the transfer variable
s = tf("s");

% Define the system
g = 10 * (s^2+0.4*s+1) / (s*(s^2+0.8*s+9));

% Plot the frequency response
bode(g)