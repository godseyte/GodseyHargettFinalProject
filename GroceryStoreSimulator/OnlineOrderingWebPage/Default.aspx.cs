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

    // Query GroceryStoreSimulator and return the reader
    private DataTable QueryGroceryStoreSimulator (string query)
    {
        // New SQL Connection
        SqlConnection cnn;

        // New Connection String
        string connetionString = ConfigurationManager.ConnectionStrings["GroceryStoreSimulatorConnectionString"].ConnectionString;

        // Instantiate the SQL Connection with Connection String
        cnn = new SqlConnection(connetionString);

        // Create a SqlCommand with the input Query
        SqlCommand command = new SqlCommand(query, cnn);

        cnn.Open();

        // Create a SqlDataReader and tie it to the query
        //SqlDataReader reader = command.ExecuteReader();

        // Create a DataTable to store all data and a SqlDataAdapter to fill the DataTable
        DataTable dataTable = new DataTable();

        // Fill the DataTable
        //da.Fill(dataTable);
        dataTable.Load(command.ExecuteReader());

        cnn.Close();

        return dataTable;
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
            DataTable returnedData = QueryGroceryStoreSimulator("SELECT LoyaltyNumber FROM tLoyalty WHERE LoyaltyNumber = '" + inputLoyaltyNumber + "'");

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


        // Create new Login object
        Login newLogin = new Login(txtLoyaltyNumberInput.Text, false);

    }
}