<?php


//lay id goi edit
$id = $_GET['id'];

//ket noi csdl
require('./config/dbconnect.php');

$sql_str = "select 
order_id, customer_name, email, phone, address, pay_method, status from orders where order_id=$id";
// echo $sql_str; exit;   //debug cau lenh

$res = mysqli_query($conn, $sql_str);

$row = mysqli_fetch_assoc($res);

if (isset($_POST['btnUpdate'])) {
    // Lấy dữ liệu từ form
    $status = $_POST['status'];

    // Cập nhật trạng thái đơn hàng
    $sql_update_order = "UPDATE `orders` SET status = '$status' WHERE `order_id`=$id";
    mysqli_query($conn, $sql_update_order);

    // Lấy thông tin khách hàng từ đơn hàng
    $customer_name = $row['customer_name'];
    $email = $row['email'];
    $phone = $row['phone'];
    $address = $row['address'];

    // Kiểm tra xem khách hàng đã tồn tại chưa (dựa trên email hoặc SĐT)
    $sql_check = "SELECT customer_id FROM customers WHERE email = '$email' OR phone = '$phone'";
    $res_check = mysqli_query($conn, $sql_check);

    if (mysqli_num_rows($res_check) == 0) {
        // Nếu chưa có, thêm khách hàng mới
        $sql_insert_customer = "INSERT INTO customers (customer_name, email, phone, address)
                                VALUES ('$customer_name', '$email', '$phone', '$address')";
        mysqli_query($conn, $sql_insert_customer);
    }
    // Lưu ý: Bảng khách hàng chỉ hiện khách hàng có ở trong đơn hàng khi bạn bấm nút cập nhật 
    // Trở về trang danh sách đơn hàng
    header("location: viewAllOrders.php");
}
?>
<?php include "./header.php";
include "./sidebar.php"; ?>
<div class="">

    <div id="myModalwrapper" class="modal-wrapper">
        <div class="card-body p-0">
            <h2>Xem và cập nhật trạng thái đơn hàng</h2><a class="close" href="viewAllOrders.php">&times;</a>
            <div class="content">
                <div class="modal">
                    <form enctype='multipart/form-data' action="" method="POST">
                        <div style="text-align: left; font-weight: 500; font-size: 20px; margin-bottom: 10px;">
                            <span style="color: #333;">Tên khách hàng:</span>
                            <span style="color: #007bff; font-weight: 600;"><?= $row['customer_name'] ?></span>
                        </div>
                        <div style="text-align: left; font-weight: 500; font-size: 20px; margin-bottom: 10px;">
                            <span style="color: #333;">Địa chỉ:</span>
                            <span style="color: #007bff; font-weight: 600;"><?= $row['address'] ?></span>
                        </div>
                        <div style="text-align: left; font-weight: 500; font-size: 20px; margin-bottom: 10px;">
                            <span style="color: #333;">Số điện thoại:</span>
                            <span style="color: #007bff; font-weight: 600;"><?= $row['phone'] ?></span>
                        </div>
                        <div style="text-align: left; font-weight: 500; font-size: 20px; margin-bottom: 10px;">
                            <span style="color: #333;">Email:</span>
                            <span style="color: #007bff; font-weight: 600;"><?= $row['email'] ?></span>
                        </div>
                        <div style="text-align: left; font-weight: 500; font-size: 20px; margin-bottom: 10px;">
                            <span style="color: #333;">Hình thức thanh toán:</span>
                            <span style="color: #007bff; font-weight: 600;"><?= $row['pay_method'] ?></span>
                        </div>
                        <div style="text-align: left; font-weight: 500; font-size: 20px; margin-bottom: 10px;">
                            <span style="color: #333;">Trạng thái đơn hàng:</span>
                            <span style="color: #007bff; font-weight: 600;">
                                <select style="font-size: 16px;" name="status" id="">
                                    <option <?= $row['status'] == 'Đang xử lý' ? 'selected' : '' ?>>Đang xử lý
                                    </option>
                                    <option <?= $row['status'] == 'Đã xác nhận' ? 'selected' : '' ?>>Đã xác nhận
                                    </option>
                                    <option <?= $row['status'] == 'Đang giao hàng' ? 'selected' : '' ?>>Đang giao hàng
                                    </option>
                                    <option <?= $row['status'] == 'Đã giao hàng' ? 'selected' : '' ?>>Đã giao hàng
                                    </option>
                                    <option <?= $row['status'] == 'Đã hủy' ? 'selected' : '' ?>>Đã hủy
                                    </option>
                                </select>
                            </span>
                        </div>
                        <button class="btn btn-edit" name="btnUpdate" style="margin-bottom: 10px; font-size: 16px; padding: 8px 10px;">Cập nhật</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <h3>Chi tiết đơn hàng</h3>
                    <table class="table">
                        <tr>
                            <th>STT</th>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tiền</th>

                        </tr>
                        <?php
                        $sql = "SELECT 
                            products.product_id, 
                            products.product_name AS pname, 
                            order_details.price AS oprice, 
                            order_details.quantity, 
                            order_details.total 
                        FROM 
                            products 
                        INNER JOIN 
                            order_details 
                        ON 
                            products.product_id = order_details.product_id 
                        WHERE 
                            order_details.order_id = $id";
                        $res = mysqli_query($conn, $sql);
                        $stt = 0;
                        $tongtien = 0;
                        while ($row = mysqli_fetch_assoc($res)) {
                            $tongtien += $row['quantity'] * $row['oprice'];
                        ?>
                            <tr>
                                <td>
                                    <?= ++$stt ?>
                                </td>
                                <td>
                                    <?= $row['pname'] ?>
                                </td>
                                <td>
                                    <?= number_format($row['oprice'], 0, '', '.') . " VNĐ" ?>
                                </td>
                                <td>
                                    <?= $row['quantity'] ?>
                                </td>
                                <td>
                                    <?= number_format($row['total'], 0, '', '.') . " VNĐ" ?>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>
                    </table>
                    <br>
                    <div class="tongtien">
                        <h3>
                            Tổng tiền:
                            <?= number_format($tongtien, 0, '', '.') . " VNĐ" ?>
                        </h3>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
</div>
</div>

</div>


<?php
require('./footer.php');
?>