<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manageres.aspx.cs" Inherits="Rexorce.Manageres" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head runat="server">
    <script type="text/javascript">
    function validateBasePrice(input) {
        // Remove any non-digit characters
        input.value = input.value.replace(/\D/g, '');

        // Ensure the value is non-negative
        if (input.value < 0) {
            input.value = '';
        }
    }
    </script>
    <title>Material Management</title>

     <style>
        /* Add your custom CSS styles here */
        .admin-gridview {
            margin-top: 20px;
        }

        .edit-textbox {
            width: 100%;
        }

        /* Adjust styles as needed */
         .auto-style1 {
             position: relative;
             width: 100%;
             min-height: 1px;
             -ms-flex: 0 0 33.333333%;
             flex: 0 0 33.333333%;
             max-width: 33.333333%;
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
            <asp:HyperLink ID="HyperLink1" runat="server" Visible="true" ForeColor="Red" NavigateUrl="~/Adminhomepage.aspx" >Dashboard</asp:HyperLink>
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">Material Management</h1>
                </div>
            </div>

            <!-- Display Material Data -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
                DataKeyNames="Id" CssClass="admin-gridview table table-striped" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Material">
                        <ItemTemplate>
                            <asp:Label ID="MaterialLabel" runat="server" Text='<%# Eval("material") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="MaterialTextBox" runat="server" Text='<%# Bind("material") %>' CssClass="edit-textbox form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Base Price">
                        <ItemTemplate>
                            <asp:Label ID="BasePriceLabel" runat="server" Text='<%# Eval("baseprice") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="BasePriceTextBox" runat="server" Text='<%# Bind("baseprice") %>' CssClass="edit-textbox form-control" oninput="validateBasePrice(this);"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Demands">
                        <ItemTemplate>
                            <asp:Label ID="DemandsLabel" runat="server" Text='<%# Eval("demands") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DemandsDropDown" runat="server" CssClass="edit-textbox form-control">
                                <asp:ListItem Text="High" Value="High"></asp:ListItem>
                                <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowCancelButton="True" ShowDeleteButton="True" ControlStyle-CssClass="edit-buttons">
                        <ControlStyle CssClass="edit-buttons"></ControlStyle>
                    </asp:CommandField>
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

            <!-- Add New Material -->
            <h2 class="mt-4">Add New Material</h2>
            <div class="row mt-3">
                <div class="col-md-4">
                    Material: <asp:TextBox ID="txtMaterial" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="col-md-4">
                    Base Price: <asp:TextBox ID="txtBasePrice" runat="server" CssClass="form-control" oninput="validateBasePrice(this);" required></asp:TextBox>
                </div>
                <div class="col-md-4">
                    Demands:
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" required>
                        <asp:ListItem Text="Select Demands" Value="" Selected="True" Disabled="True"></asp:ListItem>
                        <asp:ListItem Text="High" Value="High"></asp:ListItem>
                        <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                        <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-md-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>