<?PHP require_once"koneksi.php"; 
if(!empty($_SESSION['member_id'])) { 
header ('location:member.php');
} else{
	
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
width:100%;}
</style>

</head>
<body>';
require_once"./assets/menu-nav.php";

echo'
<div class="container"><div class="row">
<div class="col-md-4 col-md-offset-4">
<div class="panel panel-body"><h3>Login</h3><hr>';
require_once"include/login-proses.php";
echo'
<form class="row-border" name="form1"  action="" method="post">

<div class="form-group">
<label>Username <span class="required">*</span></label>
<input name="member_username" type="text" class="required form-control" required>
</div>

<div class="form-group">
<label>Password <span class="required">*</span></label>
<input name="member_password" type="password" class="form-control" required>
</div>

<div class="form-actions">
<button class="btn  btn-warning" type="reset">Reset</button>
<button class="btn btn-primary" name="login" type="submit">Login</button>
</div>
</form>
</div></div>

</div></div>

</body>
</html>';}
