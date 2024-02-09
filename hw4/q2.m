% Declare s to be a symbolic variable
clear
syms s

% Unit input functions
unit_step = 1/s;
unit_impulse = 1;

% Function
gs = (2*s + 1)/s^2;

% Responses
y_t_unit_impulse = ilaplace(gs/(1 + gs*unit_impulse))
y_t_unit_step = ilaplace(gs/(1 + gs*unit_step))
