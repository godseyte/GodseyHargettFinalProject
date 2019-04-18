﻿/*
 * Tucker Godsey
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Models an Order
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryStoreSimulator
{
    class Order
    {
        // Properties
        private Login mLogin; // Login Info
        private Store mStore; // Selected Store
        private List<Product> mProducts; // List of Products
        private string mOrderNumber; // Order Number
        private string mOrderStatus; // Status of Order

        // Accessors
        public Login login
        {
            get { return mLogin; }
            set { mLogin = value; }
        }

        public Store store
        {
            get { return mStore; }
            set { mStore = value; }
        }

        public List<Product> products
        {
            get { return mProducts; }
            set { mProducts = value; }
        }
    }
}
