//
//  store.h
//  store
//
//  Created by Polina Golikova on 11/01/16.
//  Copyright © 2016 Polina Golikova. All rights reserved.
#ifndef store_h
#define store_h
#include <iostream>
#include <stdbool.h>
#include <stdexcept>
#include "product.h"
#include "customer.h"
#include <vector>

class Store{
    std::string sname;
    int productID;
    std::string productName;
    int customerID;
    std::vector<Product> products;
    std::vector<Customer> customer;
    int quantity;
    double cost;
    double amount;

public:
    Store();
    Store(std::string name);
    std::string getName();
    void setName(std::string name);
    void addProduct(int productID, std::string productName);
    void addCustomer(int customerID, std::string customerName);
    // part 3
    Product& getProduct(int productID);
    Customer& getCustomer(int customerID);
    void takeShipment(int productID, int quantity, double cost);
    void makePurchase(int customerID, int productID, int quantity);
    void takePayment(int customerID, double amount);
    void listProducts()const;
    void listCustomers()const;
    friend const Product& operator<<(std::ostream& os, Product& product);
    friend const Customer& operator<<(std::ostream& os, Customer& customer);

};
#endif /* store_h */
