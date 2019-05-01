<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FinalOrder.aspx.cs" Inherits="FinalOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
    Order for <asp:Label ID="lblLoyaltyNumberHeader" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">

    <div class="card">
        
        <div class="card-header">
            <h3 class="text-primary">Here is your order, <asp:Label ID="lblLoyaltyNumberCardHead" runat="server" Text=""></asp:Label></h3>
        </div>

        <div class="card-body">
            
            <h4>Products</h4>

            <asp:Table ID="tblProducts" CssClass="table table-bordered table-active" runat="server">

                <asp:TableHeaderRow>
                    <asp:TableHeaderCell CssClass=""><h5>Item</h5></asp:TableHeaderCell>
                    <asp:TableHeaderCell><h5>Quantity</h5></asp:TableHeaderCell>
                    <asp:TableHeaderCell><h5>Price</h5></asp:TableHeaderCell>
                </asp:TableHeaderRow>

            </asp:Table>

            <asp:Table ID="Table1" CssClass="table table-bordered table-active" runat="server">

                <asp:TableHeaderRow>
                    <asp:TableHeaderCell CssClass=""><h5>Total Price</h5></asp:TableHeaderCell>
                    <asp:TableCell><asp:Label ID="lblTotalCost" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableHeaderRow>

            </asp:Table>

        </div>

    </div>

</asp:Content>

