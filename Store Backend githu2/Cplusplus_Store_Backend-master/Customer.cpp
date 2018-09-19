#include <string>
#include <vector>
#include <stdexcept>
#include <iostream>
#include "Customer.h"

using namespace std;

Customer::Customer(string name, int customerID, bool credit): name(name), customerID(customerID), credit(credit) {}
Customer::Customer(string name, int customerID): name(name), customerID(customerID), credit(false) {}
bool   Customer::getCredit(){return this->credit;}
int    Customer::getID(){return this->customerID;}
string Customer::getName(){return this->name;}
double Customer::getBalance(){return this->balance;}
void   Customer::setCredit(bool hasCredit){this->credit = hasCredit;}
void   Customer::setName(string name){this->name = name;}
void   Customer::processPayment(double amount){
	if(amount < 0)
		throw runtime_error("Negative amount added to Balance.");
	else
		this->balance += amount;
}
void   Customer::processPurchase(double amount, Product product){
	if(amount < 0)
		throw runtime_error("Trying to process a negative amount of products.");
	if(this->credit == true){
		this->balance -= amount;
		this->productsPurchased.push_back(product);
		//Also, check if the product is within the list
	}
	else{
		if(this->balance >= amount){
			this->balance -= amount;
			this->productsPurchased.push_back(product);
			//Also, check if the product is within the list.
		}
		else
			throw runtime_error("Purchase amount greater than available balance.");
	}
}
void Customer::listProductsPurchased(ostream& os){
 	for(int i = 0; i < this->productsPurchased.size();i++){
    	os << this->productsPurchased.at(i) << '\n';
    }
}
ostream& operator<<(ostream& os,const Customer& customer){
 	os << "Customer: {" << endl;
 	os << "    name = " << customer.name << endl;
 	os << "    id = "   << customer.customerID << endl;
 	os << "    credit = " << customer.credit << endl;
	os << "}";
 
	return os;
}
