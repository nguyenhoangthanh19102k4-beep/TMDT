<?php
include_once "../../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $catname = $_POST['c_name'];
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $catname)));
    $insert =  mysqli_query($conn, "INSERT INTO `categories` (`category_name`, `slug`, `category_status`) VALUES 
    ( '$catname', 
    '$slug', 
    'Active');");

    if (!$insert) {
        echo mysqli_error($conn);
    } else {
        echo "Dữ liệu được thêm thành công";
        header("Location: ../../viewCategories.php");
    }
}
