#include <string>
#include <stdexcept>
#include <iostream>
#include "Product.h"

using namespace std;
Product::Product(int productID, string name): productID(productID), name(name), inventory(0), totalPaid(0), numSold(0), description("") {} //constructor
string Product::getDescription(){return this->description;}
string Product::getName(){return this->name;}
int    Product::getID(){return this->productID;}
int    Product::getNumberSold(){return this->numSold;}
double Product::getTotalPaid(){return this->totalPaid;}
int    Product::getInventoryCount(){return this->inventory;}
void   Product::setDescription(string description){this->description = description;}
void   Product::addShipment(int shipmentQuantity, double shipmentCost){
	if(shipmentQuantity < 0 || shipmentCost < 0){
		throw runtime_error("Input a negative shipmentQuantity or shipmentCost.");
	}
	this->inventory += shipmentQuantity;
	this->totalPaid += shipmentCost;
}
void   Product::reduceInventory(int purchaseQuantity){
	if((this->inventory - purchaseQuantity)<0){
		throw runtime_error("Not enough items in inventory.");
	}
	if(purchaseQuantity < 0){
		throw runtime_error("Negative purchaseQuantity.");
	}
	this->inventory -= purchaseQuantity;
	this->numSold    += purchaseQuantity;
}
double Product::getPrice(){
	double tot   = this->inventory + this->numSold;
 	if(tot <= 0){
    	return 0;
    }
	double paid  = this->totalPaid;
	double price = (paid/tot) * 1.25;

	return price;
}
ostream& operator<< (ostream& os, const Product& product){
 	os << "Product " << product.productID << ": ";
 	os << product.name << endl;
	return os;
}
