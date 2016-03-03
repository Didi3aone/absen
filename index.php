<?php 
	include("koneksi.php");
	session_start();
	
	if(!isset($_SESSION['login_user']))
	{
		header("Location: login.php");
	}
?>

<!doctype html>
<html class="no-js" lang="">
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <title>Aplikasi Absensi AIS Group</title>
    <meta name="description" content="@yield('meta_description', 'Default Description')">
    <meta name="author" content="R4hm4t Cm05">
    <link rel="icon" type="image/png" href="logo.ico">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="ace/assets/font-awesome/4.2.0/css/font-awesome.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="ace/assets/css/jquery-ui.custom.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="ace/assets/css/chosen.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="ace/assets/css/ace.min.css" type="text/css" media="all" />
	<script type="text/javascript" src="ace/assets/js/ace-extra.min.js"></script>	
	<script type="text/javascript" src="webcam.js"></script>
	</head>
	<body onload="setInterval('displayServerTime()', 1000);">
		<div class="main-container" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					<?php include('nav.php');?>
					<br /><br /><br />
<center>
<div>
	<?php
		$sql= "SELECT * FROM karyawan where username='".$_SESSION['login_user']."'";
		$hasil = $mysqli->query($sql);
		if($hasil === false) {
			trigger_error('Perintah SQL salah: ' . $sql . ' Error: ' . $mysqli->error, E_USER_ERROR);
		} else {
		$data = $hasil->fetch_array();
			echo "<h1>Welcome $data[nama]</h1>";
		}
	?>
	<a href="logout.php" class= "btn btn-primary">Logout</a>
</div>
</center>

					
				</div>
			</div>
		</div>				
		<script type="text/javascript" src="ace/assets/js/jquery.2.1.1.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/jquery.easypiechart.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/ace-elements.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/ace.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/jquery-ui.custom.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript" src="ace/assets/js/chosen.jquery.min.js"></script>
	</body>
</html>