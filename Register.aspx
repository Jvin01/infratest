<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Rexorce.Register" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
    <form id="form1" runat="server">
    <div class="container">
        
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                           
                                
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox1" class="form-control form-control-user" name="ename" aria-describedby="emailHelp" placeholder="Enter Name..." runat="server"></asp:TextBox>
                                </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox2" class="form-control form-control-user" name="eusername" aria-describedby="emailHelp" placeholder="Enter Username..." runat="server"></asp:TextBox>
                                </div>
                                
                                <div class="form-group">
                                     <asp:TextBox ID="TextBox3" class="form-control form-control-user" name="eemail" aria-describedby="emailHelp" placeholder="Enter Email..." runat="server"></asp:TextBox>
                                </div>
                               <div class="form-group">
                                     <asp:TextBox ID="TextBox4" class="form-control form-control-user" name="epassword" aria-describedby="emailHelp" placeholder="Enter Password..." runat="server"></asp:TextBox>
                                </div>
                            <div class="form-group">
                                     <asp:TextBox ID="TextBox5" class="form-control form-control-user" name="eorganization" aria-describedby="emailHelp" placeholder="Enter Organization..." runat="server"></asp:TextBox>
                                </div>
                            <div class="form-group">
                                     <asp:TextBox ID="TextBox6" class="form-control form-control-user" name="epn" aria-describedby="emailHelp" placeholder="Enter Phone Number..." runat="server"></asp:TextBox>
                                </div>
                                 
                            
                            <asp:Label ID="Label1" runat="server" CssClass="alert-danger" Text="Label"></asp:Label>
                                 
                            
                            <asp:Button ID="Button1" runat="server" Text="Register Account" OnClick="Button1_Click" class="btn btn-primary btn-user btn-block" />
                                <hr>
      
                            <hr>
                          
                            <div class="text-center">
                                <a class="small" href="Login.aspx">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [clients]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [datavis]"></asp:SqlDataSource>
        </form>

    </body>

</html>