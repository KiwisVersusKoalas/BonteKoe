<?php require 'header.php';?>
<!-- HTML HERE -->
<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "scotchbox";
$conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
$sql = $conn->prepare('SELECT * FROM REST_TAFEL');
$sql->execute();
$sql = $conn->prepare('SELECT * FROM REST_KLANT');
$sql->execute();
$conn = null;
?>
<!-- HTML HERE -->
<?php require 'footer.php';?>
