% Define symbolic variables
syms x;
y = x^2; % Define the function y = x^2
% First-order derivative
dy_dx = diff(y, x);
% Second-order derivative
d2y_dx2 = diff(y, x, 2);
% Display symbolic results
disp('First-order derivative (dy/dx):');
disp(dy_dx);
disp('Second-order derivative (d²y/dx²):');
disp(d2y_dx2);
% Evaluate derivatives at x = 1
x_value = 1;
dy_dx_value = double(subs(dy_dx, x, x_value));
d2y_dx2_value = double(subs(d2y_dx2, x, x_value));
disp(['First derivative at x = ', num2str(x_value), ':']);
disp(dy_dx_value);
disp(['Second derivative at x = ', num2str(x_value), ':']);
disp(d2y_dx2_value);
% Verify the second derivative
if d2y_dx2_value == 2
disp('The second derivative matches the expected value of 2.');
else
    disp('The second derivative does not match the expected value of 2.');
end