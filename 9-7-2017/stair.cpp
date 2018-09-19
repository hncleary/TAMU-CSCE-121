#include <iostream>
using namespace std;

int main() {
	int no_lines = 25;
	for (int i=no_lines; i>=1; --i) {
		for (int k=1; k<=(no_lines - i); ++k) {
			cout << " ";
		}
		for (int j=1; j<=i; ++j) {
			cout << "*";
		}
		cout << endl << endl << endl << endl;
	}
	system("pause");
}