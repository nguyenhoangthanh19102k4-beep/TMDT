<?php
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    $server = "localhost";
    $user = "root";
    $password = "";
    $db = "goodoptic";

    $conn = mysqli_connect($server, $user, $password, $db);

    if (!$conn) {
        die("Kết nối thất bại:" . mysqli_connect_error());
    }
?>

<h1 style="text-align: center;">TRA CỨU ĐƠN HÀNG</h1>

<div class="tracuu">
    <form action="">
        <input placeholder="Nhập mã đơn hàng" type="text" name="order-code">
        <input placeholder="Nhập số điện thoại/Email" type="text" name="order-number-or-email">
        <button type="submit" name="search-order">
            TRA CỨU
        </button>
    </form>
 </div>
 