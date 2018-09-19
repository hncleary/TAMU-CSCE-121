#ifndef STORE_H
#define STORE_H

#include <string>
#include <vector>
#include "Product.h"
#include "Customer.h"

class Store{
	vector<Product>  products;
	vector<Customer> customers;
	string name;
public:
	Store();
	Store(string name);
	string getName();
	void setName(string name);
	void addProduct(int productID, string productName);
	void addCustomer(int& customerID, string& customerName);
	void addCustomer(int& customerID, string& customerName, bool credit);
	Product& getProduct(int productID);
	Customer& getCustomer(int customerID);
	void takeShipment(int productID, int quantity, double cost); 
	void makePurchase(int customerID, int productID, int quantity);
	void takePayment(int customerID, double amount);
	void listProducts();
	void listCustomers();
};

#endif
