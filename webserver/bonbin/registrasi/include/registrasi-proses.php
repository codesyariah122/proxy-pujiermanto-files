<?PHP
if (isset($_POST['registrasi'])) {  
$error = array();
    if (empty($_POST['member_nama'])) {  
        $error[] = 'Nama lengkap tidak boleh kosong'; 
    } else {
        $member_nama =mysqli_real_escape_string($mysqli, $_POST['member_nama']);
		
    }

if (empty($_POST['member_username'])) {  
        $error[] = 'Username tidak boleh kosong'; 
    } else {
       $member_username =mysqli_real_escape_string($mysqli, $_POST['member_username']);
    }
	

    if (empty($_POST['member_password'])) {
        $error[] = 'Kata sandi tidak boleh kosong'; }

 if(strlen($_POST['member_password']) < 5 || strlen($_POST['member_password']) > 15){
 $error['password'] = "Masukkan Pasword minimal 5 karakter maksimal 15 karakter";
 } else {
	 $member_password = mysqli_real_escape_string($mysqli,md5($_POST['member_password']));}


$member_email = mysqli_real_escape_string($mysqli, $_POST['member_email']);
if (!filter_var($member_email, FILTER_VALIDATE_EMAIL)) {
$error[] = 'Alamat Email yang anda masukkan salah';
} else {
$member_email = mysqli_real_escape_string($mysqli, $_POST['member_email']);
 }



$member_tgl_daftar=date("j-M-Y");
$member_jam_tgl_login =date("h:i:s-j-M-Y");	
if(!empty($_SERVER['HTTP_CLIENT_IP'])){
      $member_ip=$_SERVER['HTTP_CLIENT_IP'];
    }
    elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
      $member_ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    else{
      $member_ip=$_SERVER['REMOTE_ADDR'];
    }
	
if (empty($error)){

// query untuk mencari email yg sdh ada di database
$query ="SELECT * FROM member WHERE member_email ='$member_email'";
$result = $mysqli->query($query) or die($mysqli->error.__LINE__);
if(!$result->num_rows > 0){
	
$insert="INSERT INTO member values('','$member_nama', '$member_username', '$member_password', '$member_email', '$member_tgl_daftar', '$member_ip', '$member_jam_tgl_login', 'Ofline')" 
or die($mysqli->error.__LINE__);
if($mysqli->query($insert) === false) { 

echo'<div class="alert alert-danger alert-dismissable">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Maaf anda tidak bisa mendaftar karena sistem kami ada kesalahan..!</div>';
  } 
  else   {
echo'<div class="alert alert-warning alert-dismissable">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Pendaftaran menjadi member berhasil..!</div>';


 }
 }



else   {
echo'<div class="alert alert-danger alert-dismissable">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Maaf Sebelumnya akun ini sudah terdaftar...!</div>';
 }
}

  


else {echo'<div class="alert alert-danger alert-dismissable"><ul>';
foreach ($error as $key => $values) {            
echo'<li>'.$values.'</li>';}
echo'</ul></div>';
}
unset($_POST['registrasi']);
mysqli_close($mysqli); }