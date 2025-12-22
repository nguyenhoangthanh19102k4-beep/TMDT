<?php
require('./config/dbconnect.php');

// Lấy toàn bộ tài khoản admin
$sql = "SELECT id, password FROM admins";
$res = mysqli_query($conn, $sql);

while ($row = mysqli_fetch_assoc($res)) {
    $id = $row['id'];
    $plain_password = $row['password'];

    // Kiểm tra nếu chưa được mã hóa (chuỗi hash thường dài >= 60 ký tự)
    if (strlen($plain_password) < 50) {
        // Mã hóa mật khẩu
        $hashed_password = password_hash($plain_password, PASSWORD_DEFAULT);

        // Cập nhật lại vào database
        $update_sql = "UPDATE admins SET password = '$hashed_password' WHERE id = $id";
        mysqli_query($conn, $update_sql);

        echo "✅ Mã hóa mật khẩu cho admin ID $id<br>";
    } else {
        echo "ℹ️ Bỏ qua admin ID $id (đã mã hóa)<br>";
    }
}
?>
