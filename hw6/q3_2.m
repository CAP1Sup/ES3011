% Define the transfer variable
s = tf("s");

% Define the system
g = 50 / (s * (s+1) * (s+7));

% Plot the frequency response
bode(g)
margin(g)
