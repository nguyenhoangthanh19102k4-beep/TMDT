<?php include "header.php"; 
include "sidebar.php";
if ($_SESSION['user']['type'] != 'Admin'){
    echo "<h2 class='text-center'>Bạn không có quyền truy cập nội dung này</h2>";
} else {
?>

<div>
  <h2>Quản lý mã giảm giá</h2>
  <table class="table">
    <thead>
      <tr>
        <th class="text-center">STT</th>
        <th class="text-center">Mã giảm giá</th>
        <th class="text-center">Giảm (%)</th>
        <th class="text-center">Lượt dùng</th>
        <th class="text-center">Giảm tối đa</th>
        <th class="text-center">Ngày bắt đầu</th>
        <th class="text-center">Ngày hết hạn</th>
        <th class="text-center" colspan="2">Hành động</th>
      </tr>
    </thead>
    <tbody>
    <?php
    include_once "./config/dbconnect.php";
    // Truy vấn lấy dữ liệu từ bảng promotions
    $sql = "SELECT * FROM promotions ORDER BY created_at DESC";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
    ?>
        <tr>
          <td class="text-center"><?= $count ?></td>
          <td class="text-center"><?= $row["promotion_code"] ?></td>
          <td class="text-center"><?= $row["discount_percentage"] ?>%</td>
          <td class="text-center"><?= $row["times"] ?></td> 
          <td class="text-center"><?= number_format($row["max_discount_value"], 0, ',', '.') ?> đ</td>
          <td class="text-center"><?= date("d/m/Y", strtotime($row["start_date"])) ?></td>
          <td class="text-center"><?= date("d/m/Y", strtotime($row["expiry_date"])) ?></td>
          <td><a class="btn-edit" href="editPromotion.php?id=<?=$row['promotion_id']?>">Sửa</a></td>
          <td><a class="btn-delete" 
                    href="khuyenmai/deletePromotion.php?id=<?=$row['promotion_id']?>"
                    onclick="return confirm('Bạn chắc chắn muốn xóa mã này?');">Xóa</a></td>
        </tr>
    <?php
        $count++;
      }
    } else {
        echo "<tr><td colspan='9' class='text-center'>Chưa có mã giảm giá nào</td></tr>";
    }
    ?>
    </tbody>
  </table>

  <div class="box">
    <a class="button" href="#divOne">Thêm mã giảm giá</a>
  </div>

  <div class="overlay" id="divOne">
    <div id="myModalwrapper" class="modal-wrapper">
      <h2>Thêm mới mã khuyến mãi</h2>
      <a class="close" href="#">&times;</a>
      <div class="content">
        <div class="modal">
          <form enctype='multipart/form-data' action="khuyenmai/addPromotion.php" method="POST">
              <label>Mã code:</label>
              <input type="text" class="form-control" name="p_code" placeholder="Ví dụ: GIAM50" required>
              <label>Phần trăm giảm (%):</label>
              <input type="number" class="form-control" name="p_percent" min="0" max="100" required>
              <label>Số lần sử dụng:</label>
              <input type="number" class="form-control" name="p_time" min="100" required> 
              <label>Số tiền giảm tối đa (VNĐ):</label>
              <input type="number" class="form-control" name="p_max_val" min="0" required>
              <label>Ngày bắt đầu:</label>
              <input type="date" class="form-control" name="p_start" required> <label>Ngày hết hạn:</label>
              <input type="date" class="form-control" name="p_expiry" required>
              <div class="box">
                <input type="submit" value="Thêm mã" name="upload" class="btn-submit">
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
