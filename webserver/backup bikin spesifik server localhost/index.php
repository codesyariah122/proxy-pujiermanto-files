<?php
//shell.php
/* $memory = shell_exec ('free -m');
$uptime = shell_exec ('uptime'); 
$programberjalan = shell_exec ('top'); */

$linuxversion = shell_exec ('uname -a');
$server = shell_exec ('squid -v');
$squid = shell_exec('restartsquid');

echo '<style>html { 
  background: url(teenage.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}</style>';
echo '<br>';
echo '<html>';
echo '<title>Welcome-Bonbin</title>';
echo '<center><h1 style="color:#FFFFFF; font-size:45px">Bonbin&nbsp;Server</h1></center>';
echo '<center><h1 style="color:#FFFFFF; font-size:35px">Server&nbsp;Info&nbsp:</h1></center>';
/* spesifikasi server bonbin */
echo '<br>';
echo '<center><table style="width:800px">';
echo '<tr style="color:#CC0000; font-weight:bold; font-size:30px;">';
echo "<td>$linuxversion</td>";
echo '</tr>';
echo '<tr style="color:#CC0000; font-weight:bold; font-size:30px;">';
echo "<td>$server</td>";
echo '</tr>';
echo '<tr style="color:#CC0000; font-weight:bold; font-size:30px;">';
echo "<td>$squid</td>";
echo '</tr>';
echo '</table></center>';
?>
