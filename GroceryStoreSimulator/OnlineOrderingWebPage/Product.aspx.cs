/*
 * Alex Hargett
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Shopping Cart
 */
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //dsProductsFromSelectedStore.Select("");
        //Order order = new Order();
        //order = (Order)Session["order"];
        //lblStore.Text = order.store.storeName;

    }

    //This method is triggerd whenever an item is clicked in the listview we will use
    //this trigger to add an item to the shopping cart
    protected void lvProductsFromSelectedStore_SelectedIndexChanged(object sender, EventArgs e)
    {
        //grab the name of the store that is clicked
        string pricePerSellableUnit = ConvertToCurrency(lvProductsFromSelectedStore.DataKeys[lvProductsFromSelectedStore.SelectedIndex].Values["PricePerSellableUnit"].ToString());
        //create a listItem that can be added to an html control
        ListItem shopingList = new ListItem(lvProductsFromSelectedStore.SelectedValue.ToString() + " " + pricePerSellableUnit);
        blShoppingCart.Items.Add(shopingList);//add to the shopping cart list on the html page
    }

    //This method allows you to alter the data gathered by the datasource before it is presented
    protected void lvProductsFromSelectedStore_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        //create a label that is set to the label in the listview for the product price
        Label lblPricePerSellableUnit = (Label)e.Item.FindControl("PricePerSellableUnitLabel");
        lblPricePerSellableUnit.Text = ConvertToCurrency(lblPricePerSellableUnit.Text);

        //This updates the tile that is altered in the above code
        DataRowView rowView = e.Item.DataItem as DataRowView;
        string pricePerSellableUnit = rowView["PricePerSellableUnit"].ToString();
    }

    //This method is to convert the string of price to a US curency format
    public string ConvertToCurrency(string pricePerSellableUnit)
    {
        //Turn the string into a double which has a nifty toString param that formats into currency
        double pricePerSellableUnitDouble;
        pricePerSellableUnitDouble = Convert.ToDouble(pricePerSellableUnit);
        pricePerSellableUnit = pricePerSellableUnitDouble.ToString("C2");

        return pricePerSellableUnit;
    }

    //Button to procced to the checkout/order page
    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        /*
        List<Product> products = new List<Product>();//list of products to go in the orderpage
        string[] shoppingCart = new string[blShoppingCart.Items.Count];//string for the items in the shoping cart
        blShoppingCart.Items.CopyTo(shoppingCart, 0);//takes the bulleted list and copies it to an array
        Product product = new Product();//Each product becomes a product object
        string[] productAndPrice = new string[2];
        foreach (string value in shoppingCart)
        {
            productAndPrice = value.Split(' ');
            product.productName = productAndPrice[0];
            product.pricePerSellableUnit = Convert.ToDouble(productAndPrice[1]);
            product.quantity = 1;
            products.Add(product);
            Array.Clear(productAndPrice, 0, 2);
        }
        Order order = new Order();
        order = (Order)Session["order"];
        order.products = products;
        Session["order"] = order;
        Response.Redirect("Order.aspx");
        */
    }
}