% Define the function for which you want to find the root
f = @(x) x^3 - 4*x^2 + 3*x;

% Define the initial interval [a, b] where the root is expected
a = 0;
b = 2;

% Define the tolerance (stop when the absolute error is smaller than this)
tolerance = 1e-6;

% Maximum number of iterations to avoid infinite loops
maxIterations = 100;

% Initialize variables
roots = [];  % Matrix to store roots at each iteration
errors = []; % Matrix to store errors at each iteration

% Main False-Position loop
for iteration = 1:maxIterations
    fa = f(a);
    fb = f(b);
    
    % Calculate the new approximation for the root
    c = (a * fb - b * fa) / (fb - fa);
    fc = f(c);
    
    % Store the root and error in their respective matrices
    roots = [roots; c];
    errors = [errors; abs(fc)];
    
    % Check for convergence
    if abs(fc) < tolerance
        break;
    end
    
    % Update the interval [a, b]
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
end

% Display the roots and errors
disp('Roots at each iteration:');
disp(roots);
disp('Errors at each iteration:');
disp(errors);

% Plot the equation and the roots
x = linspace(0, 2, 1000);
y = f(x);
plot(x, y, 'b', roots, f(roots), 'ro');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Roots');
grid on;

% Optionally, display the final root
disp(['Approximate root: ', num2str(roots(end))]);
