<?php

function bacaHTML($url){
     // inisialisasi CURL
     $data = curl_init();
     // setting CURL
     curl_setopt($data, CURLOPT_RETURNTRANSFER, 1);
     curl_setopt($data, CURLOPT_URL, $url);
     // menjalankan CURL untuk membaca isi file
     $hasil = curl_exec($data);
     curl_close($data);
     return $hasil;
}
$memory = shell_exec ('free -m');
$hardisk = shell_exec ('df -h ');
$release = shell_exec ('lsb_release -a');
$proxy = fopen ("squid.txt" , "r");
$kodeHTML =  bacaHTML('http://172.16.0.2/bonbingrabb/index.php');
$center = "<center>";
$akhircenter = "</center>";
$pecah = explode('<p class="gambar">', $kodeHTML);
$pecahLagi = explode('</p>', $pecah[1]);
echo $center;
echo $pecahLagi[0];
echo '<br><br>';
echo '<h1 style="color:CC0000; font-size:18px;"><b>INI SERVER SAYA<br><br>';
echo "<table border='1'  width='700'><tr>";
echo '<th align="left">Spesifik Release Name</th>' ;
echo '<th align="left">kapasitas memorynya</th>' ;
echo '<th align="left">kapasitas Hardisknya</th>' ;
echo '<th align="left">proxy server</th>' ;
echo "</tr>";
echo "<tr>";
echo "<td>$release</td>";
echo "<td>$memory</td>";
echo "<td>$hardisk</td>";
echo '<td width:"100%"> fread($proxy, "10"("squid.txt"));
fclose($proxy);
</td>';
echo "</tr>";
echo '</table>';

echo '</h1></b>';
echo $akhircenter;
?>
