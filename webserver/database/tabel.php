<?php
//buat koneksi dengan MySQL
$link=mysql_connect('localhost','root','bogor');
   
//jika koneksi gagal, langsung keluar dari PHP
if (!$link)
{
   die("Koneksi dengan MySQL gagal");
}
   
//gunakan database universitas
$result=mysql_query('USE Perusahaan');
if (!$result)
{
   die("Database gagal konek");
}
 
//tampilkan tabel mahasiswa_ilkom
$result=mysql_query('SELECT * FROM Pegawai');
?>
<!DOCTYPE html>
<head>
   <meta charset="UTF-8">
   <title>AYUTINGTING</title>
<script src="js/jquery.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css"> 
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
</head>
<body><center>
   <h3>Tabel Karyawan</h3>
<hr>
<br>
<div class="table-responsive">
<table class="table table-hover">
<div class="row">
<div class="col-md-4">
<thead>
<tr>
   <th>NIP</th>
   <th>Nama</th>
   <th>Golongan</th>
   <th>Gender</th>
   <th>JumlahAnak</th>
   <th>MasaKerja</th>
   <th>Gaji</th>
   <th>Tunjangan_Anak</th>
   <th>Tunjangan_Masa_Kerja</th>
   <th>Gaji_Total</th>
</thead>


</tr>
<?php
while ($row=mysql_fetch_array($result))

{
   echo "<tr>";
   echo "<td>".$row['NIP']."</td>";
   echo "<td>".$row['Nama']."</td>";
   echo "<td>".$row['Golongan']."</td>";
   echo "<td>".$row['Gender']."</td>";
   echo "<td>".$row['Jumlah_Anak']."</td>";   
   echo "<td>".$row['Masa_Kerja']."</td>"; 
   echo "<td>".$row['Gaji']."</td>"; 
   echo "<td>".$row['Tunjangan_Anak']."</td>";
   echo "<td>".$row['Tunjangan_Masa_Kerja']."</td>";
   echo "<td>".$row['Gaji_Total']."</td>";  
   echo "</tr>";
}

?>
</tbody>
</table>
</div>
</div>
</div>
<a href="index.html"><button type="button" class="btn btn-primary">Kembali Ke Home</button></a>
</center>

   		<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap.js"></script>
<script src="js/scripts.js"></script>

	</body>
</html>