<?php
// 1. Lấy ID khuyến mãi từ URL
$id = $_GET['id'];

// 2. Kết nối CSDL và lấy thông tin mã khuyến mãi hiện tại
require('./config/dbconnect.php');

$sql_str = "SELECT * FROM promotions WHERE promotion_id = $id";
$res = mysqli_query($conn, $sql_str);
$promo = mysqli_fetch_assoc($res);

// 3. Xử lý khi nhấn nút Cập nhật
if (isset($_POST['btnUpdate'])) {
    $code = $_POST['p_code'];
    $percent = $_POST['p_percent'];
    $max_val = $_POST['p_max_val'];
    $expiry = $_POST['p_expiry'];

    // Câu lệnh Update vào bảng promotions
    $sql_update = "UPDATE promotions SET 
                    promotion_code = '$code', 
                    discount_percentage = '$percent', 
                    max_discount_value = '$max_val', 
                    expiry_date = '$expiry' 
                  WHERE promotion_id = $id";

    if (mysqli_query($conn, $sql_update)) {
        header("location: viewPromotions.php");
    } else {
        echo "Lỗi cập nhật: " . mysqli_error($conn);
    }
}
?>

<?php 
include "header.php";
include "sidebar.php"; 
?>

<div class="">
    <div id="myModalwrapper" class="modal-wrapper">
        <h2>Cập nhật mã khuyến mãi</h2>
        <a class="close" href="viewPromotions.php">&times;</a>
        
        <div class="content">
            <div class="modal">
                <form enctype='multipart/form-data' action="" method="POST">
                    <label for="p_code">Mã khuyến mãi:</label>
                    <input type="text" class="form-control" name="p_code" 
                           value="<?php echo $promo['promotion_code'] ?>" required>

                    <label for="p_percent">Phần trăm giảm (%):</label>
                    <input type="number" class="form-control" name="p_percent" 
                           value="<?php echo $promo['discount_percentage'] ?>" min="0" max="100" required>

                    <label for="p_max_val">Số tiền giảm tối đa (đ):</label>
                    <input type="number" class="form-control" name="p_max_val" 
                           value="<?php echo $promo['max_discount_value'] ?>" required>

                    <label for="p_expiry">Ngày hết hạn:</label>
                    <input type="date" class="form-control" name="p_expiry" 
                           value="<?php echo $promo['expiry_date'] ?>" required>
                    
                    <br>
                    <div class="box">
                        <input type="submit" value="Cập nhật" name="btnUpdate">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<style>

</style>

<?php require('./footer.php'); ?>