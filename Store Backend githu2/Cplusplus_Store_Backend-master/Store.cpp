#include <string>
#include <vector>
#include <stdexcept>
#include "Store.h"
#include "Product.h"
#include "Customer.h"

using namespace std;

Store::Store(string name): name(name) {}
Store::Store(): name("") {}
string Store::getName(){return this->name;}
void Store::setName(string name){this->name = name;}
void Store::addProduct(int productID, string productName){
	Product newProduct(productID, productName);
	for(int i = 0; i < this->products.size(); i++){
		if(this->products.at(i).getID() == productID){
			throw runtime_error("Product ID is already being used.");
		}
	}
	this->products.push_back(newProduct);
}
void Store::addCustomer(int& customerID, string& customerName){
	Customer newCustomer(customerName, customerID);
	for(int i = 0; i < this->customers.size(); i++){
		if(this->customers.at(i).getID() == customerID){
			throw runtime_error("Customer ID is already being used.");
		}
	}
	this->customers.push_back(newCustomer);
}
void Store::addCustomer(int& customerID, string& customerName, bool credit){
	Customer newCustomer(customerName, customerID, credit);
	for(int i = 0; i < this->customers.size(); i++){
		if(this->customers.at(i).getID() == customerID){
			throw runtime_error("Customer ID is already being used.");
		}
	}
	this->customers.push_back(newCustomer);
}
Product& Store::getProduct(int productID){
	for(int i = 0; i < products.size(); i++){
    	if(this->products.at(i).getID() == productID){
      		return products.at(i);
    	}
    }
 	throw runtime_error("Product not found.");
}
Customer& Store::getCustomer(int customerID){
	for(int i = 0; i < customers.size(); i++){
    	if(this->customers.at(i).getID() == customerID){
      		return customers.at(i);
    	}
    }
 	throw runtime_error("Customer not found.");
}
void Store::takeShipment(int productID, int quantity, double cost){
	Product& curr = getProduct(productID);
 	curr.addShipment(quantity, cost);
}
void Store::makePurchase(int customerID, int productID, int quantity){
	Customer& cust = getCustomer(customerID); //If it cannot get a customer, throws an exception.
 	Product&  prod = getProduct(productID);   //If it cannot get a product, throws an exception.
 	double cost = prod.getPrice() * quantity;
 
	if(cust.getBalance() >= cost || cust.getCredit()){ //Checks if the customer has sufficient balance or credit.
  		if(prod.getInventoryCount() >= quantity){      //Checks if the store has sufficient inventory.
         	cust.processPurchase(cost, prod);
        	prod.reduceInventory(quantity);            //Reduces inventory for purchase.
        }
     	else
        	throw runtime_error("Not enough product in inventory.");
  	}
 	else
    	throw runtime_error("Customer balance is insufficient for purchase");
}
void Store::takePayment(int customerID, double amount){
	Customer& cust = getCustomer(customerID);
 	cust.processPayment(amount); 
}
void listProducts(){
//Lists products
}
void listCustomers(){
//Lists customers
}

