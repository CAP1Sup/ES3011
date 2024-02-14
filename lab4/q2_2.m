
% Define the plant
P_car = 1/(m*s + b);

% Initial guess for the PID controller
Kp = 100; Ki = 1; Kd = 1;
C = pid(Kp, Ki, Kd);

% Open the PID Tuner
pidTuner(P_car, C);

