<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BookStore</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-item.css" rel="stylesheet">
	<link href="css/form.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">bookstore</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="order.php">order</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


<h1>Order NOW!!</h1>
<form method="post" action="order_process.php">

	<p><div class="control-group">
		<label for="name" class="col-md-3">Name</label>
	<input type="text" name="nama" id="nama" required>
		<div class="col-md-3">
		</div></p>

	<p><div class="control-group">
		<label for="alamat" class="col-md-3">Alamat</label>
	<input type="text" name="alamat" id="alamat" required>
		<div class="col-md-3">
		</div></p>

 	<p><div class="control-group">
		<label for="buku" class="col-md-3">buku</label>
	<select name="buku" required>
		<div class="col-md-3">

        <?php
        // koneksi ke database
        mysql_connect('localhost', 'root', 'bogor');
        // pilih database
        mysql_select_db('bookstore');
        // melakukan query 
        $result = mysql_query("SELECT * FROM books");
        while($data = mysql_fetch_array($result)) {
            echo "<option value='$data[book_id]'>$data[book_name] : Rp. $data[book_price]</option>";
        }
        ?>
        </select></div></p>
 
	<p><div class="control-group">
		<label for="jumlah" class="col-md-3">Jumlah</label>
	<input type="text" name="jumlah" size="5" required>
		<div class="col-md-3">
		</div> </p>      
    <br>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Beli" class="button">&nbsp;&nbsp;
	<input type="reset" value="Hapus Form"></p>
       
		</div>
	</div>
</div></div>
</form>
</body>
<html>