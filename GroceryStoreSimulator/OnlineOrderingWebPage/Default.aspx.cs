/*
 * Tucker Godsey
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Logins for both Users and Employees
 */

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    
    

    // User Login
    protected void btnLoginUser_Click(object sender, EventArgs e)
    {
        // Gather the input data and use it to create an Order server object.

        // Trim input value and save it to a variable
        string inputLoyaltyNumber = txtLoyaltyNumberInput.Text.Trim();

        // Verify the Loyalty Number exists
        if (inputLoyaltyNumber != "")
        {
            //TODO: Check the database for the Loyalty Number
            DataTable returnedData =  QueryGroceryStoreSimulator.QueryGroceryStoreSimulatorDataTable("SELECT LoyaltyNumber FROM tLoyalty WHERE LoyaltyNumber = '" + inputLoyaltyNumber + "'");

            // Check the DataTable to see if the Loyalty Number is in it
            if (returnedData.Rows.Count > 0)
            {
                if (returnedData.Rows[0][0].ToString().Trim() == inputLoyaltyNumber)
                {
                    // Check if a store is selected
                    if (lbStores.SelectedValue != null)
                    {
                        // Create the login and selected store for the session order
                        Order order = new Order();
                        order = (Order)Session["order"];
                        order.login = new Login(inputLoyaltyNumber, false);
                        order.store = new Store(lbStores.SelectedValue);
                        Session["order"] = order;

                        // Redirect to Order page
                        Response.Redirect("http://localhost:41711/Product.aspx");
                    }
                    else
                    {
                        // Show Incorrect Loyalty Number Error
                        lblError.Text = "Please Select a Store";
                        lblError.Visible = true;
                    }

                    
                }
                else
                {
                    // Show Incorrect Loyalty Number Error
                    lblError.Text = "Incorrect Loyalty Number";
                    lblError.Visible = true;
                }
            }
            else
            {
                // Show Incorrect Loyalty Number Error
                lblError.Text = "Incorrect Loyalty Number";
                lblError.Visible = true;
            }
        }
        else
        {
            // Show Empty Loyalty Number Error
            lblError.Text = "Please Input a Loyalty Number";
            lblError.Visible = true;
        }

    }

    // Employee Login
    protected void btnLoginEmployee_Click(object sender, EventArgs e)
    {
        // Gather the input data and use it to create an Order server object.

        // Trim input value and save it to a variable
        string inputEmployee = txtEmployeeNumber.Text.Trim();

        // Verify the Employee exists
        if (inputEmployee != "")
        {
            //TODO: Check the database for the Employee Number
            DataTable returnedData = QueryGroceryStoreSimulator.QueryGroceryStoreSimulatorDataTable("SELECT Empl FROM tEmpl WHERE Empl = '" + inputEmployee + "'");

            // Check the DataTable to see if the Employee is in it
            if (returnedData.Rows.Count > 0)
            {
                if (returnedData.Rows[0][0].ToString().Trim() == inputEmployee)
                {
                    // Create the login for the session order
                    Order order = new Order();
                    order = (Order)Session["order"];
                    order.login = new Login(inputEmployee, true);
                    Session["order"] = order;

                    // Redirect to Employee page
                    Response.Redirect("http://localhost:41711/Employee.aspx");


                }
                else
                {
                    // Show Incorrect Employee Error
                    lblEmpError.Text = "Incorrect Employee Login";
                    lblEmpError.Visible = true;
                }
            }
            else
            {
                // Show Incorrect Loyalty Error
                lblEmpError.Text = "Incorrect Employee Login";
                lblEmpError.Visible = true;
            }
        }
        else
        {
            // Show Empty Employee Error
            lblEmpError.Text = "Please Input a Employee Login";
            lblEmpError.Visible = true;
        }

    }
}