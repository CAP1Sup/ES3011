clear
% Given system properties
m = 1500; % mass of the vehicle in kg
b = 50;   % damping coefficient in N.s/m
u = 10;   % reference speed in m/s

% Define the plant
s = tf('s');
P_car = 1/(m*s + b);

% Initial guess for the PID controller
Kp = 100; Ki = 1; Kd = 1;
C = pid(Kp, Ki, Kd);

% Open the PID Tuner
pidTuner(P_car, C);