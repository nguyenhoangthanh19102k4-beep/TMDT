<?php
session_start();
$errorMsg = '';

// Nếu user submit form
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['dangnhap'])) {
    require_once('./config/dbconnect.php');
    $email    = $_POST['email'];
    $password = $_POST['password'];

    // Chỉ lấy tài khoản theo email (không kiểm tra password trong SQL nữa)
    $sql = "SELECT id, email, password, name, type FROM admins WHERE email = '$email'";
    $result = mysqli_query($conn, $sql) or die(mysqli_error($conn));

    if (mysqli_num_rows($result) > 0) {
        $admin = mysqli_fetch_assoc($result);

        // So sánh mật khẩu nhập vào với mật khẩu đã mã hóa trong DB
        if (password_verify($password, $admin['password'])) {
            // Đăng nhập thành công
            $_SESSION['user'] = $admin;
            header('Location: index.php');
            exit;
        } else {
            // Sai mật khẩu
            $errorMsg = 'Email hoặc mật khẩu không đúng.';
        }
    } else {
        // Không tìm thấy email
        $errorMsg = 'Email hoặc mật khẩu không đúng.';
    }
}

// Luôn load form (kể cả POST thất bại)
require_once('loginform.php');
