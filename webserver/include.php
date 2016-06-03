<div class="content">
	<h1 style="font-weight:bold; font-size:50px;">HIPSTER</h1>
	<p style="color:#000000; font-size:30px; font-weight:bold;">
			<?php	$alamat = "SasakPanjang-TajurHalang";
	         		$phone = "0878-8693-7368 ";
				$admin = "Puji Ermanto";
				$file = fopen("server.txt", "r")
				or die("file tidak bisa dibuka"); ?>

<table  style="width:40%" font size="60px" align="center">
<tr>
<th align="left">Alamat</th>
<td height="30" width:"30"><?php echo $alamat; ?></td>
</tr>
<tr>
<th align="left">Telephone</th>
<td height="30"><?php echo $phone; ?></td>
</tr>
<tr>
<th align="left">Admin IT</th>
<td height="30"><?php echo $admin; ?></td>
</tr >
</table></p>


<p style="font-size:30px; font-weight:bold;">
<?php echo fread($file, filesize("server.txt"));
fclose($file); ?>
<?php include ('time.php'); ?> <?php echo'<br>';?>
<?Php

for($a = 1; $a<=58; $a++)
{
	echo "=";
}?><?php echo'<br>';?>
</p>

<?php
include 'aset.css';
$grab = file_get_contents('http://172.16.0.2/squidreport//2016/05/index.html');
$start = '<h4>Cache Statistics on 2016-05</h4>';
$end = '<table class="graphs"></table>';
$startposisi = strpos($grab, $start);
$sendposisi = strpos($grab, $send);
$longtext = $endposisi - $startposisi;
$result = substr($grab, $startposisi, $longtext);
echo $result;
?>

</div>

