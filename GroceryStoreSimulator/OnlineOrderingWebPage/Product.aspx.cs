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
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Add astetic text to the header
        Order order = new Order();
        order = (Order)Session["order"];
        lblStoreName.Text = order.store.storeName;
        lblLoyaltyLogin.Text = order.login.login;
        string storeName = lblStoreName.Text.Trim();

        
    }

    public void CreateOrderOnDatabase(Order order)
    {
        // Create new SqlConnection using ConnectionString in Web.Config
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryStoreSimulatorConnectionString"].ConnectionString);

        // Create new SqlCommand
        SqlCommand comm = new SqlCommand("spAddOrder", conn);

        // Set command type to stored procedure
        comm.CommandType = CommandType.StoredProcedure;

        // Create new DataTable for our Query and query it for the loyaltyID
        DataTable dt = new DataTable();
        dt = QueryGroceryStoreSimulator.QueryGroceryStoreSimulatorDataTable(("SELECT LoyaltyID FROM tLoyalty WHERE LoyaltyNumber = '" + order.login.login + "'"));

        // Create loyaltyID and set it to the returned loyaltyID
        string loyaltyID = dt.Rows[0][0].ToString();

        // Get StoreID
        dt = QueryGroceryStoreSimulator.QueryGroceryStoreSimulatorDataTable(("SELECT StoreID FROM tStore WHERE Store = '" + order.store.storeName + "'"));
        string storeID = dt.Rows[0][0].ToString();

        // Add params to command
        comm.Parameters.Add("@OrderID", SqlDbType.Int).Direction = ParameterDirection.Output;
        comm.Parameters.Add("@LoyaltyID", SqlDbType.Int).Value = loyaltyID;
        comm.Parameters.Add("@StoreID", SqlDbType.Int).Value = storeID;
        comm.Parameters.Add("@DeliveryCharge", SqlDbType.Int).Value = 0;
        comm.Parameters.Add("@OrderStatusID", SqlDbType.Int).Value = 1;
        
        
        // Create return variable
        //var returnParam = comm.Parameters.Add("@OrderID", SqlDbType.Int);
        //returnParam

        // Open Connection
        conn.Open();

        // Run command and save the OrderNumber
        comm.ExecuteNonQuery();
        order.orderNumber = comm.Parameters["@OrderID"].Value.ToString();

        // Close Connection
        conn.Close();

        

        
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

    //Runs on button click within the tile that product is in
    protected void lvProductsFromSelectedStore_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Button btnName = (Button)e.Item.FindControl("btnSelect");
        string productName = btnName.Text;
        Label lblProductBrand = (Label)e.Item.FindControl("BrandLabel");
        Label lblPricePerSellableUnit = (Label)e.Item.FindControl("PricePerSellableUnitLabel");
        TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");

        string shopingList = productName + " - " + lblProductBrand.Text + " " + lblPricePerSellableUnit.Text + " x" + txtQuantity.Text;
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
            //The string is broken into its parts for name, price, and quantity
            productPriceAndQuantity = value.Split('$', 'x');
            productsArray[count] = product(productPriceAndQuantity[0], productPriceAndQuantity[1], productPriceAndQuantity[2]);
            Array.Clear(productPriceAndQuantity, 0, 3);
            count = count + 1;
        }
        //Add the list to the order session
        products = productsArray.ToList<Product>();
        Order order = new Order();
        order = (Order)Session["order"];
        order.products = products;
        Session["order"] = order;

        // Create an order on the database
        CreateOrderOnDatabase(order);

        // Go to FinalOrder page
        Response.Redirect("FinalOrder.aspx");
    }

    //Creates each indiviual product object
    public Product product(string productName, string pricePerSellableUnit, string quantity)
    {
        Product product = new Product();
        product.productName = productName.Trim();
        product.pricePerSellableUnit = Convert.ToDouble(pricePerSellableUnit);
        product.quantity = Convert.ToInt32(quantity);

        return product;
    }
}