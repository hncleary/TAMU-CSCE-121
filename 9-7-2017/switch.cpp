#include <iostream>

using namespace std;

int main() {
	const double cm_per_inch = 2.54;
	double input;
	char unit;
	cin >> input;
	cin >> unit;
	
	switch (unit) {
		case 'i':
			cout << input << " inches is " << input * cm_per_inch << " cm" << endl;
			break;
		case 'c':
			cout << input << " cm is " << input / cm_per_inch << " inches" << endl;
			break;
	}
}