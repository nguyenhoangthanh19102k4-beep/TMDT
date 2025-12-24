<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Hàm gửi mail nhận vào Email nhận và Tên người nhận
function guiMailThanhToan($recipientEmail, $recipientName) {
    require "PHPMailer/src/Exception.php";
    require "PHPMailer/src/PHPMailer.php";
    require "PHPMailer/src/SMTP.php";

    $config = include(__DIR__ . '/mailconfig.php');
    $mail = new PHPMailer(true);

    try {
        // --- THÊM DÒNG NÀY ĐỂ XEM LỖI ---
        $mail->SMTPDebug = 2; // 2 = Hiển thị chi tiết lỗi kết nối và phản hồi từ server
        $mail->Debugoutput = 'html'; // Định dạng lỗi hiển thị dưới dạng HTML cho dễ đọc

        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = $config['email'];
        $mail->Password   = $config['password'];
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port       = 587;
        $mail->CharSet    = 'UTF-8';

        $mail->setFrom($config['email'], 'GOOD OPTIC');
        $mail->addAddress($recipientEmail, $recipientName);

        $mail->isHTML(true);
        $mail->Subject = 'Thông báo đặt hàng thành công';
        $mail->Body    = "Chào $recipientName, đơn hàng của bạn đã được tiếp nhận.";

        $mail->send();
        return true;
    } catch (Exception $e) {
        // --- THAY ĐỔI ĐỂ HIỆN LỖI RA MÀN HÌNH ---
        echo "Lỗi gửi mail chi tiết: {$mail->ErrorInfo}";
        return false;
    }
}
?>