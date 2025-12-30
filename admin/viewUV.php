<?php include "./header.php"; ?>
<?php include "./sidebar.php"; ?>
<div>
  <h2>Loại UV</h2>
  <table class="table ">
    <thead>
      <tr>
        <th class="text-center">STT</th>
        <th class="text-center">Tên loại UV</th>
        <th class="text-center" colspan="2">Hành động</th>
      </tr>
    </thead>
    <?php
    include_once "./config/dbconnect.php";
    $sql = "SELECT uv_id, uv_name from UV";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
    ?>
        <tr>
          <td><?= $count ?></td>
          <td><?= $row["uv_name"] ?></td>
          <!-- <td><button class="btn btn-primary" >Edit</button></td> -->
          <td><a class="btn-delete"
              href="phanloai/uv/deleteUV.php?id=<?= $row['uv_id'] ?>"
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
      <h2>Thêm mới UV</h2><a class="close" href="#">&times;</a>
      <div class="content">
        <div class="modal">
          <form enctype='multipart/form-data' action="phanloai/uv/addUV.php" method="POST">
            <label for="uv_name">Tên UV:</label>
            <input type="text" class="form-control" name="uv_name" required>
            <input type="submit" value="Thêm" name="upload">
          </form>
        </div>
      </div>
    </div>
  </div>


</div>
<?php include "./footer.php"; ?>