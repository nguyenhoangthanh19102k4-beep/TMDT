<?php
    $sql_gongkinh = "SELECT product_id, product_name, disscounted_price, images FROM products WHERE status = 'Active' AND category_id = 3 LIMIT 4";
    $result_gongkinh = mysqli_query($conn, $sql_gongkinh);

    $sql_kinhram = "SELECT product_id, product_name, disscounted_price, images FROM products WHERE status = 'Active' AND category_id = 1 LIMIT 4";
    $result_kinhram = mysqli_query($conn, $sql_kinhram);

    $sql_trongkinh = "SELECT product_id, product_name, disscounted_price, images FROM products WHERE status = 'Active' AND category_id = 2 LIMIT 4";
    $result_trongkinh = mysqli_query($conn, $sql_trongkinh);
?>


<script>
$(document).ready(function(){
    const slideCount = $(".slider-wrapper img").length;
    let currentIndex = 0;

    setInterval(function() {
        currentIndex = (currentIndex + 1) % slideCount;
        const translateX = -currentIndex * 100;
        $(".slider-wrapper").css("transform", `translateX(${translateX}%)`);
    }, 3000);

    $(".tab_button").click(function(){
        let index = $(this).data("index");

        // Bỏ active và đổi màu
        $(".tab_button").removeClass("active").css({"background-color": "white", "color": "black"});
        $(this).addClass("active").css({"background-color": "black", "color": "white"});

        // Ẩn tất cả danh sách tab, sau đó chỉ hiện tab tương ứng
        $(".tab_ds").removeClass("active").hide();
        $(".tab_ds").eq(index).addClass("active").show();
    });

    // Hover effect
    $(".tab_button").hover(
        function() {
            if (!$(this).hasClass("active")) {
                $(this).css({"background-color": "black", "color": "white"});
            }
        },
        function() {
            if (!$(this).hasClass("active")) {
                $(this).css({"background-color": "white", "color": "black"});
            }
        }
    );

    // Mặc định: chỉ hiện tab đầu
    $(".tab_ds").hide();           // Ẩn tất cả
    $(".tab_ds").eq(0).show();     // Chỉ hiện tab đầu tiên
});
</script>


