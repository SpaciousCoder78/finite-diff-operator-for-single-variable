% Given data points
x = [1, 2, 3];
y = [1, 4, 9]; % y = x^2
% Newton's forward interpolation formula
% f(n) = Y_0 + P * ΔY_0 + (P*(P-1)/2) * Δ^2Y_0
% P = (n - x0) / h, where h is the step size
h = 1; % Step size
x0 = x(1); % Initial x value
P = @(n) (n - x0) / h;
% Compute the forward differences
delta_y = diff(y);
delta2_y = diff(delta_y);
% Define the interpolation function
f = @(n) y(1) + P(n) * delta_y(1) + (P(n) * (P(n) - 1)) / 2 * delta2_y(1);
% Display the interpolation function
disp('Interpolation function f(n):');
disp(f);
% Evaluate the interpolation function at a specific point (e.g., n = 2.5)
n_value = 2.5;
f_value = f(n_value);
disp(['Interpolated value at n = ', num2str(n_value), ':']);
disp(f_value);
% Numerical integration using the trapezoidal rule
integral_trapezoidal = (h / 2) * (y(1) + y(3) + 2 * y(2));
disp('Numerical integration using trapezoidal rule:');
disp(integral_trapezoidal);
% Numerical integration using Simpson's 1/3 rule
integral_simpson = (h / 3) * (y(1) + y(3) + 4 * y(2));
disp('Numerical integration using Simpson''s 1/3 rule:');
disp(integral_simpson);
% Verification: Analytical integration of y = x^2 from 1 to 3
syms x_analytical;
y_analytical = x_analytical^2;
integral_analytical = int(y_analytical, x_analytical, 1, 3);
disp('Analytical integration of y = x^2 from 1 to 3:');
disp(double(integral_analytical));