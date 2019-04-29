using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for QueryGroceryStoreSimulator
/// </summary>
public static class QueryGroceryStoreSimulator
{
    public static DataTable QueryGroceryStoreSimulatorDataTable(string query)
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
}