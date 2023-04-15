<?php
// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $date = $_POST['date'];
    try {
        include 'connectdb.php';
        // Prepare the statement
        // Select the first name, last name, order ID, total price, tip, order date, delivery person's first name, delivery person's last name, and the food items in the order
        $stmt = $connection->prepare("SELECT customerAccount.firstName, customerAccount.lastName, foodOrder.orderID, foodOrder.totalPrice, foodOrder.tip, foodOrder.orderDate, employee.firstName as deliveryFirstName, employee.lastName as deliveryLastName, GROUP_CONCAT(food.name SEPARATOR ', ') as foodItems FROM 
        customerAccount, foodOrder, orderPlacement, delivery, employee, foodItemsinOrder, food 
        WHERE customerAccount.emailAddress = orderPlacement.customerEmail AND 
        foodOrder.orderID = orderPlacement.orderID AND foodOrder.orderDate = :date AND 
        delivery.orderID = orderPlacement.orderID AND employee.ID = delivery.deliveryPerson AND 
        foodItemsinOrder.orderID = foodOrder.orderID AND foodItemsinOrder.food = food.name 
        GROUP BY foodOrder.orderID");
        // Execute the statement
        $stmt->bindParam(':date', $date);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
<!-- CSS Stylesheet -->
<style>
    <?php include '\xampp\htdocs\Final-Website-Project\styles.css'; ?>
    <?php include '\xampp\htdocs\Final-Website-Project\Orders.css'; ?>
</style>
<div>
    <center>
        <section>
        <h1><u> Drag's Pizzeria Inc. </u></h1>
        <p class = "form-p1"> <font size="+1"> Welcome to the Orders Page! </p>
         </section> 
        <!-- Navigation Bar -->
        <a href='/Final-Website-Project/Home.php' class='button'>Home</a>
        <a href='/Final-Website-Project/Customer.php' class='button'>Customer</a>
        <a href='/Final-Website-Project/Dates.php' class='button'>Dates</a>
        <a href='/Final-Website-Project/Schedule.php' class='button'>Schedule</a>
    
        <!-- Form to enter a date -->
        <form method="POST">
            <p>Please Enter a Valid Date below in the form to the right :</p>
            <p> After you have entered a date, click the submit button to view all the orders placed on that particular day </p>
            <label for="date">Enter a date:</label>
            <input type="date" name="date">
            <input type="submit" value="Submit">
        </form>
        <?php if(isset($result) && count($result) > 0): ?>
    <table>
        <thead>
            <tr>
                <!-- Display the table headers -->
                <th>First Name</th>
                <th>Last Name</th>
                <th>Food Items</th>
                <th>Total Price</th>
                <th>Tip</th>
                <th>Delivery First Name</th>
                <th>Delivery Last Name</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($result as $row): ?>
            <tr>
                <!-- Display the table data -->
                <td><?php echo $row['firstName']; ?></td>
                <td><?php echo $row['lastName']; ?></td>
                <td><?php echo $row['foodItems']; ?></td>
                <td><?php echo $row['totalPrice']; ?></td>
                <td><?php echo $row['tip']; ?></td>
                <td><?php echo $row['deliveryFirstName']; ?></td>
                <td><?php echo $row['deliveryLastName']; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <!-- If the form has not been submitted or if there are no orders on the date, display a message -->
<?php elseif(isset($_POST['date'])): ?>
    <p>No orders were placed on <?php echo $_POST['date']; ?>. Please select another date or go to the dates page to see the dates catalog.</p>
<?php endif; ?>
    </center>
</div>