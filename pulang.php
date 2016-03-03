<?php 
include("koneksi.php");
include("indo.php");
session_start();
if(!isset($_SESSION['login_user']))
	{
	header("Location: login.php");
	}
?>

<?php include('nav.php'); ?>
<?php include('template.php');?>
<?php
require_once("csrf.php");
?>
<br /><br />
<script type="text/javascript" src="webcam.js"></script>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="row-fluid well" style="overflow: hidden">
			<form name="f_ktm" method="POST" class="form-horizontal">
				<input type="hidden" name="csrf_name" value="<?php echo createToken();?>"/>
			<div class="form-group">
				<div><center><h1><b>ABSEN PULANG</b></h1></center></div>
				<div class="col-md-6">
					<?php
						$sql= "SELECT * FROM karyawan where username='".$_SESSION['login_user']."'";
						$hasil = $mysqli->query($sql);
						if($hasil === false) {
							trigger_error('Perintah SQL salah: ' . $sql . ' Error: ' . $mysqli->error, E_USER_ERROR);
						} else {
							$data = $hasil->fetch_array();
							echo "<input type=hidden name=kar value=".$data[id]." size=10 readonly=readonly>";
						}
					?>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<center>
					<!-- Configure a few settings -->
					<script language="JavaScript">
						webcam.set_api_url( 'capturepulang.php' );
						webcam.set_quality( 100 ); // JPEG quality (1 - 100)
						webcam.set_shutter_sound( true );
					</script>
					<!-- Next, write the movie to the page at 320x240 480,420-->
					<script language="JavaScript">
						document.write( webcam.get_html(320,240) );
					</script>
					<br /><br />
					<input type="button" id="ambil_photo" value="Ambil Photo" class= "btn btn-primary" onClick="take_snapshot()">
					</center>
				</div>
			</div>
			<div class="col-md-6">
				<center>
					<div id="upload_results"></div>
					<input type="submit" id="simpan" name="simpan" value="Simpan" class= "btn btn-success"/>
				</center>
			</div>
			</form>
		</div>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-body">
		<div class="row-fluid well" style="overflow: hidden">
			<div class="form-group">
				<div class="col-md-12">
					<div><center><h2><b>DAFTAR ABSEN KARYAWAN</b></h2></center></div>
					<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td align="center" width="5%"><b>No</b></td>
							<td align="center" width="18%"><b>NIP</b></td>
							<td align="center" width="0%"><b>Nama Karyawan</b></td>
							<td align="center" width="15%"><b>Tanggal</b></td>
							<td align="center" width="15%"><b>Jam Pulang</b></td>
						</tr>
					</thead>
					<tbody>
					<?php
						$sql= "SELECT karyawan.nik,karyawan.nama,absen_pulang.tgl,absen_pulang.jam_pulang FROM absen_pulang INNER JOIN karyawan ON karyawan.id = absen_pulang.id_karyawan WHERE DATE(tgl) = DATE(NOW())";
						
						$hasil = $mysqli->query($sql);
						if($hasil === false) {
							$no = 0;
							trigger_error('Perintah SQL salah: ' . $sql . ' Error: ' . $mysqli->error, E_USER_ERROR);
						} else {
						while($data = $hasil->fetch_array()){
							$no ++;
							echo "<tr>";
							echo "<td align=center>$no</td>";
							echo "<td>$data[nik]</td>";
							echo "<td>$data[nama]</td>";
							echo "<td align=center>".TanggalIndonesia($data[tgl])."</td>";
							echo "<td align=center>$data[jam_pulang]</td>";
							echo "</tr>";
							}
						}
					?>
					</tbody>
				</table>
			</div>
				</div>
			</div>
		</div>
	</div>
</div>

<?php
date_default_timezone_set('Asia/Makassar');
$tgl = date('YmdHis');
$waktu = date('H:i:s');
if(!empty($_POST['simpan'])){
	if (empty($_POST[kar])){
		echo "<strong>Nama Karyawan Masih Kosong..</strong>";
	}else{
		include('koneksi.php');
		$simpan = $mysqli->prepare("INSERT INTO absen_pulang(id,id_karyawan,tgl,jam_pulang,foto2) VALUES (?,?,?,?,?)");
     	$simpan->bind_param("sssss", $_POST[], $_POST[kar], $tgl, $waktu, $_POST[photo_url]);

     	if($simpan->execute()):
        	echo "<script>location.href='pulang.php'</script>";
     	else:
        	echo "<script>alert('".$simpan->error."')</script>";
     	endif;
	}
}
?>
	<script type="text/javascript">
		$(document).ready(function(){
		$("#upload_results").hide();$("#simpan").hide();
		$("#ambil_photo").click(function(){
		$("#upload_results").show(500);
		$("#simpan").show(500);
		});
		});
	</script>
	<script language="JavaScript">
		webcam.set_hook( 'onComplete', 'my_completion_handler' );
		function take_snapshot() {
			// take snapshot and upload to server
			document.getElementById('upload_results').innerHTML = '<p>Menyimpan photo ...</p>';
			webcam.snap();
		}
		function my_completion_handler(msg) {
			// extract URL out of PHP output
			if (msg.match(/(http\:\/\/\S+)/)) {
				var image_url = RegExp.$1;
				// show JPEG image in page
				document.getElementById('upload_results').innerHTML =
					'<img src="' + image_url + '" border="5">'+
					'<br /><br /><input type="hidden" name="photo_url" value="'+image_url+'" size="65" readonly="readonly">';
				// reset camera for another shot
				webcam.reset();
			}
			else alert("PHP Error: " + image_url);
		}
	</script>