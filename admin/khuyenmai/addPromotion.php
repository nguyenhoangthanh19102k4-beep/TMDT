<?php
include_once "../config/dbconnect.php";

if (isset($_POST['upload'])) {
    // Lấy dữ liệu từ POST
    $p_code = $_POST['p_code'];
    $p_percent = $_POST['p_percent'];
    $p_times = $_POST['p_time'];
    $p_max_val = $_POST['p_max_val'];
    $p_start = $_POST['p_start'];
    $p_expiry = $_POST['p_expiry'];

    // Câu lệnh INSERT vào bảng promotions
    // Lưu ý: Các tên cột phải khớp chính xác với database (promotion_code, discount_percentage,...)
    $query = "INSERT INTO promotions 
              (promotion_code, discount_percentage, times, max_discount_value, start_date,expiry_date, created_at) 
              VALUES ('$p_code', '$p_percent', '$p_time', '$p_max_val', '$p_start', '$p_expiry', NOW())";

    $insert = mysqli_query($conn, $query);

    if (!$insert) {
        // Trường hợp lỗi (ví dụ trùng mã code vì có ràng buộc UNIQUE)
        echo "Lỗi: " . mysqli_error($conn);
    } else {
        // Thêm thành công, quay lại trang danh sách
        header("Location: ../viewPromotions.php");
    }
}
?>