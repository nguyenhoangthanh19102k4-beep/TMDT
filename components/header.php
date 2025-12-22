<script>
$(document).ready(function(){
    // Toggle form tìm kiếm khi click vào icon
    $("#toggle-search").click(function(){
        $(".search-form").slideToggle(200); // có hiệu ứng mượt
    });
});
</script>
<header>

        <div class="logo" style="width:130px; height:130px;">
            <a href="index.php?page=trangchu"><img src="imgs/Logo2.png" alt="Good Optic" style="width: 100%;"></a>
        </div>
    
        <nav>
            <ul class="menu">
                <li><a href="index.php?page=trangchu">Trang Chủ</a></li>
                <li><a href="index.php?page=gongkinh">Gọng Kính</a></li>
                <li><a href="index.php?page=kinhram">Kính Râm</a></li>
                <li><a href="index.php?page=trongkinh">Tròng Kính</a></li>
                <li><a href="index.php?page=gioithieu">Giới Thiệu</a></li>
                <li><a href="index.php?page=lienhe">Liên Hệ</a></li>
            </ul>
        </nav>

        <div class="sxc">
            <div class="icon-search">
                <button id="toggle-search" name="toggle-search"><img src="imgs/icon-header/cil--search.svg" alt="Tìm kiếm"></button>
                <div class="search-form" style="display: none;">
                <form method="get" style="top: 50px; right: 88px; position: absolute;">
                    <input type="hidden" name="page" value="timkiem">
                    <input type="text" name="key" id="key" placeholder="Nhập từ khóa tìm kiếm">
                    <button type="submit" name="search"><img src="imgs/icon-header/cil--search.svg" alt="Tìm kiếm"></button>
                </form>
                </div>
            </div>
            <div class="icon-cart">
                <a href="index.php?page=giohang"><img src="imgs/icon-header/solar--cart-4-bold.svg" alt="Giỏ hàng"></a>
            </div>
        </div>

</header>