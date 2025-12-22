<?php include "./header.php"; ?>
<?php include "./sidebar.php"; ?>
<div id="ordersBtn" >
  <h2>Đơn hàng</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>STT</th>
        <th>Mã đơn hàng</th>
        <th>Ngày đặt</th>
        <th>Ngày cập nhật</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
     </tr>
    </thead>
     <?php
      include_once "./config/dbconnect.php";
      $sql="SELECT order_id, created_at, status, updated_at from orders order by created_at";
      $result=$conn-> query($sql);
      $count = 1;
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
    ?>
       <tr>
          <td><?=$count?></td>
          <td><?=$row["order_id"]?></td>
          <td><?=$row["created_at"]?></td>
          <td><?=$row["updated_at"]?></td>
          <td><?=$row["status"]?></td>
          <td>
            <a class="btn-edit" href="viewEachOrders.php?id=<?=$row['order_id']?>">Xem</a>
          </td>
        </tr>
    <?php
            $count = $count + 1;
        }
      }
    ?>
     
  </table>
   

 <?php include "./footer.php"; ?>