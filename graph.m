% Define the exact function
syms x;
y_exact = x^2;
% Define integration limits
a = 1;
b = 3;
% Calculate exact integral
exact_integral = double(int(y_exact, x, a, b));
disp(['Exact integral value: ', num2str(exact_integral)]);
% Define step sizes to test
h_values = [1, 0.5, 0.25];
% Initialize arrays to store results
trap_results = zeros(size(h_values));
simp_results = zeros(size(h_values));
trap_errors = zeros(size(h_values));
simp_errors = zeros(size(h_values));
% Calculate approximations and errors for each h
for i = 1:length(h_values)
h = h_values(i);
x_vals = a:h:b;
y_vals = x_vals.^2;
% Trapezoidal rule
trap_results(i) = (h/2)*(y_vals(1) + 2*sum(y_vals(2:end-1)) + y_vals(end));
trap_errors(i) = abs(exact_integral - trap_results(i));
% Simpson's rule (requires even number of intervals)
num_intervals = length(x_vals) - 1;
if mod(num_intervals, 2) == 0
simp_results(i) = (h/3)*(y_vals(1) + 4*sum(y_vals(2:2:end-1)) +
2*sum(y_vals(3:2:end-2)) + y_vals(end));
simp_errors(i) = abs(exact_integral - simp_results(i));
else
simp_results(i) = NaN;
simp_errors(i) = NaN;
end
end
% Display results in a table
results_table = table(h_values', trap_results', simp_results', trap_errors',
simp_errors', ...
'VariableNames', {'StepSize', 'Trapezoidal', 'Simpsons', 'TrapError',
'SimpError'});
disp(results_table);% Plot results
figure;
% Approximation vs Exact Value
subplot(2,1,1);
plot(h_values, trap_results, 'bo-', 'LineWidth', 1.5, 'DisplayName',
'Trapezoidal');
hold on;
plot(h_values, simp_results, 'ro-', 'LineWidth', 1.5, 'DisplayName',
'Simpson''s');
yline(exact_integral, 'k--', 'LineWidth', 1.5, 'DisplayName', 'Exact Value');
xlabel('Step Size (h)');
ylabel('Integral Value');
title('Numerical Integration Approximations');
legend('Location', 'best');
grid on;
% Error Analysis (Log Scale)
subplot(2,1,2);
loglog(h_values, trap_errors, 'bo-', 'LineWidth', 1.5, 'DisplayName', 'Trapezoidal
Error');
hold on;
loglog(h_values, simp_errors, 'ro-', 'LineWidth', 1.5, 'DisplayName', 'Simpson''s
Error');
xlabel('Step Size (h)');
ylabel('Absolute Error (Log Scale)');
title('Error Analysis');
legend('Location', 'best');
grid on;
