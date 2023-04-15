<?php
// Connect to the database
try {
    include 'connectdb.php';
    // Prepare the query
    $stmt = $connection->prepare("SELECT fo.orderDate, COUNT(fo.orderID) AS numOrders 
    FROM foodOrder fo GROUP BY fo.orderDate");
    // Execute the query
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
<style>
    <?php include '\xampp\htdocs\Final-Website-Project\styles.css'; ?>
    <?php include '\xampp\htdocs\Final-Website-Project\Dates.css'; ?>
</style>

<div>
    <center>
        <section>
        <!-- Header for the Title of the page -->
        <h1><u> Drag's Pizzeria Inc. </u></h1>
        <!-- Header for the description of the page -->
        <p class = "form-p1" > Welcome to the Drag's Pizzeria website. </p>
        <p class = "form-p1">   Here you can view all the orders placed on a particular day. </p>
        </section>
        <!-- Navigation Bar -->
        <a href='/Final-Website-Project/Home.php' class='button'>Home</a>
        <a href='/Final-Website-Project/Customer.php' class='button'>Customer</a>
        <a href='/Final-Website-Project/Orders.php' class='button'>Orders</a>
        <a href='/Final-Website-Project/Schedule.php' class='button'>Schedule</a>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Number of Orders</th>
                </tr>
            </thead>
            <tbody>

                <?php foreach ($result as $row): ?>
                <!-- Display the results in a table -->
                <tr>
                    <td><?php echo $row['orderDate']; ?></td>
                    <td><?php echo $row['numOrders']; ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </center>
</div>