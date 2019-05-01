using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FinalOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Temporary Testing
        try
        {
            // Create a new Order and attach it to the session order
            Order order = new Order();
            order = (Order)Session["order"];

            // Print object ordered at top of page for testing reasons
            for (int i = 0; order.products.Count > i; i++)
            {
                Response.Write(order.products[i].productName + " - ");
            }

            // Change Header Texts
            lblLoyaltyNumberHeader.Text = order.login.login;
            lblLoyaltyNumberCardHead.Text = order.login.login;

            // Test add a new product
            //order.products.Add(new Product("Bagel", 0.99, 2));
            //order.products.Add(new Product("Goal", 2000.00, 90));

            // Create Row and Cell variables to hold our product info
            //TableRow newRow = new TableRow();
            TableCell cellItem = new TableCell();
            TableCell cellQuantity = new TableCell();
            TableCell cellPrice = new TableCell();

            // Loop through the products and attach the information to the cells, add cells to the row, and add row to the table
            for (int i = 0;  order.products.Count > i; i++)
            {
                TableRow newRow = new TableRow();

                // Attach info to Cells
                cellItem.Text = order.products[i].productName;
                cellQuantity.Text = order.products[i].quantity.ToString();
                cellPrice.Text = order.products[i].pricePerSellableUnit.ToString();

                // Attach cells to row
                newRow.Cells.Add(cellItem);
                newRow.Cells.Add(cellQuantity);
                newRow.Cells.Add(cellPrice);

                // Add row to Table
                tblProducts.Rows.Add(newRow);
            }
        }
        catch (Exception ex)
        {
            lblLoyaltyNumberHeader.Text = "Ruh Roh Raggy n/" + ex;
        }
        
        
    }
}