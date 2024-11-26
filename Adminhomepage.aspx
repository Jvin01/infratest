<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminhomepage.aspx.cs" Inherits="Rexorce.Adminhomepage" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin homepage</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style type="text/css">
        .auto-style2 {
            position: relative;
            height: 20rem;
            width: 100%;
            left: 0px;
            top: 0px;
        }
    </style>

</head>

<body id="page-top">

    <form id="form1" runat="server">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Adminhomepage.aspx">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Rexorce <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="Adminhomepage.aspx">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

          

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="Adschreview.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Schedule</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            

            <!-- Nav Item - Data Vis -->
            <li class="nav-item">
                <a class="nav-link" href="Adminmessage.aspx">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>View Messages</span></a>
            </li>

            <!-- Nav Item - Contact us -->
            <li class="nav-item">
                <a class="nav-link" href="Adsconfig.aspx">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Configure ads</span></a>
            </li>

            <!-- Nav Item - manage acc -->
            <li class="nav-item">
                <a class="nav-link" href="Manageacc.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Manage accounts</span></a>
            </li>

             <!-- Nav Item - manage mat -->
            <li class="nav-item">
                <a class="nav-link" href="Manageres.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Manage resources</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="Adminlogout.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Logout</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Nav Item - User Information -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="Adminprofile.aspx" id="userDropdown" role="button" style="left: 0px; top: 0px">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%# GetUserDisplayName() %></span>
                <img class="img-profile rounded-circle" src="img/m.svg">
            </a>
        </li>
    </ul>

</nav>
<!-- End of Topbar -->


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                     
                    </div>

                   <!-- Content Row -->
<div class="row">

    <!-- Cost and expenses -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Schedules</div>
                        <asp:Label ID="Label3" runat="server" CssClass="h5"></asp:Label>
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
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Overall Value</div>
                        <asp:Label ID="Label2" runat="server" CssClass="h5"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recycle rate Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                            Clients</div>
                        <div class="h5 mb-0">
                            <asp:Label ID="Label1" runat="server" CssClass="h5"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Schedules Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col-auto">
                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            Messages</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label ID="Label0" runat="server" CssClass="h5"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Content Row -->



                    <div class="row">

                        <!-- Calendar Container -->
    <div class="col-lg-12 mb-4">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Calendar</h6>
            </div>
            <div class="card-body">
                <div class="auto-style2">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                </div>
            </div>
        </div>
    </div>
                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                
                                <!-- Card Body -->
                                  <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Material info</h6>
            </div>
                                <div class="card-body">
                                    <div class="auto-style2">
                                        <asp:Chart ID="Chart2" runat="server" CssClass="auto-style3" DataSourceID="SqlDataSource3">
                                            <Series>
                                                <asp:Series Name="Series1" XValueMember="material" YValueMembers="client_Id">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                            </div>
                        </div>

                               
                              
                                        
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT wastedata.waste_Id, wastedata.client_Id, wastedata.waste_type, wastedata.quantity, wastedata.description, wastedata.collection_date, wastedata.collection_time, wastedata.collection_location, wastedata.status, wastedata.quotations, wastematdata.Id, wastematdata.material, wastematdata.baseprice, wastematdata.demands FROM wastedata INNER JOIN wastematdata ON wastedata.waste_type = wastematdata.material"></asp:SqlDataSource>
                                        
                                   
                                    
                      

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Waste material trends</h6>
                                </div>
                                <div class="card-body">
                                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3">
                                        <Series>
                                            <asp:Series Name="Series1" ChartType="Point" XValueMember="material" YValueMembers="baseprice" YValuesPerPoint="2"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </div>

                            <!-- Color System -->
                            <div class="row">
                                <div class="col-lg-6 mb-4">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [wastedata]"></asp:SqlDataSource>

                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-light text-black shadow">
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [clients]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" SelectCommand="SELECT * FROM [messages]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6 mb-4">

                            <!-- chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Locations trends</h6>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource1">
                                            <Series>
                                                <asp:Series ChartArea="ChartArea1" ChartType="StackedBar" Name="Series1" XValueMember="collection_location" YValueMembers="client_Id">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
&nbsp;</div>
                                </div>
                            </div>

                            <!--chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Company analysis</h6>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0">
                                        <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource2">
                                            <Series>
                                                <asp:Series ChartType="Kagi" Name="Series1" XValueMember="client_organization" YValueMembers="Id" YValuesPerPoint="2">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </p>
                                </div>
                            </div>


                             <!-- charts -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Messages</h6>
                                    <div>
                                        <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource4">
                                            <Series>
                                                <asp:Series ChartArea="ChartArea1" ChartType="StackedBar" Name="Series1" XValueMember="Id" YValueMembers="sent">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
&nbsp;</div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Rexorce 2023</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

    </form>

</body>

</html>
