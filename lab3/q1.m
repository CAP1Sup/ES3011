m = 5; % Mass in kg
b = 0.5; % Damping constant in N·s/m
k = 1.0; % Spring constant in N/m

num = [2]; % Since the force F = 2N is the input, it becomes the numerator.
den = [m b k]; % Denominator of the transfer function based on m, b, and k.

sys = tf(num, den); % Create a transfer function model.

% For plotting responses
figure;
step(sys); % Plots the step response of the system.
figure;
impulse(sys); % Plots the impulse response of the system.
figure;
t = 0:0.01:10; % Time vector for ramp input.
u = t; % Ramp input.
lsim(sys, u, t); % Plots the response to the ramp input.

% For step response characteristics
info = stepinfo(sys);