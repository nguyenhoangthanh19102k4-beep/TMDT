<?php include "./header.php"; ?>
<?php include "./sidebar.php"; ?>
<div>
  <table class="table ">
    <thead>
      <tr>
        <th class="text-center">STT</th>
        <th class="text-center">Tên loại kính</th>
        <th class="text-center" colspan="2">Hành động</th>
      </tr>
    </thead>
    <?php
    include_once "./config/dbconnect.php";
    $sql = "SELECT category_id, category_name from categories";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
    ?>
        <tr>
          <td><?= $count ?></td>
          <td><?= $row["category_name"] ?></td>
          <!-- <td><button class="btn btn-primary" >Edit</button></td> -->
          <td><a class="btn-delete"
              href="phanloai/loaisanpham/catDeleteController.php?id=<?= $row['category_id'] ?>"
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
			<h2>Thêm mới loại sản phẩm</h2><a class="close" href="#">&times;</a>
			<div class="content">
				<div class="modal">
					<form enctype='multipart/form-data' action="phanloai/loaisanpham/addCatController.php" method="POST">
						<label for="c_name">Tên loại sản phẩm:</label>
              <input type="text" class="form-control" name="c_name" required>
						<input type="submit" value="Thêm" name="upload">
					</form>
				</div>
			</div>
		</div>
	</div>


</div>
<?php include "./footer.php"; ?>