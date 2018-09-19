#include <iostream>
using namespace std;

int main() {
	double a, b, c;
	cin >> a >> b >> c;
	cout << a << "x^2 + " << b << "x + " << c << " = 0" << endl;
	if (a==0) {
		cout << "Not a quadratic Equation";
		return 0;
	}
	double disc = b*b - 4*a*c;

	system("pause");
}