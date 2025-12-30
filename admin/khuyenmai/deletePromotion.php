<?php
// Lấy id từ URL tham số 'id'
if (isset($_GET['id'])) {
    $delid = $_GET['id'];

    // Kết nối CSDL
    require('../config/dbconnect.php');

    // Câu lệnh DELETE sử dụng cột promotion_id làm điều kiện
    $sql_str = "DELETE FROM promotions WHERE promotion_id = $delid";
    
    $result = mysqli_query($conn, $sql_str);

    if (!$result) {
        // Lỗi này thường xảy ra nếu mã khuyến mãi đang được dùng trong bảng Orders (lỗi khóa ngoại)
        echo "Không thể xóa khuyến mãi này vì đang có đơn hàng sử dụng mã này! Lỗi: " . mysqli_error($conn);
    } else {
        // Xóa thành công, quay lại trang danh sách
        header("location: ../viewPromotions.php");
    }
} else {
    // Nếu không có ID thì quay về trang chủ khuyến mãi
    header("location: ../viewPromotions.php");
}
?>