<?php
include_once "../../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $tarname = $_POST['t_name'];
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $tarname)));
    $insert_tar = mysqli_query($conn, "INSERT INTO `targets` (`target_name`, `slug`, `status`) VALUES 
    ( '$tarname', 
    '$slug', 
    'Active');");

    if (!$insert_tar) {
        echo mysqli_error($conn);
    } else {
        echo "Dữ liệu được thêm thành công";
        header("Location: ../../viewTarget.php");
    }
}
