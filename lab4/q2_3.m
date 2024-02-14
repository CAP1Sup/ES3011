
C_opt = pid(Kp_opt, Ki_opt, Kd_opt); % Replace Kp_opt, Ki_opt, Kd_opt with your optimized values

% Closed-loop system
T_opt = feedback(C_opt*P_car, 1);

% Step response
[response, times] = step(T_opt, 0:0.1:200);

% Plot
figure;
step(T_opt, 0:0.1:200);

% Gather the data
info = stepinfo(T_opt);

% Print the data
fprintf('Rise Time: %f seconds\n', info.RiseTime);
fprintf('Settling Time: %f seconds\n', info.SettlingTime);
fprintf('Overshoot: %f%%\n', info.Overshoot);
fprintf('Peak Response: %f\n', info.Peak);