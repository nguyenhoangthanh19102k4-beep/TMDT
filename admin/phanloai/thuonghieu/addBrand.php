<?php
include_once "../../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $brandname = $_POST['b_name'];
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $brandname)));
    $insert =  mysqli_query($conn, "INSERT INTO `brands` (`brand_name`, `slug`, `status`) VALUES 
    ( '$brandname', 
    '$slug', 
    'Active');");

    if (!$insert) {
        echo mysqli_error($conn);
    } else {
        echo "Thương hiệu được thêm thành công";
        header("Location: ../../viewBrand.php");
    }
}