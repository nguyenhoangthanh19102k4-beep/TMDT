function checkAddToCart(){
    if(document.addcart.add_to_cart.value=='ADD TO CART'){
        alert("Sản phẩm đã được thêm vào giỏ");
        return true;
    }
    return false;
}

function checkInfomation(){
    if(document.infor.thanhtoan.value == 'THANH TOÁN'){
        if(document.infor.hoten.value == ''){
            alert("Vui lòng nhập họ và tên.");
            document.infor.hoten.focus();
            return false;
        }

        if(document.infor.dt.value == ''){
            alert("Vui lòng nhập số điện thoại.");
            document.infor.dt.focus();
            return false;
        }

        if(document.infor.tinh.value == ''){
            alert("Vui lòng nhập tỉnh thành.");
            document.infor.tinh.focus();
            return false;
        }

        if(document.infor.huyen.value == ''){
            alert("Vui lòng nhập quận huyện.");
            document.infor.huyen.focus();
            return false;
        }

        if(document.infor.xa.value == ''){
            alert("Vui lòng nhập xã phường.");
            document.infor.xa.focus();
            return false;
        }

        if(document.infor.sonha.value == ''){
            alert("Vui lòng nhập số nhà.");
            document.infor.sonha.focus();
            return false;
        }
    }
    return true;
}