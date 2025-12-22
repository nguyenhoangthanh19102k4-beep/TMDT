<?php


//lay id goi edit
$id = $_GET['id'];

//ket noi csdl
require('./config/dbconnect.php');

$sql_str = "select 
products.product_id as pid,
description,
stock,
unit,
price,
disscounted_price,
products.product_name as pname,
images,
categories.category_name as cname,
brands.brand_name as bname,
targets.target_name as tname,
UV.uv_name as uvname,
Refractive.refractive_name as rname,
Material.material_name as mname,
products.status as pstatus
from products, categories, brands, targets, UV, Refractive, Material 
where products.category_id=categories.category_id 
and products.brand_id = brands.brand_id
and products.target_id = targets.target_id
and products.UV_id = UV.uv_id
and products.Refractive_id = Refractive.refractive_id
and products.Material_id = Material.material_id
and products.product_id=$id";
// echo $sql_str; exit;   //debug cau lenh

$res = mysqli_query($conn, $sql_str);

$product = mysqli_fetch_assoc($res);

if (isset($_POST['btnUpdate'])) {
    // Lấy dữ liệu từ form
    $name = $_POST['name'];
    $desc = $_POST['description'];
    $price = $_POST['price'];
    $dissPrice = $_POST['diss_price'];
    $stock = $_POST['stock'];
    $unit = $_POST['unit'];
    $category = $_POST['category'];
    $brand = $_POST['brand'];
    $target = $_POST['target'];
    $uv = $_POST['uv'];
    $refractive = $_POST['refractive'];
    $material = $_POST['material'];

    if (isset($_FILES['image']) && $_FILES['image']['name'] != "") {
        $imageName = basename($_FILES["image"]["name"]);
        $targetDir = dirname(__DIR__) . "/imgs/products/";
        $targetFile = $targetDir . $imageName;

        if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
            $sql_str2 = "UPDATE products SET
                product_name='$name',
                description='$desc',
                stock='$stock',
                unit='$unit',
                price='$price',
                disscounted_price='$dissPrice',
                images='$imageName',
                category_id='$category',
                brand_id='$brand',
                target_id='$target',
                uv_id='$uv',
                refractive_id='$refractive',
                material_id='$material'
                WHERE product_id=$id";
        }
    } else {
        $sql_str2 = "UPDATE products SET
            product_name='$name',
            description='$desc',
            stock='$stock',
            unit='$unit',
            price='$price',
            disscounted_price='$dissPrice',
            category_id='$category',
            brand_id='$brand',
            target_id='$target',
            uv_id='$uv',
            refractive_id='$refractive',
            material_id='$material'
            WHERE product_id=$id";
    }

    // Chỉ thực thi nếu $sql_str2 đã được tạo
    if (isset($sql_str2)) {
        mysqli_query($conn, $sql_str2);
        header("location: viewAllProducts.php");
        exit;
    }
}
?>
<?php include "./header.php";
include "./sidebar.php"; ?>
<div class="">
    <div id="myModalwrapper" class="modal-wrapper">
        <h2>Cập nhật sản phẩm</h2><a class="close" href="viewAllProducts.php">&times;</a>
        <div class="content">
            <div class="modal">
                <form enctype='multipart/form-data' action="" method="POST">
                    <label for="name">Tên sản phẩm:</label>
                    <input type="text" class="form-control" name="name" value="<?php echo $product['pname'] ?>">
                    <label>Hình ảnh hiện tại:</label><br>
                    <?php
                    $imgPath = preg_match('#^https?://#', $product['images'])
                        ? $product['images']
                        : '/GoodOptic/imgs/products/' . $product['images'];
                    ?>
                    <img src="<?= $imgPath ?>" height="150px">
                    <br>

                    <!-- Cho phép người dùng tải lên ảnh mới -->
                    <label for="image">Chọn ảnh mới (nếu muốn thay):</label>
                    <input type="file" name="image">
                    <br>
                    <label class="form-label">Mô tả sản phẩm:</label>
                    <textarea name="description" class="form-control" placeholder="Nhập...">
                        <?= $product['description'] ?>
                    </textarea>
                    <label for="stock">Số lượng:</label>
                    <input type="number" style="height: 25px; font-size: 16px;" class="form-control" name="stock" value=<?php echo $product['stock'] ?>><br>
                    <label for="unit">Đơn vị:</label>
                    <input type="text" class="form-control" name="unit" value="<?php echo $product['unit'] ?>">
                    <label for="price">Giá bán:</label>
                    <input type="text" class="form-control" name="price" value=<?php echo $product['price'] ?>>
                    <label for="diss_price">Giá sau khi giảm:</label>
                    <input type="text" class="form-control" name="diss_price" value=<?php echo $product['disscounted_price'] ?>>
                    <label>Danh mục:</label>
                    <select class="form-control" name="category">
                        <option>Chọn danh mục</option>
                        <?php
                        $sql_str = "select * from categories order by category_name";
                        $result = mysqli_query($conn, $sql_str);
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <option value="<?php echo $row['category_id']; ?>"
                                <?php
                                if ($row['category_name'] == $product['cname'])
                                    echo "selected";

                                ?>><?php echo $row['category_name']; ?></option>
                        <?php } ?>
                    </select>
                    <label>Thương hiệu:</label>
                    <select class="form-control" name="brand">
                        <option>Chọn thương hiệu</option>
                        <?php
                        $sql_str = "select * from brands order by brand_name";
                        $result = mysqli_query($conn, $sql_str);
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <option value="<?php echo $row['brand_id']; ?>"
                                <?php
                                if ($row['brand_name'] == $product['bname'])
                                    echo "selected";

                                ?>><?php echo $row['brand_name']; ?></option>
                        <?php } ?>
                    </select>
                    <label>Đối tượng:</label>
                    <select class="form-control" name="target">
                        <option>Chọn đối tượng</option>
                        <?php
                        $sql_str = "select * from targets order by target_name";
                        $result = mysqli_query($conn, $sql_str);
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <option value="<?php echo $row['target_id']; ?>"
                                <?php
                                if ($row['target_name'] == $product['tname'])
                                    echo "selected";

                                ?>><?php echo $row['target_name']; ?></option>
                        <?php } ?>
                    </select>
                    <label>UV:</label>
                    <select class="form-control" name="uv">
                        <option>Chọn UV</option>
                        <?php
                        $sql_str = "select * from UV order by uv_name";
                        $result = mysqli_query($conn, $sql_str);
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <option value="<?php echo $row['uv_id']; ?>"
                                <?php
                                if ($row['uv_name'] == $product['uvname'])
                                    echo "selected";

                                ?>><?php echo $row['uv_name']; ?></option>
                        <?php } ?>
                    </select>
                    <label>Khúc xạ:</label>
                    <select class="form-control" name="refractive">
                        <option>Chọn bệnh khúc xạ</option>
                        <?php
                        $sql_str = "select * from Refractive order by refractive_name";
                        $result = mysqli_query($conn, $sql_str);
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <option value="<?php echo $row['refractive_id']; ?>"
                                <?php
                                if ($row['refractive_name'] == $product['rname'])
                                    echo "selected";

                                ?>><?php echo $row['refractive_name']; ?></option>
                        <?php } ?>
                    </select>
                    <label>Chất liệu:</label>
                    <select class="form-control" name="material">
                        <option>Chọn chất liệu</option>
                        <?php
                        $sql_str = "select * from Material order by material_name";
                        $result = mysqli_query($conn, $sql_str);
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <option value="<?php echo $row['material_id']; ?>"
                                <?php
                                if ($row['material_name'] == $product['mname'])
                                    echo "selected";

                                ?>><?php echo $row['material_name']; ?></option>
                        <?php } ?>
                    </select>


                    <input type="submit" value="Cập nhật" name="btnUpdate">
                </form>
            </div>
        </div>
    </div>
</div>

</div>


<?php
require('./footer.php');

?>