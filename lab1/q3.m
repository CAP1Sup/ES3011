%% Initialize the system constants
m = 1500; % kg
b = 50; % N*s/m
F = 1500; % N

%% Set up state space matrices
A = [0 1; 0 -b/m];
B = [0; 1/m];
C = [0 1];
D = [0];

%% Set up state space equations
sys = ss(A, B, C, D);

%% Simulate the model
t = [0 : 0.05 : 100];
u = F * ones(size(t));
lsim(sys, u, t)
axis([0 100 0 30])