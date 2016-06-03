<?php

include('connect.php');

$NIP = $_POST['NIP'];
$Nama = $_POST['Nama'];
$Golongan = $_POST['Golongan'];
$Gender = $_POST['Gender'];
$JumlahAnak = $_POST['JumlahAnak'];
$MasaKerja = $_POST['MasaKerja'];

if($Golongan == "A" || $Golongan == "a"){
$Gaji = 3000000;
}
elseif($Golongan == "B" || $Golongan == 'b'){
  $Gaji = 2000000;
}

else{
die("salah golongan.");
}

if($Gender == "laki-laki"){
  $Gender = laki-laki;
}

elseif($Gender == "perempuan"){
  $Gender = perempuan;
}

if($JumlahAnak == 0){
  $TunjanganAnak = 0;
}
elseif($JumlahAnak <= 3){
  $TunjanganAnak = 0.1 * $Gaji;
}
else{
  $TujanganAnak = 0.2 * $Gaji;
}

if($MasaKerja >= 5){
  $TunjanganMasaKerja = 0.5 * $Gaji;
}
else{
  $TunjanganMasaKerja = 0.1 * $Gaji;
}

$GajiTotal = $Gaji + $TunjanganAnak + $TunjanganMasaKerja;

$q = "INSERT INTO Pegawai (
      NIP,
      Nama,
      Golongan,
      Gender,
      Jumlah_Anak,
      Masa_kerja,
      Gaji,
      Tunjangan_Anak,
      Tunjangan_Masa_Kerja,
      Gaji_Total
      )
      VALUES (
      $NIP,
      '$Nama',
      '$Golongan',
      '$Gender',
      $JumlahAnak,
      $MasaKerja,
      $Gaji,
      $TunjanganAnak,
      $TunjanganMasaKerja,
      $GajiTotal
      )";

if(mysql_query($q, $connect)){

    echo "sip lanjut";header("location: http://172.16.0.2/database/tabel.php");
}

else {
  die(mysql_error());

}


?>

