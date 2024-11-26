<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactus.aspx.cs" Inherits="Rexorce.Contactus" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS for the top bar -->
    <style>
        .navbar {
            background-color: rgb(78, 115, 223);
        }
        .navbar-brand {
            font-size: 28px;
            font-weight: bold;
            color: #fff;
        }
        .contact-container {
            margin-top: 20px;
        }
        .contact-form {
            margin-bottom: 20px;
        }
        .contact-information {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="Homepage.aspx">Rexorce</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.aspx">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ContactUs.aspx">Contact Us</a>
                    </li>
                </ul>
            </div>
            <!-- Nav Item - User Information -->
            
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size: medium; color: #000000"><%# GetUserDisplayName() %></span>
                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                </a>
                
        </div>
    </nav>

    <div class="container mt-5 contact-container">
        <div class="row">
            <!-- Contact Form -->
            <div class="col-md-6 contact-form">
                <form runat="server">
                    <div class="form-group">
                        <label for="message" style="font-size: x-large">Message Us here</label>
                        <p>We would like to hear from you</p>
                        <textarea class="form-control" id="message" name="message" runat="server" placeholder="Enter your message here..." rows="5" required></textarea>
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary float-right" OnClick="Button1_Click" />
                </form>
            </div>
            <!-- Contact Information Card -->
            <div class="col-md-6">
                <div class="card shadow contact-information">
                    <h3>Contact Information</h3>
                    <p>
                        <strong>Name:</strong> John Doe<br>
                        <strong>Position:</strong> Customer Support Manager<br>
                        <strong>Email:</strong> Johndoe@gmail.com<br>
                        <strong>Phone:</strong> (123) 456-7890
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [messages]"></asp:SqlDataSource>
</body>
</html>
