<?php
include "src/PHPMailer.php";
include "src/Exception.php";
include "src/OAuth.php";
include "src/POP3.php";
include "src/SMTP.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


$mail = new PHPMailer(true); // Enable exceptions

// SMTP Configuration
$mail->SMTPDebug = 2;
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com'; // Your SMTP server
$mail->SMTPAuth = true;
$mail->Username = 'haman3042@gmail.com'; // Your Mailtrap username
$mail->Password = 'lqcm kfuy gtuv jdxw'; // Your Mailtrap password
$mail->SMTPSecure = 'tls';
$mail->Port = 587;

// Sender and recipient settings
$mail->setFrom('haman3042@gmail.com', 'GOOD OPTIC');
$mail->addAddress('manhmk3944@ut.edu.vn', 'Kieu Man');

// Sending plain text email
$mail->isHTML(false); // Set email format to plain text
$mail->Subject = 'Your Subject Here';
$mail->Body    = 'This is the plain text message body';

// Send the email
if(!$mail->send()){
    echo 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message has been sent';
}
?>