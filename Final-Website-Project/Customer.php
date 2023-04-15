<!DOCTYPE html>
<html>
<style>
    <?php include '\xampp\htdocs\Final-Website-Project\Customer.css'; ?>
</style>
<body>

<div>
    
    <center>
    <section>
        <h1><font size="+4"><u> Drag's Pizzeria Inc. </u></h1>
        <p class = "form-p1"> <font size="+1"> Welcome to the Customer Page! </p>
    </section>

    <!-- Create a hyperlink for all of the buttons with a class of 'button'.  -->
    <a href='/Final-Website-Project/Home.php' class='button'>Home</a>
    <a href='/Final-Website-Project/Orders.php' class='button'>Orders</a>
    <a href='/Final-Website-Project/Dates.php' class='button'>Dates</a>
    <a href='/Final-Website-Project/Schedule.php' class='button'>Schedule</a>
        <!-- Create a form that uses the POST method with a class of 'form-1' -->
        <form method="post"  class = "form-1"   >
            <p class = "form-p1">Please fill in the information below to be added to our database:</p>
            <p class = "form-p1">$5.00 will be added to your Account Automatically</p>
            <!-- Create a text input with a placeholder of 'Enter Firstname...' -->
            <input class = "C" type="text" name="firstName" placeholder="Enter Firstname...">
            <!-- Create a text input with a placeholder of 'Enter Lastname...' -->
            <input class = "C" type="text" name="lastName" placeholder="Enter Lastname..." >
            <!-- Create a text input with a placeholder of 'Enter Email...' -->
            <input class = "C" type="text" name="emailAddress" placeholder="Enter Email...">
            <!-- Create a text input with a placeholder of 'Enter Phone Number...' -->
            <input class = "C" type="tel" name="cellNum" placeholder="Enter Phone Number...">
            <br>
            <!-- Create a text input with a placeholder of 'Enter Address...' -->
            <input class = "C" type="text" name="streetAddress" placeholder="Enter Address...">
            <!-- Create a text input with a placeholder of 'Enter city...' -->
            <input class = "C" type="text" name="city" placeholder="Enter city...">
            <!-- Create a text input with a placeholder of 'Enter Postal Code...' -->
            <input class = "C" type="postal" name="pc" placeholder="Enter Postal Code...">
            <!-- Submit the form -->
            <input class = "C" type="submit" value = "Add Customer">
            <br>
    <!-- PHP code to add a customer to the database -->
    <?php
    // Include the database connection file
    include 'connectdb.php';
        // Check if the form has been submitted
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Get the form data
        $firstName = $_POST["firstName"];
        $lastName = $_POST["lastName"];
        $emailAddress = $_POST["emailAddress"];
        $cellNum = $_POST["cellNum"];
        $streetAddress = $_POST["streetAddress"];
        $city = $_POST["city"];
        $postalCode = $_POST["pc"];
        $creditAmt = 5.00;
        // Check if the email address is empty
    if (empty($emailAddress)) {
        echo "<p class='form-p2'>No Email Address was Inputted</p>";
    }
    // Check if the email address is valid
    else {
        // Check if the email address already exists in the database
        $query = "SELECT * FROM customeraccount WHERE emailAddress = ?";
        // Prepare the statement
        $stmt = $connection->prepare($query);
        // Execute the statement
        $stmt->execute([$emailAddress]);
        
        // 
        if ($stmt->rowCount() > 0) {
            echo "<p class='form-p2'>Customer with email address " . $emailAddress . " already exists!</p>";
        } else {
            // Insert the customer into the database
            $query = "INSERT INTO customeraccount (firstName, lastName, emailAddress, cellNum, streetAddress, city, pc, creditAmt) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $connection->prepare($query);
            $stmt->execute([$firstName, $lastName, $emailAddress, $cellNum, $streetAddress, $city, $postalCode, $creditAmt]);
            
            // Check if the customer was added successfully
            if ($stmt->rowCount() > 0) {
                echo '<p class="form-p2">Customer added successfully with $5.00 of credit!</p>';
            } 
            // If the customer was not added successfully
            else {
                echo '<p class="form-p2">Error adding customer</p>';
            }
        }
    }
}
?>
        </form>
    </center>
</div>
</body>
</html>
