<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="icon" type="image/png" href="../imgs/Logo1.png">
    <title>Trang đăng nhập của quản trị viên</title>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="login.php" class="sign-in-form" method="post">
            <h2 class="title">Đăng nhập</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Nhập Email" name="email"/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Mật khẩu" name="password"/>
            </div>
            <?php 
            if(isset($errorMsg)&&($errorMsg!="")){
              echo "<font color='red'>".$errorMsg."</font>";
            }
            ?>
            <input type="submit" name="dangnhap" value="Đăng nhập" class="btn solid" />
        </div>
      </div>
    </div>

    <script src="app.js"></script>
  </body>
</html>