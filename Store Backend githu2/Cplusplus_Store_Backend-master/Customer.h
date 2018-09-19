#ifndef CUSTOMER_H
#define CUSTOMER_H

#include <string>
#include <vector>
#include "Product.h"

using namespace std;

class Customer{
	int    customerID;
	string name;
	bool   credit;
	double balance;
	vector<Product> productsPurchased;
public:
	friend std::ostream& operator<<(std::ostream& os, const Customer& customer);
	Customer(string name, int customerID, bool credit);
	Customer(string name, int customerID);
	string getName();
	void   setName(string name);
	int    getID();
	bool   getCredit();
	void   setCredit(bool hasCredit);
	double getBalance();
	void   processPayment(double amount);
	void   processPurchase(double amount, Product product);
	void   listProductsPurchased(ostream &os);
};

#endif
