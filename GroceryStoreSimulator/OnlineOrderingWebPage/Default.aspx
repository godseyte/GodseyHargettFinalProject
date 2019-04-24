<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Header" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
<!--
Tucker Godsey
Final Project Spring 2019
Due 5/1/2019
Web Server Application Development IT3047 001

Start Page that both Users and Employees are greeted with when visiting the site. Logins for both Customers and Employees
-->
    Login
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">

    <div>

        <!-- User Login -->
        <div class="card" style="width: 45%; float: left;">

            <div class="card-header">
                <h3>User Login</h3>
            </div>

            <div class="card-body form-group">

                <div>
                    <h4>Loyalty Number</h4>

                    <asp:TextBox ID="txtLoyaltyNumberInput" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div>
                    <h4>Store Selection</h4>

                    <asp:ListBox ID="lbStores" runat="server" CssClass="form-control custom-select-lg" DataSourceID="GroceryStoreSimulator" DataTextField="Store" DataValueField="Store"></asp:ListBox>
                    
                    <asp:SqlDataSource ID="GroceryStoreSimulator" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT s.Store FROM tStore as s
INNER JOIN tProductPriceHist as pph ON pph.StoreID = s.StoreID"></asp:SqlDataSource>
                    
                    <asp:Label ID="lblError" runat="server" Text="ERROR MESSAGE HERE" Visible="False" CssClass="text-danger"></asp:Label>
                </div>
                
                <br />

                
                <asp:Button ID="btnLoginUser" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLoginUser_Click" />

            </div>


        
        </div>

        <!-- Employee Login -->
        <div class="card" style="width: 45%; float: right">

            <div class="card-header">
                <h3>Employee Login</h3>
            </div>

            <div class="card-body">

                <div>
                    <h4>Employee Number</h4>

                    <asp:TextBox ID="txtEmployeeNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
                <br />
                <asp:Button ID="btnLoginEmployee" runat="server" Text="Login" CssClass="btn btn-primary" />

            </div>


        
        </div>

    </div>

    

</asp:Content>

