<?PHP require_once"koneksi.php"; 
if(empty($_SESSION['member_id'])) { 
header ('location:./');
} else{ 
$query = "SELECT * FROM member WHERE member_id='$_SESSION[member_id]'"; $no=0;
$result = $mysqli->query($query) or die($mysqli->error.__LINE__);
$rows= $result->fetch_assoc();
extract($rows);
echo'
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>BONBIN-NET</title>
<link rel="stylesheet" href="assets/bootstrap.min.css">
<script type="text/javascript" src="assets/jquery.js"></script>
<script type="text/javascript" src="assets/bootstrap.min.js"></script>
<style>
body{background:#FFFFFF  url("http://172.16.0.2/bonbin/images/bkg.jpg") no-repeat 0 0;
color:#000000;
font: 16px "Open Sans", Helvetica, Arial, sans-serif; 
font-weight : bold;
-webkit-font-smoothing: antialiased;
-webkit-text-size-adjust: 100%;
line-height:1;
width:100%;
height:100%;}
</style>
</head>

<body>';
require_once"./assets/menu-nav.php";

echo'
<div class="container"><div class="row">
<h3>Selamat Datang '.$member_nama.'</h3>
<hr>
<div class="panel panel-default">
<div class="panel-heading">Daftar Member</div>
<div class="panel-body">

<table class="table no-margn">
<thead>
<tr>
<th>Nomor</th>
<th>Nama</th>
<th>Username</th>
<th>Email</th>
<th>Tanggal Daftar</th>
<th>Status</th>
</tr>
</thead>
<tbody>';
if($result->num_rows > 0){$no++;
	echo'
<tr>
<td>'.$no.'</td>
<td>'.$member_nama.'</td>
<td>'.$member_username.'</td>
<td>'.$member_email.'</td>
<td>'.$member_tgl_daftar.'</td>
<td>'.$member_status.'</td>
</tr>';}
echo'
</tbody>
</table>
</div>
</div>

</div></div>

</body>
</html>';}
