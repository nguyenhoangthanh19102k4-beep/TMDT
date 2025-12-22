<?php include "./header.php"; 
include "./sidebar.php";
if ($_SESSION['user']['type'] != 'Admin'){
    echo "<h2>Bạn không có quyền truy cập nội dung này</h2>";
} else {
?>
<div>
  <h2 class="text-center">Danh sách khách hàng</h2>
  <div class="table-responsive">
    <table class="custom-table">
      <thead>
        <tr>
          <th class="text-center">Mã khách hàng</th>
          <th class="text-center">Tên</th>
          <th class="text-center">Email</th>
          <th class="text-center">Số điện thoại</th>
          <th class="text-center">Địa chỉ</th>
        </tr>
      </thead>
      <?php
      include_once "./config/dbconnect.php";
      $sql = "SELECT customer_id, customer_name, email, phone, address from customers";
      $result = $conn->query($sql);
      $count = 1;
      if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {

      ?>
          <tr>
            <td><?= $row["customer_id"] ?></td>
            <td><?= $row["customer_name"] ?></td>
            <td><?= $row["email"] ?></td>
            <td><?= $row["phone"] ?></td>
            <td><?= $row["address"] ?></td>
          </tr>
      <?php
          $count = $count + 1;
        }
      }
      ?>
    </table>
  </div>
</div>
<?php
}
?>
<?php include "./footer.php"; ?>