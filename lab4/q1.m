% System variables
m = 1; % kg
k = 10; % N/m
b = 20; % Ns/m
F = 2; % N

% Open loop system
sys = tf([F], [m b k]);

% Plot the open loop response
step(sys)

% Create a P controller
pController = pid(350);

% Closed loop system with controller
T = feedback(pController*sys,1);

% Plot the response
step(T,0:0.01:2)
title("Q1 P Loop Response")

% Display the step info
response = stepinfo(T)
