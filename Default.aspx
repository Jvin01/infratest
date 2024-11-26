<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Waste Management Website</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Custom CSS for the top bar -->
    <style>
        .navbar {
            background-color: rgb(78, 115, 223);
        }

        .navbar-brand {
            font-size: 28px; /* Increase the font size for the brand name */
            font-weight: bold; /* Make the brand name bold */
            color: #fff; /* Change the text color to white */
        }

        /* Add more styles here to further emphasize the design */
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">Rexorce</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.aspx">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.aspx">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ContactUs.aspx">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container mt-5 text-center">
        <h1>Welcome to Rexorce Inc</h1>
        <p>Your one-stop solution for waste management</p>

        <!-- Images and Point-form Text -->
        <div class="row mt-5">
            <div class="col-md-4">
                <img src="ads/waste_tracking_image.jpg" alt="Waste Tracking">
                <h3>Waste Tracking</h3>
                <ul>
                    <li>Real-time waste monitoring</li>
                    <li>Track and reduce waste</li>
                    <li>Efficient waste management</li>
                </ul>
            </div>
            <div class="col-md-4">
                <img src="ads/resource_analysis_image.jpg" alt="Resource Analysis">
                <h3>Resource Analysis & Optimization</h3>
                <ul>
                    <li>Optimize resource allocation</li>
                    <li>Reduce costs</li>
                    <li>Efficient resource management</li>
                </ul>
            </div>
            <div class="col-md-4">
                <img src="ads/waste_collection_image.jpg" alt="Waste Collection Scheduling">
                <h3>Waste Collection Scheduling</h3>
                <ul>
                    <li>Schedule waste pickups</li>
                    <li>Track collection routes</li>
                    <li>Reduce collection costs</li>
                </ul>
            </div>
        </div>

        <!-- Get Started Button -->
        <a href="Login.aspx" class="btn btn-primary mt-4">Get Started</a>
    </div>

    <!-- Bootstrap JS (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
