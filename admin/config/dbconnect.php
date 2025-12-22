<?php
mysqli_report(MYSQLI_REPORT_OFF);
error_reporting(0);
ini_set('display_errors', 0);
// Kết nối cơ sở dữ liệu
$server = "localhost";
$user = "root";
$password = "";
$db = "GoodOptic";

$conn = mysqli_connect($server, $user, $password, $db);
// Thông báo lỗi cụ thể
if (!$conn) {
    $error_code = mysqli_connect_errno();
    $error_msg = mysqli_connect_error();
    $message = "";
    // Sử dụng các mã lỗi phổ biến trong MySQL để thông báo lỗi
    switch ($error_code) {
        case 1045:
            $message = "Sai mật khẩu hoặc tài khoản đăng nhập MySQL.";
            break;
        case 1044:
            $message = "Người dùng không có quyền truy cập cơ sở dữ liệu.";
            break;
        case 1049:
            $message = "Cơ sở dữ liệu không tồn tại.";
            break;
        case 2002:
            $message = "Không kết nối được đến máy chủ.";
            break;
        default:
            $message = "Kết nối cơ sở dữ liệu thất bại: [$error_code] $error_msg";
            break;
    }

    echo "
    <html>
    <head>
        <style>
            body {
                background: #f8f9fa;
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
                max-width: 500px;
                text-align: center;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div class='alert'>$message</div>
    </body>
    </html>
    ";
    exit;
}
?>
