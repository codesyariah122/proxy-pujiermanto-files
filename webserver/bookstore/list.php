<html>
<head>
    <title>Book Store</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<?php
// koneksi ke database
mysql_connect('localhost', 'root', 'bogor');
// pilih database
mysql_select_db('bookstore');
// melakukan query 
$result = mysql_query("SELECT * FROM books");
 
// menampilkan ke browser
echo "<h1>Books List</h1>";
echo "<ul>";
// mengambil data
while($data = mysql_fetch_array($result)) {
    echo "<li>$data[book_name] : Rp. $data[book_price]</li>";
}
echo "</ul>";
?>
<a href="order.php">[order]</a>
</body>
<html>