<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datav.aspx.cs" Inherits="Rexorce.Datav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Data visualize</title>
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
     <style type="text/css">
        .container {
            padding-top: 20px;
        }

        .card-container {
            margin-bottom: 20px;
        }

        .chart-container {
            padding: 20px;
        }

        .chart {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar (You can use Bootstrap classes for styling) -->
        <div id="sidebar">
            <!-- Your sidebar content -->
        </div>

        <!-- Content Wrapper -->
        <div id="content-wrapper">
            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Topbar content -->
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Homepage.aspx" CssClass="dashboard-link">
                                Dashboard
                            </asp:HyperLink>
                 <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="Userprofile.aspx" id="userDropdown" role="button">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%# GetUserDisplayName() %></span>
                <img class="img-profile rounded-circle" src="img/m.svg">
            </a>
        </li>
    </ul>
            </nav>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">Data analysis and visualizer</h1>

                <!-- Input field and button for updating expenses -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="expensesInput">Enter Expenses:</label>
                            <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Enter expenses" oninput="validateBasePrice(this);"></asp:TextBox>
                           
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Update Expenses" OnClick="Button1_Click" />
                    </div>
                </div>
                  <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Data graphs and charts</h1>
                        
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Cost and expenses -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2" style="left: 0px; top: 0px">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                cost and expenses</div>
                                                    <asp:Label ID="Label3" runat="server" CssClass="h5"></asp:Label>  

                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Rexorce earnings</div>
                                                    <asp:Label ID="Label2" runat="server" CssClass="h5"></asp:Label>  

                                        </div>
                                        <div class="auto-style1">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Recycle rate
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
        <asp:Label ID="Label1" runat="server" CssClass="h5"></asp:Label>  
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Schedules</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
        <asp:Label ID="lblScheduleCount" runat="server" CssClass="h5"></asp:Label>
    </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                <!-- Charts Section -->
                <div class="row">
                   <div class="col-lg-12 mb-4">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Waste generation</h6>
        </div>
        <div class="card-body">
            <div class="auto-style2">
                <!-- Chart 3: Waste Quantity -->
                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSourceCombined" Height="363px" Width="560px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Line" XValueMember="quantity" YValueMembers="collection_date" ChartArea="ChartArea1" YValuesPerPoint="2">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Date">
                                <LabelStyle Format="yyyy-MM-dd" IntervalType="Months"></LabelStyle>
                            </AxisY>
                            <AxisX Title="Wastage (KG)">
                                <LabelStyle Format="#,0"></LabelStyle>
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                    <Titles>
                        <asp:Title Name="Title1" Text="Waste quantity">
                        </asp:Title>
                    </Titles>
                </asp:Chart>
            </div>
        </div>
    </div>
</div>

<!-- Chart 4: Schedules -->
<div class="col-lg-6 mb-4">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Schedules</h6>
        </div>
        <div class="card-body">
            <div class="chart-container">
                <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSourceCombined" Height="341px" Width="560px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="collection_date" YValueMembers="schedules">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Titles>
                        <asp:Title Name="Title1" Text="Schedules">
                        </asp:Title>
                    </Titles>
                </asp:Chart>
            </div>
        </div>
    </div>
</div>

<!-- Chart 5: Waste Composition -->
<div class="col-lg-6 mb-4">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Waste Composition</h6>
        </div>
        <div class="card-body">
            <div class="chart-container">
                <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSourceCombined" Height="319px" Width="560px">
                    <Series>
                        <asp:Series ChartType="Pie" Name="Series1" XValueMember="waste_type" YValueMembers="collection_date">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Titles>
                        <asp:Title Name="Title1" Text="Waste composition">
                        </asp:Title>
                    </Titles>
                </asp:Chart>
            </div>
        </div>
    </div>
</div>
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->
                 <asp:SqlDataSource ID="SqlDataSourceCombined" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT *
FROM [datavis]
INNER JOIN [wastedata] ON [datavis].[client_id] = [wastedata].[client_id]
">
</asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [datavis]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [wastedata]"></asp:SqlDataSource>

    </form>

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Rexorce 2023</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    
</body>
</html>
