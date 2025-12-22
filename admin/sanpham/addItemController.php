<?php
include_once "../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $ProductName = $_POST['p_name'];
    $desc = $_POST['p_desc'];
    $price = $_POST['p_price'];
    $diss_price = $_POST['d_price'];
    $stock = $_POST['stock'];
    $unit = $_POST['unit'];
    $category = $_POST['category'];
    $brand = $_POST['brand'];
    $target = $_POST['target'];
    $uv = $_POST['uv'];
    $refractive = $_POST['refractive'];
    $material = $_POST['material'];

    $image = $_FILES['image']['name'];
    $image_tmp = $_FILES['image']['tmp_name'];

    move_uploaded_file($image_tmp, '../../imgs/products/'.$image);

    $insert = mysqli_query($conn, "INSERT INTO products
         (product_name,images,price,disscounted_price,stock,description,category_id,brand_id,unit,target_id,UV_id,Refractive_id,Material_id) 
         VALUES ('$ProductName','$image',$price,$diss_price,$stock,'$desc','$category','$brand','$unit','$target','$uv','$refractive','$material')");
    
    
    if (!$insert) {
        echo mysqli_error($conn);
    } else {
        echo "Sản phẩm đã được thêm thành công";
        header("Location: ../viewAllProducts.php");
    }
}
