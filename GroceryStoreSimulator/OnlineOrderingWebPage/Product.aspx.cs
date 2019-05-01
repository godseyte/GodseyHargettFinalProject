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
        Order order = new Order();
        order = (Order)Session["order"];
        lblStoreName.Text = order.store.storeName;
        lblLoyaltyLogin.Text = order.login.login;
        string storeName = lblStoreName.Text.Trim();
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

    protected void lvProductsFromSelectedStore_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Button btnProductName = (Button)e.Item.FindControl("btnSelect");
        Label lblProductName = new Label();
        lblProductName.Text = btnProductName.Text;
        Label lblPricePerSellableUnit = (Label)e.Item.FindControl("PricePerSellableUnitLabel");
        TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");

        string shopingList = lblProductName.Text + " " + lblPricePerSellableUnit.Text + " x" + txtQuantity.Text;
        blShoppingCart.Items.Add(shopingList);//add to the shopping cart list on the html page
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
        List<Product> products = new List<Product>();//list of products to go in the orderpage
        Product[] productsArray = new Product[blShoppingCart.Items.Count];
        string[] shoppingCart = new string[blShoppingCart.Items.Count];//string for the items in the shoping cart
        for (int i = 0; i < blShoppingCart.Items.Count; i++)
        {
            shoppingCart[i] = blShoppingCart.Items[i].Text;
        }
        string[] productPriceAndQuantity = new string[3];
        int count = 0;
        foreach (string value in shoppingCart)
        { 
            productPriceAndQuantity = value.Split('$', 'x');
            productsArray[count] = product(productPriceAndQuantity[0], productPriceAndQuantity[1], productPriceAndQuantity[2]);
            Array.Clear(productPriceAndQuantity, 0, 3);
            count = count + 1;
        }
        products = productsArray.ToList<Product>();
        Order order = new Order();
        order = (Order)Session["order"];
        order.products = products;
        Session["order"] = order;
        Response.Redirect("FinalOrder.aspx");
    }

    public Product product(string productName, string pricePerSellableUnit, string quantity)
    {
        Product product = new Product();
        product.productName = productName.Trim();
        product.pricePerSellableUnit = Convert.ToDouble(pricePerSellableUnit);
        product.quantity = Convert.ToInt16(quantity);

        return product;
    }
}