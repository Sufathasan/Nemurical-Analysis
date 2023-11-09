% Define two matrices A & B
A = input('Enter the values for matrix A: ');
B = input('Enter the values for matrix B: ');

% Print the max value from matrix A
maxValueA = max(A(:));
fprintf('The maximum value in matrix A is: %d\n', maxValueA);

% Multiply matrix A & B
[rowsA, colsA] = size(A);
[rowsB, colsB] = size(B);

if colsA == rowsB
    C = A * B;
    disp('The result of the multiplication of matrix A and B is:');
    disp(C);
else
    disp('Matrix multiplication is not possible. The number of columns in A must be equal to the number of rows in B.');
end
