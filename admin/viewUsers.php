<?php include "./header.php"; 
include "./sidebar.php";
if ($_SESSION['user']['type'] != 'Admin'){
    echo "<h2>Bạn không có quyền truy cập nội dung này</h2>";
} else {
?>

<div>
  <h2>Quản lý người dùng</h2>
    <table class="table ">
        <thead>
            <tr>
                <th class="text-center">STT</th>
                <th class="text-center">Tên</th>
                <th class="text-center">Email</th>
                <th class="text-center">Type</th>
                <th class="text-center">Trạng thái</th>
                <th class="text-center" colspan="2">Hành động</th>
            </tr>
        </thead>
        <?php
        include_once "./config/dbconnect.php";
        $sql = "SELECT id, name, email, type, status from admins order by created_at";
        $result = $conn->query($sql);
        $count = 1;
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
        ?>
                <tr>
                    <td><?= $count ?></td>
                    <td><?= $row["name"] ?></td>
                    <td><?= $row["email"] ?></td>
                    <td><?= $row["type"] ?></td>
                    <td><?= $row["status"] ?></td>
                    <td><a class="btn-edit" href="editAdmin.php?id=<?=$row['id']?>">Sửa</a></td>
                    <td><a class="btn-delete" 
                    href="nguoidung/deleteAdmin.php?id=<?=$row['id']?>"
                    onclick="return confirm('Bạn chắc chắn xóa mục này?');">Xóa</a></td>
                </tr>
        <?php
                $count = $count + 1;
            }
        }
        ?>
    </table>
    <div class="box">
        <a class="button" href="#divOne">Thêm mới</a>
    </div>
    <div class="overlay" id="divOne">
        <div id="myModalwrapper" class="modal-wrapper">
            <h2>Thêm mới người dùng</h2><a class="close" href="#">&times;</a>
            <div class="content">
                <div class="modal">
                    <form enctype='multipart/form-data' action="nguoidung/addAdmin.php" method="POST">
                        <label for="name">Tên người dùng:</label>
                        <input type="text" class="form-control" name="name" required>
                        <label for="email">Email:</label>
                        <input type="text" class="form-control" name="email" required>
                        <label for="password" >Mật khẩu:</label>
                        <input type="text" class="form-control" name="password" required>
                        <label for="phone">Số điện thoại:</label>
                        <input type="text" class="form-control" name="phone" required>
                        <label for="address">Địa chỉ:</label>
                        <input type="text" class="form-control" name="address" required>
                        <label for="type">Phân quyền:</label>
                        <select name="type">
                            <option>Chọn quyền</option>
                            <option value="Admin">Quản lý</option>
                            <option value="Staff">Nhân viên</option>       
                        </select>
                        <div class="box">
                            <input type="submit" value="Thêm" name="upload">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
}
?>
<?php include "./footer.php"; ?>