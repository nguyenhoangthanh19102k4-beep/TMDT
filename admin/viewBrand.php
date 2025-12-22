<?php include "./header.php"; ?>
<?php include "./sidebar.php"; ?>
<div>
  <table class="table ">
    <thead>
      <tr>
        <th class="text-center">STT</th>
        <th class="text-center">Tên thương hiệu</th>
        <th class="text-center" colspan="2">Hành động</th>
      </tr>
    </thead>
    <?php
    include_once "./config/dbconnect.php";
    $sql = "SELECT brand_id, brand_name from brands";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
    ?>
        <tr>
          <td><?= $count ?></td>
          <td><?= $row["brand_name"] ?></td>
          <!-- <td><button class="btn btn-primary" >Edit</button></td> -->
          <td><a class="btn-delete"
              href="phanloai/thuonghieu/deleteBrand.php?id=<?= $row['brand_id'] ?>"
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
      <h2>Thêm mới thương hiệu</h2><a class="close" href="#">&times;</a>
      <div class="content">
        <div class="modal">
          <form enctype='multipart/form-data' action="phanloai/thuonghieu/addBrand.php" method="POST">
            <label for="b_name">Tên thương hiệu:</label>
            <input type="text" class="form-control" name="b_name" required>
            <input type="submit" value="Thêm" name="upload">
          </form>
        </div>
      </div>
    </div>
  </div>


</div>
<?php include "./footer.php"; ?>