% Define the parameters of the RLC circuit
L = 5; % Inductance in henries
C = 300e-6; % Capacitance in farads (300 µF)
R = 100; % Resistance in ohms

% Define the transfer function H(s)
num = 1; % Numerator (since V(t) = 1V, it's a constant)
den = [L, R, 1/C]; % Denominator coefficients from Ls^2 + Rs + 1/C

% Create the transfer function model
H = tf(num, den);

% Plot the step response
figure;
[step_response, step_time] = step(H);
plot(step_time, step_response);
title('Open-Loop Step Response');
ylabel('Amplitude');
xlabel('Time (s)');

% Plot the impulse response
figure;
impulse_response = impulse(H, step_time);
plot(step_time, impulse_response);
title('Open-Loop Impulse Response');
ylabel('Amplitude');
xlabel('Time (s)');

% Plot the ramp response
figure;
ramp_time = step_time; % Reusing the time vector from the step response for ramp
ramp_input = ramp_time; % Ramp input is a function of time: V(t) = t
lsim(H, ramp_input, ramp_time);
title('Open-Loop Ramp Response');
ylabel('Charge (Coulombs)');
xlabel('Time (s)');

% Gather the data from the step response using the stepinfo function
step_info = stepinfo(H);

% Display the gathered data
disp(['Peak Response: ', num2str(step_info.Peak)]);
disp(['Settling Time: ', num2str(step_info.SettlingTime)]);
disp(['Rise Time: ', num2str(step_info.RiseTime)]);
disp(['Max Overshoot: ', num2str(step_info.Overshoot)]);
