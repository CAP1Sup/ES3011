% Given system properties
m = 1500; % mass of the vehicle in kg
b = 50;   % damping coefficient in N.s/m
u = 10;   % reference speed in m/s

% Define the system as a transfer function
s = tf('s');
P_car = 1/(m*s + b);

% Proportional gains
Kp_values = [1, 10, 50];

% Plot the step responses
figure;
for Kp = Kp_values
    % Create a proportional controller
    C = pid(Kp);
    
    % The closed-loop system with the controller
    T = feedback(C*P_car,1);
    
    % Step response for the closed-loop system
    step(T,0:0.1:200);
    hold on;
end

% Customize the plot
title('Step Responses for Proportional Gain Controllers');
xlabel('Time (seconds)');
ylabel('Velocity (v)');
legend('Kp = 1','Kp = 10','Kp = 50');
hold off;

% Define the plant
P_car = 1/(m*s + b);

% Initial guess for the PID controller
Kp = 100; Ki = 1; Kd = 1;
C = pid(Kp, Ki, Kd);

% Open the PID Tuner
pidTuner(P_car, C);