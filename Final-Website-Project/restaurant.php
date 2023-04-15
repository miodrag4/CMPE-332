<!DOCTYPE html>
<html>
<head>
    <!-- This is the CSS file that is used for the Home page -->
    <title>Drag's Pizzeria Inc.</title>
    <link rel="stylesheet" type="text/css" href="/Final-Website-Project/Home.css">
</head>
<body style="background-color: #E0FFFF;">
    <div class="header">
        <div class="topnav">
            <!-- Create a hyperlink for all of the buttons with a class of 'button'.  -->
            <a href='/Final-Website-Project/Home.php' class='button'>Home</a>
            <a href='/Final-Website-Project/Orders.php' class='button'>Orders</a>
            <a href='Final-Website-Project/Customer.php' class='button'>Customer</a>
            <a href='/Final-Website-Project/Dates.php' class='button'>Dates</a>
            <a href='/Final-Website-Project/Schedule.php' class='button'>Schedule</a>
        </div>
        <div class="logo">
            <?php echo '<img src="/Final-Website-Project/Drags-Pizzeria-Logo.png" alt="Drags Pizzeria Logo" width="350" height="250">'; ?>
        </div>
    </div>
    <div class="content">
    <!-- Description of Home page and tile -->
    <h1><u> Drag's Pizzeria Inc. </u></h1>
        <p>Welcome to Drag's Pizzeria Inc!</p>
        <p>We have the best pizza!</p>
        <!-- Description of the website -->
        <div class="section">
            <h2>This website is a database for Drag's Pizzeria Inc.</h2>
            <p>This has multiple pages that can be used to view the database.</p>
            <p>This website is used to view the orders, customers, dates, and schedule.</p>
        </div>

        <div class="section">
            <h2>Our Menu</h2>
            <p>We have a wide variety of pizzas to choose from with many different toppings.</p>
            <p>We also have a variety of drinks and desserts to choose from.</p>
        </div>
    </div>
</body>
</html>