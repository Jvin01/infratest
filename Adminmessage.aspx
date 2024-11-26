<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminmessage.aspx.cs" Inherits="Rexorce.Adminmessage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Admin View Messages</title>
    <!-- Include Bootstrap CSS and JavaScript -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style>
        /* Add your custom CSS styles here */
        .admin-gridview {
            margin-top: 20px;
        }

        .message-text {
            white-space: pre-wrap;
        }

        /* Adjust styles as needed */
        .auto-style1 {
            position: relative;
            width: 100%;
            min-height: 1px;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container emp-profile">
            <!-- Navigation Link to Dashboard or Home Page -->
        </div>

        <div class="container mt-5">
            <div class="card">
                <div class="card-header">
                    <!-- Navigation Link to Dashboard or Home Page -->
                    <asp:HyperLink ID="HyperLink2" runat="server" Visible="true" ForeColor="Red" NavigateUrl="~/Adminhomepage.aspx">Dashboard</asp:HyperLink>
                </div>
                <div class="card-body">
                    <!-- Page Title -->
                    <div class="row">
                        <div class="auto-style1">
                            <h1 class="text-center">Admin View Messages</h1>
                        </div>
                    </div>

                    <!-- Display Messages Data -->
                    <asp:GridView ID="GridViewMessages" runat="server" AutoGenerateColumns="False" CssClass="admin-gridview table table-striped" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                            <asp:BoundField DataField="username" HeaderText="Username" />
                            <asp:BoundField DataField="Sent" HeaderText="Sent on" />
                            <asp:TemplateField HeaderText="Message">
                                <ItemTemplate>
                                    <asp:Label ID="MessageLabel" runat="server" Text='<%# Eval("message") %>' CssClass="message-text"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                       

                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [messages]"></asp:SqlDataSource>
    </form>
</body>
</html>
