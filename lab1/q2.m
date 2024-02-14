%% Initialize the system constants
L = 5; % H
C = 300; % F
R = 100000; % Ohm
V = 300; % V

%% Set up state space matrices
A = [0 1; -1/(L*C) -R/L];
B = [0; 1/L];
C = [0 1];
D = [0];

%% Set up state space equations
sys = ss(A, B, C, D);

%% Simulate the model
t = [0 : 0.000005 : 0.0005];
u = V * ones(size(t));
lsim(sys, u, t)
axis([0 0.0005 0 0.0035])