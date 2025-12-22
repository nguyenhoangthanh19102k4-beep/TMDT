<?php
include_once "../../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $matname = $_POST['m_name'];
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $matname)));
    $insert_mat = mysqli_query($conn, "INSERT INTO `Material` (`material_name`, `slug`, `status`) VALUES 
    ( '$matname', 
    '$slug', 
    'Active');");

    if (!$insert_mat) {
        echo mysqli_error($conn);
    } else {
        echo "Dữ liệu được thêm thành công";
        header("Location: ../../viewMaterial.php");
    }
}
