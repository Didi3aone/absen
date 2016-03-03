<?php
define("HOST", "localhost"); // Host database
define("USER", "root"); // Usernama database
define("PASSWORD", ""); // Password database
define("DATABASE", "ais_absensi"); // Nama database

$mysqli = new mysqli(HOST, USER, PASSWORD, DATABASE);

if($mysqli->connect_error){
	trigger_error('Koneksi ke database gagal: ' . $mysqli->connect_error, E_USER_ERROR);	
}
?>

