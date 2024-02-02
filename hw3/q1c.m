%% Set up state space matrices
A = [0 1; -5 -6];
B = [0; 0];
C = [1 0];
D = [0];
i = [1 0];

%% Set up state space equations
sys = ss(A, B, C, D);

%% Simulate the model
t = [0 : 0.05 : 10];
u = zeros(size(t));
lsim(sys, u, t, i)
title("Q1C")