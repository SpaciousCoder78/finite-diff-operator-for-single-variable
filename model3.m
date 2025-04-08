% Given data points
x = [1, 2, 3];
y = [1, 4, 9]; % y = x^2
% Compute forward differences (Δy)
delta_y = diff(y);
% Compute the first-order derivative using the corrected formula
% y'(i) = (1/2) * [Δy_0 + i]
% Here, Δy_0 is the first forward difference, and i = 1
delta_y0 = delta_y(1); % Δy_0 = 3
i = 1; % As per the formula
y_prime = (1/2) * (delta_y0 + i);
% Display the result
disp('Computed first-order derivative:');
disp(y_prime);
% Verification: Analytical derivative of y = x^2
syms x_analytical;
y_analytical = x_analytical^2;
dy_dx_analytical = diff(y_analytical, x_analytical);
% Evaluate the analytical derivative at x = 1
dy_dx_value = double(subs(dy_dx_analytical, x_analytical, 1));
disp('Analytical first-order derivative at x = 1:');
disp(dy_dx_value);
% Check if the computed derivative matches the analytical derivative
tolerance = 1e-5;
if abs(y_prime - dy_dx_value) < tolerance
disp('The computed derivative matches the analytical derivative.');
else
disp('The computed derivative does not match the analytical derivative.');
end