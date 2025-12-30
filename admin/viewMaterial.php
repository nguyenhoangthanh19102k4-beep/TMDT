<?php include "./header.php"; ?>
<?php include "./sidebar.php"; ?>
<div>
  <h2>Chất liệu</h2>
  <table class="table ">
    <thead>
      <tr>
        <th class="text-center">STT</th>
        <th class="text-center">Tên chất liệu</th>
        <th class="text-center" colspan="2">Hành động</th>
      </tr>
    </thead>
    <?php
    include_once "./config/dbconnect.php";
    $sql = "SELECT material_id, material_name from Material";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
    ?>
        <tr>
          <td><?= $count ?></td>
          <td><?= $row["material_name"] ?></td>
          <!-- <td><button class="btn btn-primary" >Edit</button></td> -->
          <td><a class="btn-delete"
              href="phanloai/chatlieu/deleteMaterial.php?id=<?= $row['material_id'] ?>"
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
      <h2>Thêm mới chất liệu</h2><a class="close" href="#">&times;</a>
      <div class="content">
        <div class="modal">
          <form enctype='multipart/form-data' action="phanloai/chatlieu/addMaterial.php" method="POST">
            <label for="m_name">Tên loại chất liệu:</label>
            <input type="text" class="form-control" name="m_name" required>
            <input type="submit" value="Thêm" name="upload">
          </form>
        </div>
      </div>
    </div>
  </div>


</div>
<?php include "./footer.php"; ?>