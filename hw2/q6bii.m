%% Initialize the system constants
m = 1; % kg
k = 9; % N/m
c = 10; % N*s/m
F = 1; % N

%% Set up state space matrices
A = [0 1; -k/m -c/m];
B = [0; 1/m];
C = [1 0];
D = [0];

%% Set up state space equations
sys = ss(A, B, C, D);

%% Simulate the model
t = [0 : 0.05 : 10];
u = F * ones(size(t));
lsim(sys, u, t)
title("Q6.B.ii (c=10)")
axis([0 10 0 0.12])