<div class="trangchu" style="margin: 0 auto; max-width: 1250px;">
    <div class="banner">
        <div class="slider-wrapper">
            <img src="imgs/trangchu/1.png" alt="Good Optic">
            <img src="imgs/trangchu/2.png" alt="Good Optic">
            <img src="imgs/trangchu/3.png" alt="Good Optic">
        </div>
    </div>

    <div class="dichvu"> 
        <div>
            <img src="imgs/trangchu/mdi--support 2.svg" alt="" class="">
            <p> <b>Vệ Sinh Kính Miễn Phí</b> <br>
            tại toàn bộ hệ thống mắt kính Good Optic
            </p>
        </div>
        <div>
            <img src="imgs/trangchu/carbon--delivery 1.svg" alt="" class="">
            <p> <b >Giao Hàng Nhanh</b><br>
            chỉ từ 2 ngày trên toàn quốc
            </p>
        </div>
        <div>
            <img src="imgs/trangchu/carbon--ibm-data-product-exchange 1.svg" alt="" class="">
            <p> <b>Thu Cũ Đổi Mới </b><br>
            trợ giá lên đến 200.000đ
            </p>
        </div>
        <div>
            <img src="imgs/trangchu/image 1.svg" alt="" class="">
            <p> <b>Hỗ Trợ Đo Mắt</b> <br>
            tại toàn bộ hệ thống mắt kính Good Optic
            </p>
        </div>
    </div>

    <h2 style="margin-top: 90px; text-align:center">NHÌN RÕ HÔM NAY, TỰ TIN NGÀY MAI</h2>
    <div class="bphu">
        <div class="imgsp">
            <img src="imgs/trangchu/newbanner2.jpg" alt="">
            <div class="overclay">MỚI NHẤT </div>
        </div>
        <div  class="imgsp">
            <img src="imgs/trangchu/salebanner.jpg" alt="">
            <div class="overclay">GIÁ HỜI NHẤT</div>
        </div>
    </div>

    <h2 style="margin-top: 90px; text-align:center">SẢN PHẨM BÁN CHẠY</h2>
    <div class="banchay">
 
        <div class="chon_spbc">
            <button class="tab_button active" data-index="0">Gọng Kính</button>
            <button class="tab_button" data-index="1">Kính Râm</button>
            <button class="tab_button" data-index="2">Tròng Kính</button>
        </div>
        <div class="chon_dsbc">
            <div class="tab_ds active" style="text-align: center;">
                <div class="dsbc">
                    <?php if ($result_gongkinh && mysqli_num_rows($result_gongkinh) > 0): ?>
                    <?php while ($row = mysqli_fetch_assoc($result_gongkinh)): ?>
                    <a href="index.php?page=chitiet&id=<?php echo $row['product_id']; ?>" class="sp">
                        <div class="ndsp">
                        <div class="anhsp">
                            <?php
                                $firstImage = $row['images'];

                                if (preg_match('#^https?://#i', $firstImage)) {
                                    // Là URL tuyệt đối
                                    $imgSrc = $firstImage;
                                } else {
                                    // Là tên file ảnh được upload, kiểm tra file tồn tại
                                    $localPath = 'imgs/products/' . $firstImage;
                                    if (file_exists($localPath)) {
                                        $imgSrc = $localPath;
                                    } else {
                                        $imgSrc = 'imgs/products/default.jpg'; // fallback ảnh mặc định nếu file không tồn tại
                                    }
                                }
                            ?>
                            <img src="<?php echo $imgSrc; ?>" alt="Ảnh sản phẩm" loading="lazy">
                        </div>
                        <p class="tensp"><?php echo htmlspecialchars($row['product_name']); ?></p>
                        <p class="gia" style="margin-top: 0px; margin-left: 10px;"><?php echo number_format($row['disscounted_price'], 0, ',', '.'); ?> đ</p>
                        </div>
                    </a>
                    <?php endwhile; ?>
                    <?php else: ?>
                    <p>Không có sản phẩm gợi ý.</p>
                    <?php endif; ?>
                </div>
                <a href="index.php?page=gongkinh">
                <input type="submit" name="xthem" value="Xem thêm"></input>
                </a>
            </div>
            <div class="tab_ds" style="text-align: center;">
                <div class="dsbc">
                    <?php if ($result_kinhram && mysqli_num_rows($result_kinhram) > 0): ?>
                    <?php while ($row = mysqli_fetch_assoc($result_kinhram)): ?>
                    <a href="index.php?page=chitiet&id=<?php echo $row['product_id']; ?>" class="sp">
                        <div class="ndsp">
                        <div class="anhsp">
                            <?php
                                $firstImage = $row['images'];

                                if (preg_match('#^https?://#i', $firstImage)) {
                                    // Là URL tuyệt đối
                                    $imgSrc = $firstImage;
                                } else {
                                    // Là tên file ảnh được upload, kiểm tra file tồn tại
                                    $localPath = 'imgs/products/' . $firstImage;
                                    if (file_exists($localPath)) {
                                        $imgSrc = $localPath;
                                    } else {
                                        $imgSrc = 'imgs/products/default.jpg'; // fallback ảnh mặc định nếu file không tồn tại
                                    }
                                }
                            ?>
                            <img src="<?php echo $imgSrc; ?>" alt="Ảnh sản phẩm" loading="lazy">
                        </div>
                        <p class="tensp"><?php echo htmlspecialchars($row['product_name']); ?></p>
                        <p class="gia" style="margin-top: 0px; margin-left: 10px;"><?php echo number_format($row['disscounted_price'], 0, ',', '.'); ?> đ</p>
                        </div>
                    </a>
                    <?php endwhile; ?>
                    <?php else: ?>
                    <p>Không có sản phẩm gợi ý.</p>
                    <?php endif; ?>
                </div>
                <a href="index.php?page=kinhram">
                <input type="submit" name="xthem" value="Xem thêm"></input>
                </a>
            </div>
            <div class="tab_ds" style="text-align: center;">
                <div class="dsbc">
                    <?php if ($result_trongkinh && mysqli_num_rows($result_trongkinh) > 0): ?>
                    <?php while ($row = mysqli_fetch_assoc($result_trongkinh)): ?>
                    <a href="index.php?page=chitiet&id=<?php echo $row['product_id']; ?>" class="sp">
                        <div class="ndsp">
                        <div class="anhsp">
                            <?php
                                $firstImage = $row['images'];

                                if (preg_match('#^https?://#i', $firstImage)) {
                                    // Là URL tuyệt đối
                                    $imgSrc = $firstImage;
                                } else {
                                    // Là tên file ảnh được upload, kiểm tra file tồn tại
                                    $localPath = 'imgs/products/' . $firstImage;
                                    if (file_exists($localPath)) {
                                        $imgSrc = $localPath;
                                    } else {
                                        $imgSrc = 'imgs/products/default.jpg'; // fallback ảnh mặc định nếu file không tồn tại
                                    }
                                }
                            ?>
                            <img src="<?php echo $imgSrc; ?>" alt="Ảnh sản phẩm" loading="lazy">
                        </div>
                        <p class="tensp"><?php echo htmlspecialchars($row['product_name']); ?></p>
                        <p class="gia" style="margin-top: 0px; margin-left: 10px;"><?php echo number_format($row['disscounted_price'], 0, ',', '.'); ?> đ</p>
                        </div>
                    </a>
                    <?php endwhile; ?>
                    <?php else: ?>
                    <p>Không có sản phẩm gợi ý.</p>
                    <?php endif; ?>
                </div>
                <a href="index.php?page=trongkinh">
                <input type="submit" name="xthem" value="Xem thêm"></input>
                </a>
            </div>
        </div>        
    </div>

    <div class="store" style="margin: 0 auto; font-size: 22px; background-color:rgba(235, 228, 175, 0.35); display:flex; max-width:1250px; gap:100px; padding:0px 65px; margin-bottom: 50px;">
        <div style="height: 500px;display: flex; justify-content: center;"><img src="imgs/store.jpg" style="width:100%; height:100%;" alt="GoodOptic"></div>
        <div  style="display: flex; align-items: center; flex-direction: column;">
            <h3 style="margin-top: 80px;">HỆ THỐNG MẮT KÍNH GOOD OPTIC</h3>
            <p style="width: 680px; line-height: 1.5;">
                Hệ thống Mắt Kính Good Optic với 30+ chi nhánh trên toàn quốc, tập trung hầu hết ở các tỉnh thành lớn như: TP. Hồ Chí Minh, TP. Hà Nội, TP. Đà Nẵng, TP. Cần Thơ, TP. Hải Phòng và nhiều tỉnh thành khác.
                <br><br><br>
                <i>“Good Optic - Nhìn rõ hôm nay, tự tin ngày mai”</i>
            </p>
        </div>
    </div>
</div>


