<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<!-- Flatly Min Bootstrap Theme CSS -->
<link rel="stylesheet" href="flatly.min.css">
<!-- Style Sheet -->
<link rel="stylesheet" href="style.css" />
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Ordering</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="imgGroceries" runat="server" ImageUrl="~/App_Themes/DefaultTheme/Groceries.bmp" />
        <h1>Big store low price!</h1>
    </div>
    </form>
</body>
</html>
