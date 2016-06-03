<?php  if (isset($_POST['login'])) {
$error = array();
if (empty($_POST['member_username'])) { 
    $error[] = 'Username tidak boleh kosong'; 
} else {
    $member_username=mysqli_real_escape_string($mysqli, $_POST['member_username']);
 }

if (empty($_POST['member_password'])) { 
     $error[] = 'Password tidak boleh kosong'; 
  } else {
  $member_password=mysqli_real_escape_string($mysqli, md5($_POST['member_password']));
 }

if (empty($error)){
$member_jam_tgl_login =date("h:i:s-j-M-Y");	
$login="SELECT * FROM member WHERE member_username='$member_username' AND member_password='$member_password'";
$result = $mysqli->query($login) or die($mysqli->error.__LINE__);
$rows= $result->fetch_assoc();
extract($rows);
// Apabila username dan password ditemukan
if($result->num_rows > 0){
$_SESSION['member_id'] = $member_id;
header('location:./member.php');
echo "<meta http-equiv='refresh' content='0; url=./member.php";
$update="UPDATE member SET member_status='Online', member_jam_tgl_login='$member_jam_tgl_login' WHERE member_id='$member_id'" or die($conn->error.__LINE__);
$mysqli->query($update);
} else{
echo'<div class="alert alert-warning alert-dismissable">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Username atau Password salah..!</div>';
}
}
else {echo'<div class="alert alert-danger alert-dismissable"><ul>';
foreach ($error as $key => $values) {            
echo'<li>'.$values.'</li>';}
echo'</ul></div>';
}
unset($_POST['login']);}