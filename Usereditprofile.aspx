<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usereditprofile.aspx.cs" Inherits="Rexorce.Usereditprofile" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <head runat="server">
         <title>Edit Profile</title>
    <style>
        body {
            background: -webkit-linear-gradient(left, #3931af, #00c6ff);
        }

        .emp-profile {
            padding: 3%;
            margin-top: 3%;
            margin-bottom: 3%;
            border-radius: 0.5rem;
            background: #fff;
            font-family: Arial, sans-serif;
        }

        .profile-head h5 {
            color: #333;
        }

        .profile-head h6 {
            color: #0062cc;
        }

         .profile-edit-btn {
            border: none;
            border-radius: 1.5rem;
            padding: 1.5rem 3rem; /* Adjust padding for button size */
            font-weight: 600;
            background-color: #0062cc; /* Button background color */
            color: #fff; /* Button text color */
            cursor: pointer;
            text-align: center; /* Center button text */
        }

        .profile-tab label {
            font-weight: 600;
        }

        .profile-tab p {
            font-weight: 600;
            color: #0062cc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-6">
                    <div class="profile-head">
                        <h5>Edit Profile</h5>
                        <h6>Edit your profile information below</h6>
                    </div>
                </div>
                <div class="col-md-2">
                    &nbsp;
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Username</label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="usernametb" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <!-- Add input fields for other profile attributes here -->
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Password</label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="passwordtb" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="emailtb" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <!-- Add more input fields as needed -->
                        </div>
                    </div>
                </div>
                <asp:Label ID="Label1" runat="server" CssClass="alert-danger" Text="Label" Visible="False"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-12 text-center mt-4">
        <asp:Button ID="Button1" runat="server" CssClass="btn active profile-edit-btn" OnClick="Button1_Click" Text="Save Changes" Width="193px" />
        </div>
                </div>
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [clients]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    </form>
    </body>
</html>
