<?php
	$dbhost = "mysql";
	$dbuser = "admin";
	$dbpass = "admin";
	$dbname = "database";
	$dbport = "3306";

	// Cria a ligação à BD
	$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname, $dbport);

	// Verifica a ligação à BD
	if (mysqli_connect_error()) {
	  die("Database connection failed: " . mysqli_connect_error());
	}
?>