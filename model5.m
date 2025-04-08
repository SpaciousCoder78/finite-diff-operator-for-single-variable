% Given data
X = [1, 1.5, 2, 2.5, 3]; % X values
Y = [1, 2.25, 4, 6.25, 9]; % Y values
h = 0.5; % Step size
% Trapezoidal Rule
n = length(Y); % Number of data points
trapezoidal_integral = (h/2) * (Y(1) + 2*sum(Y(2:end-1)) + Y(end));
% Simpson’s 1/3 Rule
if mod(n-1, 2) == 0 % Check if the number of intervals is even
simpson_integral = (h/3) * (Y(1) + 4*sum(Y(2:2:end-1)) + 2*sum(Y(3:2:end-2)) +
Y(end));
else
error('Simpson’s 1/3 rule requires an even number of intervals.');
end
% Display results
fprintf('Trapezoidal Rule Integral: %.4f\n', trapezoidal_integral);
fprintf('Simpson’s 1/3 Rule Integral: %.4f\n', simpson_integral);