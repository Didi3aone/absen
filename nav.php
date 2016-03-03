<?php 
	include("koneksi.php");
	session_start();
	
	if(!isset($_SESSION['login_user']))
	{
		header("Location: login.php");
	}
?>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="index.php" class="fa fa-th-large navbar-brand"> Absensi AIS Group</a>
					<ul class="nav navbar-nav">
						<li><a href="masuk.php" class="fa fa-user navbar-brand"> Absen Masuk</a></li>
						<li><a href="pulang.php" class="fa fa-user navbar-brand"> Absen Pulang</a></li>
					</ul>
				</div>
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<?php
							$sql= "SELECT * FROM karyawan where username='".$_SESSION['login_user']."'";
							$hasil = $mysqli->query($sql);
							if($hasil === false) {
								trigger_error('Perintah SQL salah: ' . $sql . ' Error: ' . $mysqli->error, E_USER_ERROR);
							} else {
								$data = $hasil->fetch_array();
								echo "<li class=grey><a class=ace-icon fa fa-sign-out icon-animated-bell>$data[nama]</a></li>";
							}
						?>
					</ul>
				</div>
			</div>
		</div>