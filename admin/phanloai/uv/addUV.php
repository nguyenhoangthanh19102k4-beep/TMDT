<?php
include_once "../../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $uvname = $_POST['uv_name'];
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $uvname)));
    $insert_uv = mysqli_query($conn, "INSERT INTO `UV` (`uv_name`, `slug`, `status`) VALUES 
    ( '$uvname', 
    '$slug', 
    'Active');");

    if (!$insert_uv) {
        echo mysqli_error($conn);
    } else {
        echo "Dữ liệu được thêm thành công";
        header("Location: ../../viewUV.php");
    }
}
