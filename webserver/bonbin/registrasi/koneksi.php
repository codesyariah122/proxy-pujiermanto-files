<?php session_start(); //error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
date_default_timezone_set("Asia/Jakarta");
$Host = "localhost";
$User = "root";
$Pass = "bogor";
$Db_name = "daftar";
$mysqli = new mysqli( $Host, $User, $Pass, $Db_name );
if ($mysqli->connect_error){
echo 'Gagal koneksi ke database';
} else {

} ?>

