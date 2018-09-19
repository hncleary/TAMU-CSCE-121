//
//  Product.h
//  Product
//
//  Created by Polina Golikova on 10/27/16.
//  Copyright © 2016 Polina Golikova. All rights reserved.
//

#ifndef product_h
#define product_h
#include <iostream>
#include <stdbool.h>
#include <stdexcept>

class Product{
    int pID;
    double totalPaid = 0;
    int numSold = 0;
    int inventory = 0;
    std::string pName;
    std::string Description;
    
public:
    Product(int productID, std::string productName);
    std::string getDescription();
    void setDescription(std::string description);
    std::string getName();
    int getID();
    int getID()const;
    std::string getName()const;
    int getNumberSold();
    double getTotalPaid();
    int getInventoryCount();
    void addShipment(int shipmentQuantity, double shipmentCost);
    void reduceInventory(int purchaseQuantity);
    double getPrice();
    friend std::ostream& operator<<(std::ostream& os, const Product& p);
};
#endif /* product_h */
