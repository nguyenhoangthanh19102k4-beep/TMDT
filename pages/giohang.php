<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
$server = "localhost";
$user = "root";
$password = "";
$db = "GoodOptic";

$conn = mysqli_connect($server, $user, $password, $db);

if (!$conn) {
    die("Kết nối thất bại:" . mysqli_connect_error());
}

if (isset($_POST['update_quantity_id']) && isset($_POST['update_quantity_value'])) {
    $id = $_POST['update_quantity_id'];
    $quantity = max(1, intval($_POST['update_quantity_value']));

    foreach ($_SESSION['cart'] as $index => $sp) {
        if ($sp['id'] == $id) {
            $_SESSION['cart'][$index]['quantity'] = $quantity;
            break;
        }
    }
}

if (isset($_POST['del_id'])) {
    $id = $_POST['del_id'];
    foreach ($_SESSION['cart'] as $index => $sp) {
        if ($sp['id'] == $id) {
            unset($_SESSION['cart'][$index]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
            break;
        }
    }
}

if (isset($_POST['thanhtoan'])) {
    $hoten = $_POST['hoten'] ?? '';
    $dt = $_POST['dt'] ?? '';
    $mail = $_POST['mail'] ?? '';
    $tinh = $_POST['tinh'] ?? '';
    $xa = $_POST['xa'] ?? '';
    $sonha = $_POST['sonha'] ?? '';
    $hinhthuc = $_POST['hinhthuc'] ?? '';
    $status = 'Đang xử lý';

    $fullAddress = "$sonha, $xa, $tinh";

    if (!isset($_COOKIE['customer_id'])) {
        $kh = mysqli_prepare($conn, "INSERT INTO customers (customer_name, email, phone, address) VALUES (?,?,?,?)");
        mysqli_stmt_bind_param($kh, 'ssss', $hoten, $mail, $dt, $fullAddress);
        mysqli_stmt_execute($kh);
        $customer_id = mysqli_insert_id($conn);
        setcookie("customer_id", $customer_id, time() + (86400 * 30));
    } else {
        $customer_id = intval($_COOKIE['customer_id']);
    }

    $dh = mysqli_prepare($conn, "INSERT INTO orders 
    (customer_id, customer_name, address, phone, email, pay_method, status) 
    VALUES (?,?,?,?,?,?,?)");
    mysqli_stmt_bind_param(
        $dh,
        'issssss',
        $customer_id,
        $hoten,
        $fullAddress,
        $dt,
        $mail,
        $hinhthuc,
        $status
    );
    mysqli_stmt_execute($dh);
    $order_id = mysqli_insert_id($conn);

    foreach ($_SESSION['cart'] as $sp) {
        $product_id = $sp['id'];
        $quantity = $sp['quantity'];
        $price = $sp['price'];
        $total_ct = $price * $quantity;

        $ctdh = mysqli_prepare($conn, "INSERT INTO order_details (order_id, product_id, price, quantity, total) VALUES (?,?,?,?,?)");
        mysqli_stmt_bind_param($ctdh, 'iidid', $order_id, $product_id, $price, $quantity, $total_ct);
        mysqli_stmt_execute($ctdh);
    }

    unset($_SESSION['cart']);
    echo "<script>alert('Đặt hàng thành công!'); window.location='index.php';</script>";
    exit();
}

if (empty($_SESSION['cart'])) {
    echo '<div align="center" style="min-height: 450px; margin-top: 80px;">
            <img style="width: 130px; height: 130px;" src="imgs/solar--cart-3-broken.svg" alt="">
            <h3 style="color: gray;">CHƯA CÓ SẢN PHẨM NÀO TRONG GIỌ</h3>
          </div>';
    return;
}
?>


<div class="giohang">
    <form class="ttvc" method="post" name="infor" id="infor" onsubmit="return checkInfomation();">
        <b style="font-size: 25px;">THÔNG TIN VẬN CHUYỂN</b> <br>
        <i style="font-size: 13px;">Vui lòng nhập đầy đủ các thông tin bên dưới</i>

        <div>
            <p>Họ và tên *</p>
            <input type="text" name="hoten" placeholder="Họ và tên của bạn">
        </div>
        <div style="display: flex; gap: 5px">
            <div class="sdt" style="width: 52%;">
                <p>Số điện thoại *</p>
                <input type="text" name="dt" placeholder="Số điện thoại của bạn">
            </div>
            <div class="email">
                <p>Email</p>
                <input type="text" name="mail" placeholder="Email của bạn">
            </div>
        </div>
        <div class="noio" style="width: 98%;">
            <div>
                <p>Tỉnh/Thành phố *</p>
                <select name="tinh" id="tinh" style="width: 90%;">
                    <option value="">Chọn tỉnh thành</option>

                </select>
            </div>
            <div>
                <p>Quận/Huyện *</p>
                <select name="huyen" id="huyen" style="width: 90%;">
                    <option value="">Chọn huyện</option>

                </select>
            </div>
            <div>
                <p>Xã/Phường *</p>
                <select name="xa" id="xa" style="width: 90%;">
                    <option value="">Chọn xã</option>

                </select>
            </div>
        </div>
        <div>
            <p>Số nhà *</p>
            <input type="text" name="sonha" placeholder="Ví dụ: Số 20, Võ Oanh...">
        </div>
        <div>
            <p>Chú thích</p>
            <textarea name="note" sps="6" placeholder="Chú thích cho đơn hàng của bạn về đơn hàng hoặc về vận chuyển,..."></textarea>
        </div>
        <div class="htthanhtoan" style="margin-top: 20px;">
            <b style="font-size: 25px;">HÌNH THỨC THANH TOÁN</b>
            <label>Thanh toán khi nhận hàng<input type="radio" name="hinhthuc" value="Tiền mặt" checked="true"></label>
            <label>Chuyển khoản ngân hàng<input type="radio" name="hinhthuc" value="Chuyển khoản"></label>
            <p style="font-size: 10px; margin: -10px 3px; font-size: 12px;">Thông tin cá nhân của bạn được sử dụng để xử lý đơn hàng, trải nghiệm trên trang web và các mục đích khác được mô tả trong <b>chính sách bảo mật</b> của chúng tôi.</p>
            <input type="submit" name="thanhtoan" id="thanhtoan" value="THANH TOÁN"></input>
        </div>
    </form>

    <div class="ttvc">
        <b style="font-size: 25px;">GIỎ HÀNG</b>
        <?php $total = 0; ?>
        <?php foreach ($_SESSION['cart'] as $sp): ?>
            <div class="sp_cart" style="margin-top: 25px;">
                <a style="margin-bottom: 20px;" href="index.php?page=chitiet&id=<?php echo $sp['id']; ?>" class="sp">
                    <div class="ndsp" style="display: flex; flex-direction: row; gap: 30px; justify-content: flex-start;">
                        <div class="anhsp" style="width: 140px;">
                            <?php
                            $imgInput = $sp['imgs'];

                            // Nếu là URL tuyệt đối
                            if (preg_match('#^https?://#i', $imgInput)) {
                                $imgSrc = $imgInput;
                            } else {
                                // Là tên file ảnh, nối vào thư mục local
                                $localPath = 'imgs/products/' . $imgInput;

                                // Kiểm tra file có tồn tại không
                                if (file_exists($localPath)) {
                                    $imgSrc = $localPath;
                                } else {
                                    $imgSrc = 'imgs/products/default.jpg'; // fallback ảnh mặc định
                                }
                            }
                            ?>
                            <img src="<?php echo $imgSrc; ?>" alt="Ảnh sản phẩm" loading="lazy">
                        </div>
                        <div>
                            <p class="tensp" style="width: 230px;margin: 0; font-weight: 500;"> <a href="index.php?page=chitiet&id=<?php echo $sp['id']; ?>" style="text-decoration: underline; color: black;"><?php echo $sp['name']; ?></a></p>
                            <p class="gia" style="margin-top: 20px;"><?php echo number_format($sp['price'], 0, ',', '.') . ' đ'; ?></p>
                            <form method="post" style="display: inline-block;">
                                <input type="hidden" name="update_quantity_id" value="<?php echo $sp['id']; ?>">
                                <input type="number" name="update_quantity_value" value="<?php echo $sp['quantity']; ?>" min="1" onchange="this.form.submit()">
                            </form>
                        </div>
                        <form method="post">
                            <input type="hidden" name="del_id" value="<?php echo $sp['id']; ?>">
                            <input type="submit" name="del" value="X">
                        </form>
                    </div>
                </a>
            </div>
            <?php
            $t = $sp['price'] * $sp['quantity'];
            $total += $t; ?>
        <?php endforeach; ?>
        <b style="font-size: 25px;">MÃ GIẢM GIÁ</b>
        <div class="giamgia" style="display: flex; gap:10px; margin-top:20px; margin-bottom: 60px;">
            <input style="width:60%; font-size:17px;" type="text" name="magiamgia" id="magiamgia" placeholder="NHẬP MÃ GIẢM GIÁ">
            <input type="submit" name="giam" value="ÁP DỤNG"></input>
        </div>
        <div class="tien">
            <b style="font-size: 20px;">TỔNG TIỀN</b>
            <p><?php echo number_format($total, 0, ',', '.') . ' VNĐ'; ?></p>
        </div>
    </div>
</div>


<?php

?>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 1. Lấy danh sách Tỉnh/Thành
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function(data_tinh) {
            if (data_tinh.error == 0) {
                $.each(data_tinh.data, function(key_tinh, val_tinh) {
                    // Lưu ID vào attribute để dùng lấy Huyện, lưu Name vào value để gửi form PHP
                    $('#tinh').append(`<option value="${val_tinh.full_name}" data-id="${val_tinh.id}">${val_tinh.full_name}</option>`);
                });
            }

            // 2. Khi chọn Tỉnh -> Lấy Huyện
            $("#tinh").change(function() {
                var id_tinh = $(this).find(':selected').data('id');
                $('#huyen').html('<option value="">Chọn Quận/Huyện</option>');
                $('#xa').html('<option value="">Chọn Xã/Phường</option>');
                
                if (id_tinh) {
                    $.getJSON(`https://esgoo.net/api-tinhthanh/2/${id_tinh}.htm`, function(data_huyen) {
                        if (data_huyen.error == 0) {
                            $.each(data_huyen.data, function(key_huyen, val_huyen) {
                                $('#huyen').append(`<option value="${val_huyen.full_name}" data-id="${val_huyen.id}">${val_huyen.full_name}</option>`);
                            });
                        }
                    });
                }
            });

            // 3. Khi chọn Huyện -> Lấy Xã
            $("#huyen").change(function() {
                var id_huyen = $(this).find(':selected').data('id');
                $('#xa').html('<option value="">Chọn Xã/Phường</option>');
                
                if (id_huyen) {
                    $.getJSON(`https://esgoo.net/api-tinhthanh/3/${id_huyen}.htm`, function(data_xa) {
                        if (data_xa.error == 0) {
                            $.each(data_xa.data, function(key_xa, val_xa) {
                                $('#xa').append(`<option value="${val_xa.full_name}">${val_xa.full_name}</option>`);
                            });
                        }
                    });
                }
            });
        });
    });
</script>