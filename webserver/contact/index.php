<!DOCTYPE HTML>
<html lang="en">
	<head>
	<title>Contoh Penggunaan Dialog Pada Bootstrap</title>
	<!--Sisipkan Bootstrap serta JQuery yang diperlukan-->
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>	
	<script src="js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
	</head>
	
	<body>
	<center>
	<div style="margin-top:100px">
	<!--Link Yang akan memanggil Popup/Modal--> 
	<a href="#" data-toggle="modal" data-target="#contact" class="btn btn-lg btn-primary">Contact</a> 
	</div>
	</center>
	</body>
	<!--Sisipkan File (Isi Modal) yang ada di Folder include-->
    <?php include "include/dialog.php";?>

</html>