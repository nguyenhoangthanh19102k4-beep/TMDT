<?php 
    if(isset($_GET['search'])){
        $key = $_GET['key'];
    }

    $limit = 12;

    $page = isset($_GET['page_num']) ? (int)$_GET['page_num'] : 1;

    $offset = ($page - 1) * $limit;
    $where = "WHERE product_name LIKE '%$key%' AND status = 'Active'";

    // Đếm tổng sản phẩm sau khi lọc
    $count_sql = "SELECT COUNT(*) AS total FROM products $where";
    $count_result = mysqli_query($conn, $count_sql);
    $total_row = mysqli_fetch_assoc($count_result);
    $total_products = $total_row['total'];
    $total_pages = ceil($total_products / $limit);

    // Truy vấn sản phẩm có phân trang
    $sl = "SELECT product_id, product_name, disscounted_price, images 
        FROM products 
        $where
        LIMIT $offset, $limit";
    $result = mysqli_query($conn, $sl);
?>

<div class="dmsp" style="min-height: 400px;">
    <h1 style="text-align: center;">SẢN PHẨM BẠN MUỐN TÌM</h1>
    <?php if($total_products <= 0 || $key == ''){
        echo '<div style = "margin-top: 90px; text-align: center"> Không có sản phẩm nào tồn tại!!!! </div>';
    }
    else{ ?>
    
    <h3>Bạn muốn tìm: <?= $key ?></h3>
    <div class="timkiem">
        <?php
        while ($row = mysqli_fetch_assoc($result)):
        ?>

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
                    <p class="gia" style="margin-left: 10px; margin-top:0px;"><?php echo number_format($row['disscounted_price'], 0, ',', '.') . ' đ'; ?></p>
                </div>
            </a>
        <?php endwhile; ?>
    </div>

    <div class="pagination" style="text-align: center; margin-top: 20px;">
        <?php

        if ($page > 1) {
            $query_params['page_num'] = $page - 1;
            echo '<a href="?' . http_build_query($query_params) . '" class="arrow">‹</a>';
        }

        // Hiển thị tất cả các trang
        // Lấy các tham số lọc để gắn vào link phân trang
        $query_params = $_GET;
        unset($query_params['page_num']); // bỏ page_num cũ

        for ($i = 1; $i <= $total_pages; $i++) {
            $query_params['page_num'] = $i;
            $query_string = http_build_query($query_params);

            if ($i == $page) {
                echo '<span class="current">' . $i . '</span>';
            } else {
                echo '<a href="?' . $query_string . '">' . $i . '</a>';
            }
        }


        // Nút "›" tiến tới nếu không phải trang cuối
        if ($page < $total_pages) {
            $query_params['page_num'] = $page + 1;
            echo '<a href="?' . http_build_query($query_params) . '" class="arrow">›</a>';
        }
        ?>
    </div>
    <?php }?>
</div>