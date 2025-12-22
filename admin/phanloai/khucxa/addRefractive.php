<?php
include_once "../../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $refname = $_POST['r_name'];
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $refname)));
    $insert_ref = mysqli_query($conn, "INSERT INTO `Refractive` (`refractive_name`, `slug`, `status`) VALUES 
    ( '$refname', 
    '$slug', 
    'Active');");

    if (!$insert_ref) {
        echo mysqli_error($conn);
    } else {
        echo "Dữ liệu được thêm thành công";
        header("Location: ../../viewRefractive.php");
    }
}
