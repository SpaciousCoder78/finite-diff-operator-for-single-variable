% Given data points
x = [1, 2, 3];
y = [1, 4, 9];
% First-order derivatives (central differences where possible)
dy_dx = zeros(1, length(x));
dy_dx(1) = (y(2) - y(1)) / (x(2) - x(1)); % Forward difference at x=1
dy_dx(2) = (y(3) - y(1)) / (x(3) - x(1)); % Central difference at x=2
dy_dx(3) = (y(3) - y(2)) / (x(3) - x(2)); % Backward difference at x=3
% Second-order derivatives (using central differences)
d2y_dx2 = zeros(1, length(x));
d2y_dx2(2) = (y(3) - 2*y(2) + y(1)) / (x(2) - x(1))^2; % Central difference at x=2
% Display results
disp('First-order derivatives (dy/dx):');
disp(dy_dx);
disp('Second-order derivative (d²y/dx² at x=2):');
disp(d2y_dx2(2));