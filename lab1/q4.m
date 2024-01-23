%% Initialize the system constants
J = 3E-6; % kg*m^2
b = 3.5E-6; % N*s/m
K = 0.025; % V/rad/sec
R = 5; % Ohm
L = 3E-6; % H
V = 100; % V

%% Set up state space matrices
A = [0 1 0; 0 -b/J K/J; 0 -K/L -R/L];
B = [0; 0; 1/L];
C = [1 0 0];
D = [0];

%% Set up state space equations
sys = ss(A, B, C, D);

%% Simulate the model
t = [0 : 0.05 : 10];
u = V * ones(size(t));
lsim(sys, u, t)