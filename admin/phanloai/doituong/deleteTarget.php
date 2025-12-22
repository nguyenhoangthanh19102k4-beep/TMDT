<?php
mysqli_report(MYSQLI_REPORT_OFF);
// Lấy id gửi đến
$delid = $_GET['id'];

// Kết nối CSDL
require('../../config/dbconnect.php');

// Sử dụng try-catch bằng cách kiểm tra thủ công mysqli_query và lỗi
$sql_str = "DELETE FROM targets WHERE target_id = $delid";
if (mysqli_query($conn, $sql_str)) {
    // Xóa thành công
    echo "<script>
        alert('Xóa thành công');
        window.location.href = '../../viewTarget.php';
    </script>";
} else {
    // Nếu lỗi do ràng buộc khóa ngoại
    if (str_contains(mysqli_error($conn), 'foreign key constraint fails')) {
        echo "<script>
            alert('Không thể xóa mục này vì có ràng buộc ở danh sách sản phẩm');
            window.location.href = '../../viewTarget.php';
        </script>";
    } else {
        // Các lỗi khác
        echo "<script>
            alert('Lỗi: " . addslashes(mysqli_error($conn)) . "');
            window.location.href = '../../viewTarget.php';
        </script>";
    }
}
?>
