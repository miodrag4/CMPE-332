<?php
// Start of PHP code block
try {
    // Creating a new PDO object with the specified database connection details: 
    // - 'mysql:host=localhost' indicates the host is on the same machine and using the MySQL database server
    // - 'dbname=doordash' indicates the name of the database to connect to
    // - "root" is the database username to use
    // - "" is the database password to use (in this case it's empty)
    $connection = new PDO('mysql:host=localhost;dbname=doordash', "root", "");
} catch (PDOException $e) {
    print "Error!: ". $e->getMessage(). "<br/>";
    die();
}
?>