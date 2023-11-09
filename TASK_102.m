% Define the function
f = @(x) x.^3 - x.^2 + 2; % replace with your function

% Define the interval [a, b]
a = -200; % replace with your interval start
b = 200;  % replace with your interval end

% Tolerance
tol = 1e-6; % replace with your tolerance

% Initialize the matrix to store roots
roots = [];

% Bisection Method
while ((b-a) >= tol)
    c = (a+b)/2;

    % Check if middle point is root
    if (f(c) == 0.0)
        break;
    % Decide the side to repeat the steps
    elseif (f(c)*f(a) < 0)
        b = c;
    else
        a = c;
    end
    
    % Store the root of this iteration
    roots = [roots; c];
end

% Plot the function
fplot(f);
hold on;

% Plot the roots
plot(roots, f(roots), 'ro');
hold off;

% Display the roots
disp('The roots found at each iteration are:');
disp(roots);
