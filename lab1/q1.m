%% Initialize the system constants
m = 5; % kg
k = 1.0; % N/m
b = 0.5; % Ns/m
F = 2; % N

%% Set up state space matrices
A = [0 1; -k/m -b/m];
B = [0; 1/m];
C = [1 0];
D = [0];

%% Set up state space equations
sys = ss(A, B, C, D);

%% Simulate the model
t = [0 : 0.05 : 20];
u = F * ones(size(t));
lsim(sys, u, t)