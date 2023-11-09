% Define the function and its derivative
syms x;
f = x^3 - 2*x^2 - 5;
f_prime = diff(f, x);

% Define the initial guess and maximum number of iterations
x0 = 3;
max_iterations = 10;

% Initialize variables to store roots and tangent lines
roots = zeros(max_iterations, 1);
tangent_x = zeros(max_iterations, 2);
tangent_y = zeros(max_iterations, 2);

for i = 1:max_iterations
    % Calculate the next root using the Newton-Raphson method
    roots(i) = x0 - double(subs(f, x, x0) / subs(f_prime, x, x0));
    
    % Calculate the tangent line at the current root
    tangent_x(i, :) = [x0 - 2, x0 + 2];
    tangent_y(i, :) = double(subs(f_prime, x, x0) * (tangent_x(i, :) - x0) + subs(f, x, x0));
    
    % Update the initial guess for the next iteration
    x0 = roots(i);
end

% Plot the equation and roots
x_values = linspace(-2, 5, 1000);
y_values = double(subs(f, x, x_values));

figure;
plot(x_values, y_values, 'LineWidth', 2);
hold on;
scatter(roots, zeros(max_iterations, 1), 'ro', 'filled');

% Plot tangent lines
for i = 1:max_iterations
    plot(tangent_x(i, :), tangent_y(i, :), '--', 'Color', [0, 0, 0] + i/(max_iterations+1));
end

title('Newton-Raphson Root Finding');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Roots', 'Tangent Lines');
grid on;
