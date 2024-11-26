<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookschedule.aspx.cs" Inherits="Rexorce.Bookschedule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Waste Schedule Booking</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>

</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <div class="p-5">
                                <asp:HyperLink ID="HyperLink1" runat="server" Visible="true" ForeColor="Red" NavigateUrl="~/Homepage.aspx" >Dashboard</asp:HyperLink>
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Waste Schedule Booking</h1>
                                </div>
                                <div class="form-group">
                                    <label for="ddlWasteType">Select Waste Type:</label>
                                    <asp:DropDownList ID="ddlWasteType" runat="server" CssClass="form-control" DataTextField="WasteType" DataValueField="WasteType"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="txtCollectionDate">Collection Date:</label>
                                    <asp:TextBox ID="txtCollectionDate" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtCollectionTime">Collection Time:</label>
                                    <asp:TextBox ID="txtCollectionTime" runat="server" CssClass="form-control" TextMode="Time" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="loc">Location:</label>
                                    <textarea class="form-control" id="loc" name="loc" runat="server" placeholder="Enter your location here..." rows="5" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="txtWeight">Weight (kg):</label>
                                  <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" onkeypress="return isNumberKey(event);" required></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <label for="desc">Descriptions:</label>
                                    <textarea class="form-control" id="desc" name="desc" runat="server" placeholder="Enter your descriptions here..." rows="5" ></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="lblAmount">Estimated Quotation:<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [wastedata]"></asp:SqlDataSource>
                                    </label>
                                    &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [wastematdata]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [datavis]"></asp:SqlDataSource>
                                    <asp:Label ID="lblAmount" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-user btn-block" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
