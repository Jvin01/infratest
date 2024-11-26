<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manageacc.aspx.cs" Inherits="Rexorce.Manageacc" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Account Management</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Include jQuery and Bootstrap JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    <!-- Custom CSS -->
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

    <!-- JavaScript/jQuery for field visibility/disabled state -->
    <script type="text/javascript">
        $(document).ready(function () {
            // Initially hide/disable the Organization field
            $(".organization-field").hide();
            $(".organization-field :input").prop("disabled", true);

            // Handle the dropdown selection change event
            $("#accsel").change(function () {
                var selectedValue = $(this).val();
                if (selectedValue === "Admin") {
                    // If Admin is selected, hide/disable the Organization field
                    $(".organization-field").hide();
                    $(".organization-field :input").prop("disabled", true);
                } else if (selectedValue === "Client") {
                    // If Client is selected, show/enable the Organization field
                    $(".organization-field").show();
                    $(".organization-field :input").prop("disabled", false);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Admin Account Management</a>
        </nav>
        <asp:HyperLink ID="HyperLink1" runat="server" Visible="true" ForeColor="Red" NavigateUrl="~/Adminhomepage.aspx" >Dashboard</asp:HyperLink>

        <div class="container mt-4">
            <div class="card">
                <div class="card-header">
            <h2 class="card-title">User Accounts</h2>
                    </div>
                <div class="card-body">
                    <div class="admin-gridview">
          
       <asp:GridView ID="GridViewClients" runat="server" AutoGenerateColumns="False"
    OnRowEditing="GridViewClients_RowEditing"
    OnRowCancelingEdit="GridViewClients_RowCancelingEdit"
    OnRowUpdating="GridViewClients_RowUpdating"
    OnRowDeleting="GridViewClients_RowDeleting" >
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
        <asp:BoundField DataField="client_status" HeaderText="Status" ReadOnly="true" />
        <asp:TemplateField HeaderText="Username">
            <ItemTemplate>
                <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("client_username") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("client_username") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Password">
            <ItemTemplate>
                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("client_password") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("client_email") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("client_email") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("client_name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("client_name") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Phone Number">
            <ItemTemplate>
                <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("client_phonenumber") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("client_phonenumber") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Organization">
            <ItemTemplate>
                <asp:Label ID="OrganizationLabel" runat="server" Text='<%# Eval("client_organization") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="OrganizationTextBox" runat="server" Text='<%# Bind("client_organization") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" EditText="Edit" ShowDeleteButton="True" />
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
                </div>
            </div>
             <div class="card-header">
                    <h2 class="card-title">Admin Accounts</h2>
                </div>
           <div class="card-body">
               <div class="admin-gridview">
            
       <asp:GridView ID="GridViewAdmins" runat="server" AutoGenerateColumns="False"
    OnRowEditing="GridViewAdmins_RowEditing"
    OnRowCancelingEdit="GridViewAdmins_RowCancelingEdit"
    OnRowUpdating="GridViewAdmins_RowUpdating"
    OnRowDeleting="GridViewAdmins_RowDeleting" DataKeyNames="Id">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
        <asp:BoundField DataField="admin_status" HeaderText="Status" ReadOnly="true" />
        <asp:TemplateField HeaderText="Username">
            <ItemTemplate>
                <asp:Label ID="AdminUsernameLabel" runat="server" Text='<%# Eval("admin_username") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="AdminUsernameTextBox" runat="server" Text='<%# Bind("admin_username") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Password">
            <ItemTemplate>
                <asp:Label ID="AdminPasswordLabel" runat="server" Text='<%# Bind("admin_password") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="AdminPasswordTextBox" runat="server" TextMode="Password" CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:Label ID="AdminEmailLabel" runat="server" Text='<%# Eval("admin_email") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="AdminEmailTextBox" runat="server" Text='<%# Bind("admin_email") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="AdminNameLabel" runat="server" Text='<%# Eval("admin_name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="AdminNameTextBox" runat="server" Text='<%# Bind("admin_name") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Phone Number">
            <ItemTemplate>
                <asp:Label ID="AdminPhoneNumberLabel" runat="server" Text='<%# Eval("admin_phonenumber") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="AdminPhoneNumberTextBox" runat="server" Text='<%# Bind("admin_phonenumber") %>' CssClass="edit-textbox"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" EditText="Edit" ShowDeleteButton="True" />
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
                </div>
            </div>

            <div class="card mt-4">
    <div class="card-header">
        <h2 class="card-title">Add New Account</h2>
    </div>
    <div class="card-body">
        <div class="row mt-3">
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Label ID="lblUsername" runat="server" Text="Username:" ValidationGroup="CreateAccountValidationGroup"></asp:Label>
                   <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" ValidationGroup="CreateAccountValidationGroup"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
    InitialValue="" ErrorMessage="Username is required." ForeColor="Red" Display="Dynamic" CssClass="validation-error" ValidationGroup="CreateAccountValidationGroup"></asp:RequiredFieldValidator>


                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" ValidationGroup="CreateAccountValidationGroup"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" ValidationGroup="CreateAccountValidationGroup">></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        InitialValue="" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" CssClass="validation-error" ValidationGroup="CreateAccountValidationGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ValidationGroup="CreateAccountValidationGroup"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBox1"
                        InitialValue="" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" CssClass="validation-error" ValidationGroup="CreateAccountValidationGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBox1"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email format." ForeColor="Red"
                        Display="Dynamic" CssClass="validation-error" ValidationGroup="CreateAccountValidationGroup"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
        
       <asp:Panel ID="pnlAddNewRecord" runat="server">
    <!-- Organization Field -->
    <div class="row mt-3 organization-field">
        <div class="col-md-4">
            Organization: <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-4">
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ValidationGroup="CreateAccountValidationGroup"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="TextBox2"
    ValidationGroup="CreateAccountValidationGroup" InitialValue="" ErrorMessage="Name is required." ForeColor="Red" Display="Dynamic" CssClass="validation-error" ></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone number:"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ValidationGroup="CreateAccountValidationGroup"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="TextBox3"
    ValidationGroup="CreateAccountValidationGroup" InitialValue="" ErrorMessage="Phone number is required." ForeColor="Red" Display="Dynamic" CssClass="validation-error" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="TextBox3"
                    ValidationExpression="^\d{10}$" ErrorMessage="Phone number must be 10 digits." ForeColor="Red"
                    Display="Dynamic" CssClass="validation-error"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                <asp:DropDownList ID="accsel" runat="server" CssClass="form-control" Height="41px" Width="280px" ValidationGroup="CreateAccountValidationGroup">
                    <asp:ListItem Text="Select role" Value="" Selected="True" Disabled="True"></asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Client</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="accsel"
    ValidationGroup="CreateAccountValidationGroup" InitialValue="" ErrorMessage="Role is required." ForeColor="Red" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-12">
            <asp:Button ID="btnAddAccount" runat="server" Text="Add Account" OnClick="btnAddAccount_Click"
    CssClass="btn btn-primary" ValidationGroup="CreateAccountValidationGroup" />


        </div>
    </div>
</asp:Panel>


        <!-- Sql Data Sources -->
        <asp:SqlDataSource ID="SqlDataSourceAdmins" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [admin]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceClients" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [clients]"></asp:SqlDataSource>
    </form>
</body>
</html>
