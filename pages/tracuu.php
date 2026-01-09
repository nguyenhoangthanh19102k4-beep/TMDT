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
    </form>

    <div class="dichvu"> 
        <div class="dvu1">
            <div>
            <img src="imgs/trangchu/mdi--support 2.svg" alt="" class="">
            <p> <b>Vệ Sinh Kính Miễn Phí</b> <br>
            tại toàn bộ hệ thống mắt kính Good Optic
            </p>
            </div>
            <div>
            <img src="imgs/trangchu/carbon--delivery 1.svg" alt="" class="">
            <p> <b >Giao Hàng Nhanh</b><br>
            chỉ từ 2 ngày trên toàn quốc
            </p>
            </div>
        </div>
        
        <div class="dvu1"> 
            <div>
            <img src="imgs/trangchu/carbon--ibm-data-product-exchange 1.svg" alt="" class="">
            <p> <b>Thu Cũ Đổi Mới </b><br>
            trợ giá lên đến 200.000đ
            </p>
            </div>
            <div>
            <img src="imgs/trangchu/image 1.svg" alt="" class="">
            <p> <b>Hỗ Trợ Đo Mắt</b> <br>
            tại toàn bộ hệ thống mắt kính Good Optic
            </p>
            </div>
        </div>
        
    </div>
</div>
 