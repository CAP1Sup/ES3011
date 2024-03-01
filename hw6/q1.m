% Define the transfer variable
s = tf("s");

% Define the system
g = 10 * (s+1) / ((s+3)*(s^2+4*s+36));

% Plot the frequency response
bode(g)