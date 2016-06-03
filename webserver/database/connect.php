<?php
$servername="localhost";
$username="root";
$password="bogor";
$database="Perusahaan";
$connect=mysql_connect ($servername, $username, $password);

  if ($connect) {
    mysql_select_db ($database) or die ("Database Tidak Ditemukan");
     echo "<b> Koneksi Berhasil </b>";
   } else {
     echo "<b> Koneksi Gagal </b>";
   }

?>