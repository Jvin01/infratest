<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewschedule.aspx.cs" Inherits="Rexorce.Viewschedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>viewschedule</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        /* Add any custom CSS styles here */
        .enlarged-card {
            padding: 0px; /* Adjust the padding as needed */
        }
        .grid-container {
            max-width: 100%; /* Adjust the maximum width as needed */
        }
        .grid-view {
            width: 100%; /* Adjust the width as needed */
        }
        .dashboard-link {
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <div class="card o-hidden border-0 shadow-lg my-5 enlarged-card">
                        <div class="card-body p-0">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Homepage.aspx" CssClass="dashboard-link">
                                Dashboard
                            </asp:HyperLink>
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Admin Review Schedule</h1>
                                </div>
                                <div class="grid-container">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="waste_Id" DataSourceID="SqlDataSource1" CssClass="grid-view">
                                        <Columns>
                                            <asp:BoundField DataField="waste_Id" HeaderText="waste_Id" InsertVisible="False" ReadOnly="True" SortExpression="waste_Id" />
                                            <asp:BoundField DataField="client_Id" HeaderText="client_Id" SortExpression="client_Id" />
                                            <asp:BoundField DataField="waste_type" HeaderText="waste_type" SortExpression="waste_type" />
                                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                                            <asp:BoundField DataField="collection_date" HeaderText="collection_date" SortExpression="collection_date" />
                                            <asp:BoundField DataField="collection_time" HeaderText="collection_time" SortExpression="collection_time" />
                                            <asp:BoundField DataField="collection_location" HeaderText="collection_location" SortExpression="collection_location" />
                                            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                           
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT * FROM [wastedata] WHERE [client_Id] = @ClientId">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ClientId" SessionField="client_id" DbType="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
