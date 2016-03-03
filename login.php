<?php include('template.php');?>
<?php 
include('koneksi.php');
session_start();
if($_SERVER["REQUEST_METHOD"] == "POST")
 {
// username and password received from loginform 
//$username = mysqli_real_escape_string($dbconfig,$_POST['username']);
//$password = mysqli_real_escape_string($dbconfig,$_POST['password']);
$username = $_POST['username'];
$password = $_POST['password'];

$sql="SELECT id FROM karyawan WHERE username='$username' and password='$password'";
$hasil = $mysqli->query($sql);
if($hasil === false) {
    trigger_error('Perintah SQL salah: ' . $sql . ' Error: ' . $mysqli->error, E_USER_ERROR);
} else {
    $data = $hasil->fetch_array();
    $count=mysqli_num_rows($hasil);
}

// If result matched $username and $password, table row must be 1 row
if($count==1)
{
$_SESSION['login_user'] = $username;

header("location: index.php");
}
else
{
$error="Username or Password is invalid";
}
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <title>Aplikasi Absensi AIS Group</title>
    <meta name="description" content="@yield('meta_description', 'Default Description')">
    <meta name="author" content="R4hm4t Cm05">
    <link rel="icon" type="image/png" href="logo.ico">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<style>
body {
    background-color: #fff;
    background-size: cover;
    font-family: Montserrat;
}

.logo {
    width: 213px;
    height: 36px;
    margin: 30px auto;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ff656c;
    margin: 0 auto;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #ff656c;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ff7b81;
}

</style>
</head>

<body>
<br /><br /><br />
<div><center><img src='ais.png' width='150px' height='80px'/></center></div>
<div><center><h2>PT. Anak Indonesia Sukses</h2></center></div>
<div class="login-block">
    <h1>Login</h1>
    <form method="post" action="" name="loginform">
    <input type="text" value="" placeholder="User Name" id="username" name="username" required />
    <input type="password" value="" placeholder="Password" id="password" name="password" required/>
    <button type="submit">Submit</button>
    </form>

    <center>
        <div>
            <a href="#" class="ace-icon fa fa-sign-out">Administrator</a>
        </div>
    </center>
</div>
</body>

</html>