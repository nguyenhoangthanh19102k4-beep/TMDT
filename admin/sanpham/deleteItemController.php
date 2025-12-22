
<?php

//lay id goi den
$delid = $_GET['id'];

//ket noi csdl
require('../config/dbconnect.php');

$sql_str = "delete from products where product_id=$delid";
mysqli_query($conn, $sql_str);

//trở về trang liệt kê brands
header("location: ../viewAllProducts.php");

