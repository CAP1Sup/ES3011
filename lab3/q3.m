% Define the system properties
m = 1500; % Mass of the vehicle in kg
b = 50;   % Damping coefficient in N·s/m
u = 500;  % Input force in N

% Define the transfer function H(s)
num = u;    % Numerator, which is the input force
den = [m b]; % Denominator of the transfer function

% Create the transfer function model
sys = tf(num, den);

% Plot the step response
figure;
[step_response, step_time] = step(sys);
plot(step_time, step_response);
title('Open-Loop Step Response');
ylabel('Velocity (m/s)');
xlabel('Time (s)');

% Plot the impulse response
figure;
impulse(sys);
title('Open-Loop Impulse Response');
ylabel('Velocity (m/s)');
xlabel('Time (s)');

% Plot the ramp response
figure;
ramp_time = step_time; % Use the same time vector as for the step response
ramp_input = ramp_time; % Ramp input is a function of time: V(t) = t
lsim(sys, ramp_input, ramp_time);
title('Open-Loop Ramp Response');
ylabel('Velocity (m/s)');
xlabel('Time (s)');

% Gather the data from the step response using stepinfo
step_info = stepinfo(sys);

% Display the gathered data
disp(['Peak Response: ', num2str(step_info.Peak)]);
disp(['Settling Time: ', num2str(step_info.SettlingTime)]);
disp(['Rise Time: ', num2str(step_info.RiseTime)]);
disp(['Max Overshoot: ', num2str(step_info.Overshoot)]);
