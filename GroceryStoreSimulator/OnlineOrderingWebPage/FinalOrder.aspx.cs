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

        // Create a new Order and attach it to the session order
        Order order = new Order();
        order = (Order)Session["order"];

        // Create a double for the total price of the order
        double totalPrice = 0;

        // Create a double to hold the cost of the product multiplied by the quantity
        double itemTotalPrice = 0;

        // Change order number and store name labels
        lblOrderNumber.Text = "TEST ORDER NUMBER";
        lblStoreName.Text = order.store.storeName;

        // Change Header Texts
        lblLoyaltyNumberHeader.Text = order.login.login;
        lblLoyaltyNumberCardHead.Text = order.login.login;

        // Loop through the products and attach the information to the cells, add cells to the row, and add row to the table. Add cost to total price
        for (int i = 0; order.products.Count > i; i++)
        {
            // Reset itemTotalPrice
            itemTotalPrice = 0;

            // Multiple an items cost by its quantity
            itemTotalPrice = (order.products[i].quantity * order.products[i].pricePerSellableUnit);

            // Add the items total price to the total price of the order
            totalPrice += itemTotalPrice;

            // use AddRowToProductTable to add a row to the Product Table
            AddRowToProductTable(order.products[i].productName, order.products[i].quantity, itemTotalPrice);
        }

        // Change the total cost label to the total cost of the order
        lblTotalCost.Text = "$" + totalPrice.ToString();


    }

    public void AddRowToProductTable(string itemName, int itemQuantity, double itemTotalCost)
    {
        // Rows and Cells
        TableRow newRow = new TableRow();
        TableCell cellItem = new TableCell();
        TableCell cellQuantity = new TableCell();
        TableCell cellPrice = new TableCell();

        // Add data to cells
        cellItem.Text = itemName;
        cellQuantity.Text = itemQuantity.ToString();
        cellPrice.Text = itemTotalCost.ToString(); // Multiply Cost by Quantity

        // Add cells to row
        newRow.Cells.Add(cellItem);
        newRow.Cells.Add(cellQuantity);
        newRow.Cells.Add(cellPrice);

        // Add row to table
        tblProducts.Rows.Add(newRow);
    }
}