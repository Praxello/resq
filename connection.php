<?php
$server = 'localhost';
$user   = 'root';
$password = '';
$dbname = 'root_resq';
$conn = new mysqli($server,$user,$password,$dbname) or die(mysqli_error($conn));
?>