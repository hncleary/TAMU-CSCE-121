#include <iostream>
#include <string>
#include <math.h>
using namespace std;
int main() {
	//initialize variables
	int birthYear = 0;
	double heightFeet = 0;
	double heightInches = 0;
	double heightCentimeters = 0;
	double heightPerYear = 0;
	int yearsOld = 0;
	string firstName;
	string lastName;
	
	// record information on individual
	// cout << "What is the first name?";
	cin >> firstName >> lastName >> birthYear >> heightFeet >> heightInches;

	// calculate age and hieght in cm
	yearsOld = 2017 - birthYear;
	heightCentimeters = (heightFeet * 12 * 2.54) + (heightInches * 2.54);
	heightPerYear = heightCentimeters / yearsOld;

	//output statement with final values
	//cout << firstName << lastName << birthYear << heightFeet << heightInches;
	cout << "Hello " << firstName << " " << lastName << "." << "You are " << yearsOld << " in 2017, and you height is " << heightCentimeters << "cm. That means that you grew an average of " << heightPerYear << " cm per year (assuming you were 51 cm at birth).";

	
	system("pause");

	return 0;
}