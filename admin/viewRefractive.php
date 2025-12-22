<?php include "./header.php"; ?>
<?php include "./sidebar.php"; ?>
<div>
  <table class="table ">
    <thead>
      <tr>
        <th class="text-center">STT</th>
        <th class="text-center">Bệnh khúc xạ</th>
        <th class="text-center" colspan="2">Hành động</th>
      </tr>
    </thead>
    <?php
    include_once "./config/dbconnect.php";
    $sql = "SELECT refractive_id, refractive_name from Refractive";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
    ?>
        <tr>
          <td><?= $count ?></td>
          <td><?= $row["refractive_name"] ?></td>
          <!-- <td><button class="btn btn-primary" >Edit</button></td> -->
          <td><a class="btn-delete"
              href="phanloai/khucxa/deleteRefractive.php?id=<?= $row['refractive_id'] ?>"
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
			<h2>Thêm mới loại khúc xạ</h2><a class="close" href="#">&times;</a>
			<div class="content">
				<div class="modal">
					<form enctype='multipart/form-data' action="phanloai/khucxa/addRefractive.php" method="POST">
						<label for="r_name">Tên khúc xạ:</label>
              <input type="text" class="form-control" name="r_name" required>
						<input type="submit" value="Thêm" name="upload">
					</form>
				</div>
			</div>
		</div>
	</div>


</div>
<?php include "./footer.php"; ?>