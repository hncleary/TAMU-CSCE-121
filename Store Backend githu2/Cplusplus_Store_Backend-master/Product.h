#ifndef PRODUCT_H
#define PRODUCT_H

#include <string>

using namespace std;

class Product{
	int    productID;
	string name;
	string description;
	int    inventory;
	int    numSold;
	double totalPaid;
public:
	friend ostream& operator<<(ostream& os, const Product& product);
	Product(int productID, string productName);
	string getDescription();
	void   setDescription(string description);
	string getName();
	int    getID();
	int    getNumberSold();
	double getTotalPaid();
	int    getInventoryCount();
	void   addShipment(int shipmentQuantity, double shipmentCost);
	void   reduceInventory(int purchaseQuantity);
	double getPrice();	
};

#endif
