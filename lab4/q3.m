% System parameters
J = 3.23e-6;  % Moment of inertia of the rotor [kg.m^2]
b = 3.51e-6;  % Motor friction constant [N.m.s]
K = 0.0275;   % Electric force and motor torque constant [V/rad/sec]
R = 4.0;      % Electric resistance [Ohm]
L = 2.75e-6;  % Electric inductance [H]

% Transfer function of the motor
num = K;  % Numerator coefficient
den = [J*L, J*R + b*L, b*R + K^2];  % Denominator coefficients

% Create a transfer function model
motor_sys = tf(num, den);

% Time array
t = 0:0.001:0.25;

% P-controller step responses for different Kp values
Kp_values = [1, 10, 50];
figure;
hold on;

for Kp = Kp_values
    % Closed-loop transfer function with a proportional controller
    cl_sys = feedback(Kp*motor_sys, 1);
    
    % Step response
    [y, t_out] = step(cl_sys, t);
    
    % Plotting
    plot(t_out, y, 'DisplayName', ['Kp = ' num2str(Kp)]);
end

% Configure the plot
title('Step Responses for Different Kp Values');
xlabel('Time (s)');
ylabel('Position (rad)');
legend;
grid on;
hold off;

% PID Controller
Kp_pid = 20;
Ki_pid = 500;
Kd_pid = 0.15;

% Create a PID controller
pid_controller = pid(Kp_pid, Ki_pid, Kd_pid);

% Closed-loop system with PID controller
cl_pid_sys = feedback(pid_controller*motor_sys, 1);

% Step response for the PID controller
figure;
[y_pid, t_pid] = step(cl_pid_sys, t);
plot(t_pid, y_pid, 'DisplayName', 'PID Controller Response');

% Configure the plot
title('Step Response with PID Controller');
xlabel('Time (s)');
ylabel('Position (rad)');
legend;
grid on;

% Extract the required data from the closed-loop step response
S = stepinfo(cl_pid_sys);

% Display the required data
disp(['Peak Response: ', num2str(S.Peak)]);
disp(['Settling Time: ', num2str(S.SettlingTime)]);
disp(['Rise Time: ', num2str(S.RiseTime)]);
disp(['Max Overshoot: ', num2str(S.Overshoot)]);
