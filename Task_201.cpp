#include<bits/stdc++.h>
using namespace std;

vector<double> gaussElimination(vector<vector<double>> matA, vector<double> vecB) {
    int n = matA.size();
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            double factor = matA[j][i] / matA[i][i];
            for (int k = i; k < n; k++) {
                matA[j][k] -= factor * matA[i][k];
            }
            vecB[j] -= factor * vecB[i];
        }
    }

    vector<double> coefficients(n);
    for (int i = n - 1; i >= 0; i--) {
        coefficients[i] = vecB[i];
        for (int j = i + 1; j < n; j++) {
            coefficients[i] -= matA[i][j] * coefficients[j];
        }
        coefficients[i] /= matA[i][i];
    }
    return coefficients;
}

double calculateVelocity(double time, const vector<double>& coefficients) {
    return coefficients[0]*time*time + coefficients[1]*time + coefficients[2];
}

int main() {
    vector<vector<double>> matrixA = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
    vector<double> vectorB = {106.8, 177.2, 279.2};

    vector<double> coeffs = gaussElimination(matrixA, vectorB); 

    cout << "The coefficients are: " << endl;
    cout << "a1 = "<< coeffs[0] << ", "<<"a2 = " << coeffs[1] << ", " <<"a3 =" << coeffs[2] << endl;

    double velocity = calculateVelocity(6, coeffs);

    cout << "The velocity at t=6th seconds is: " << velocity << " m/s" << endl;

    return 0;
}
