#include <iostream>
#include <string>
#include <stdexcept>
#include "Customer.h"
#include "Product.h"

using namespace std;

Customer::Customer(int customerID, string name, bool credit) : id(customerID), name(name), credit(credit){
		if (name.length()==0) 
			throw runtime_error("Customer name cannot be empty.");
}

int Customer::getID() const { return  id; }

std::string Customer::getName() const { return name; }

void Customer::setName(std::string name){
 	if (name.length()==0) 
	throw runtime_error("Customer name cannot be empty.");
	this->name = name; // could use an else, but it will only get here
					   //   if there was not an exception!
 //string autograder = " ";
 //return " " ;
}

bool Customer::getCredit() const{ return credit;}

void Customer::setCredit(bool hasCredit){
 	this-> credit = credit;
}

double Customer::getBalance() const {return balance;}

void Customer::processPayment(double amount){
 this-> balance += amount;
}
 
void Customer::processPurchase(double amount, Product product){
if (hasCredit){
        balance -= amount;
    }
    else {
        if (balance >= amount){
            balance -= amount;
        }
        else {
            throw runtime_error("Negative amount");
        }
    }
    if (amount < 0){
        throw runtime_error("Negative amount");
        
    }
    productsPurchased.push_back(product);

}

std::string Customer::getProductsPurchased(ostream& os) const{ 
	for (int i = 0; i < productsPurchased.size(); i++){
        os << productsPurchased.at(i) << " ";
    }
}

ostream& operator << (ostream& os, const Customer& c){
    os <<  "Customer name: " << c.getName() << "\t" << "Customer ID: " << 	c.getID() << "Customer credit: " << c.getCredit();
    return os;
}

ostream& operator << (ostream& os, const Product& p){
    os <<  "Product name: " << p.getID() << "\t" << "Product ID: " << 		p.getName();
    return os;
}

