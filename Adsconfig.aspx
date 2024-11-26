<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adsconfig.aspx.cs" Inherits="Rexorce.Adsconfig" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Ads</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #adminForm {
            max-width: 1400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #eee;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .edit-buttons {
            display: flex;
            justify-content: flex-start;
        }

        .edit-buttons a {
            display: inline-block;
            margin-right: 10px;
            padding: 8px 12px;
            text-decoration: none;
            background-color: #428bca;
            color: #fff;
            border-radius: 4px;
        }

        .edit-buttons a:hover {
            background-color: #3071a9;
        }

        .edit-textbox {
            width: 100%;
            padding: 6px;
        }

        .add-ads-form {
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <form id="adminForm" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" Visible="true" ForeColor="Red" NavigateUrl="~/Adminhomepage.aspx" CssClass="lgol">Dashboard</asp:HyperLink>
        <header>
            <h1>Manage Ads</h1>
        </header>

        <div>
            <asp:GridView ID="AdminGridView" runat="server" AutoGenerateColumns="False" OnRowEditing="AdminGridView_RowEditing"
                OnRowCancelingEdit="AdminGridView_RowCancelingEdit" OnRowUpdating="AdminGridView_RowUpdating"
                OnRowDeleting="AdminGridView_RowDeleting" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Image URL">
                        <ItemTemplate>
                            <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Eval("ImageUrl") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="ImageUrlFileUpload" runat="server" />
                            <br />
                            <asp:Label ID="ImageUrlErrorLabel" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Navigation URL">
                        <ItemTemplate>
                            <asp:Label ID="NavigationUrlLabel" runat="server" Text='<%# Eval("NavigateUrl") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="NavigationUrlTextBox" runat="server" Text='<%# Bind("NavigateUrl") %>' CssClass="edit-textbox"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Keyword">
                        <ItemTemplate>
                            <asp:Label ID="KeywordLabel" runat="server" Text='<%# Eval("Keyword") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="KeywordTextBox" runat="server" Text='<%# Bind("Keyword") %>' CssClass="edit-textbox"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
               
                    
                    <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ShowDeleteButton="true" ControlStyle-CssClass="edit-buttons" />
                </Columns>
                 <AlternatingRowStyle BackColor="#DCDCDC" />
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

        <div class="add-ads-form">
            <h2>Add New Ad</h2>
            <div class="form-group">
                <label for="ImageUrl">Image URL:</label>
                <asp:FileUpload ID="NewImageUrlFileUpload" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="NavigationUrl">Navigation URL:</label>
                <asp:TextBox ID="NewNavigationUrlTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
           
            <div class="form-group">
                <label for="Keyword">Keyword:</label>
                <asp:TextBox ID="NewKeywordTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
          
            <asp:Button ID="AddAdButton" runat="server" Text="Add Ad" OnClick="AddAdButton_Click" CssClass="btn btn-primary" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ads]"></asp:SqlDataSource>
    </form>
</body>
</html>
