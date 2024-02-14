% Define the system properties
J = 3e-6; % Moment of inertia of the rotor in kg·m²
b = 3.5e-6; % Motor friction constant in N·s/m
K = 0.025; % Electric force and motor torque constant in V/(rad/sec)
R = 5; % Electric resistance in Ohms
L = 3e-6; % Electric inductance in Henries

% Define the transfer function H(s)
% We have two equations:
% J*s*Theta(s) + b*Theta(s) = K*I(s) -- (1)
% L*s*I(s) + R*I(s) = V(s) - K*s*Theta(s) -- (2)
% From (2), we can express I(s) = [V(s) - K*s*Theta(s)] / (L*s + R)
% Substituting I(s) from (2) into (1) gives us Theta(s)

% Rearrange terms to represent Theta(s) / V(s) and simplify
num = K; % Numerator comes from the torque constant times the current
den = [J*L, J*R + b*L, b*R + K^2]; % Denominator coefficients

% Create the transfer function model
motor_sys = tf(num, den);

% Plot the step response
figure;
step(motor_sys);
title('Open-Loop Step Response');
ylabel('Angular Velocity (rad/s)');
xlabel('Time (s)');

% Plot the impulse response
figure;
impulse(motor_sys);
title('Open-Loop Impulse Response');
ylabel('Angular Velocity (rad/s)');
xlabel('Time (s)');

% Plot the ramp response
figure;
t = 0:1e-6:0.1; % Time vector (adjust the end time as needed)
ramp_input = t; % Ramp input is a function of time
lsim(motor_sys, ramp_input, t);
title('Open-Loop Ramp Response');
ylabel('Angular Velocity (rad/s)');
xlabel('Time (s)');

% Gather the data from the step response using stepinfo
step_info = stepinfo(motor_sys);

% Display the gathered data
disp(['Peak Response: ', num2str(step_info.Peak)]);
disp(['Settling Time: ', num2str(step_info.SettlingTime)]);
disp(['Rise Time: ', num2str(step_info.RiseTime)]);
disp(['Max Overshoot: ', num2str(step_info.Overshoot)]);
