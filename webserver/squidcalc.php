<?php
$calc = shell_exec("SquidCalc.exe");
$url = "index.php";
echo $calc;
header('Location: '.$url);
?>