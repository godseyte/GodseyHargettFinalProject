<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    

        <div class="form-control">
            <asp:ListBox ID="lbStores" runat="server" DataSourceID="GroceryStoreSimulator" DataTextField="Store" DataValueField="Store"></asp:ListBox>
            <asp:SqlDataSource ID="GroceryStoreSimulator" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT [Store] FROM [tStore]"></asp:SqlDataSource>
        </div>

    </form>
</body>
</html>
