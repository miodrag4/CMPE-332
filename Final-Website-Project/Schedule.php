<style>
    <?php include '\xampp\htdocs\Final-Website-Project\Schedule.css'; ?>
</style>
<center>
    <section>
    <h1><u> Drag's Pizzeria Inc. </u></h1>
    <p class = "form-p1"> Welcome to the Schedule Page! </p>
    <p class = "form-p1"> Here you can view the schedule for each employee. </p>
    </section>
    <!-- Navigation Bar -->
    <a href='/Final-Website-Project/Home.php' class='button'>Home</a>
    <a href='/Final-Website-Project/Orders.php' class='button'>Orders</a>
    <a href='/Final-Website-Project/Customer.php' class='button'>Customer</a>
    <a href='/Final-Website-Project/Dates.php' class='button'>Dates</a>
    <!-- Form to select an employee -->
    <body>
        <div>
            <form method="post" class = "form-1" >
                <br>
                <p for="employee" class = "form-p1" > Please select an employee :</p>
                <select name="employee" id="ID">
                     <option value="">Select an Employee</option>
                    <?php
                    // Connect to the database
                    include 'connectdb.php';
                    // Prepare the query
                    $stmt = $connection->query('SELECT * FROM employee');
                    $employee = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($employee as $employee) {
                        // Display the results in a drop down menu
                        echo '<option value="' . $employee['ID'] . '">' . $employee['firstName'] .' '. $employee['lastName'] . '</option>';
                    }
                    ?>
                </select>
                <button type="submit" class='button'> Submit </button>
            </form>
            <div class="div-4">
            <?php
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                // Connect to the database
                $ID = $_POST['employee'];
                // Prepare the query
                $stmt = $connection->prepare('SELECT * FROM shift WHERE empID = :ID AND day NOT IN ("Saturday", "Sunday")');
                $stmt->bindParam(':ID', $ID);
                $stmt->execute();
                $shift = $stmt->fetchAll(PDO::FETCH_ASSOC);
                // Display the results in a table
                if (count($shift) > 0) {
                    echo '<table>';
                    echo '<thead><tr><th>Day</th><th>Start Time</th><th>End Time</th></tr></thead>';
                    echo '<tbody>';
                    foreach ($shift as $day) {
                        echo '<tr>';
                        echo '<td>' . $day['day'] . '</td>';
                        echo '<td>' . $day['startTime'] . '</td>';
                        echo '<td>' . $day['endTime'] . '</td>';
                        echo '</tr>';
                    }
                    echo '</tbody>';
                    echo '</table>';
                } 
                // If the employee does not have any shifts
                else {
                    echo '<p class = "form-p1" >This employee does not have any shifts.</p>';
                }
            }
            ?>
            </div>
        </div>
    </body>
</center>