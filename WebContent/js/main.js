function check() {
	var password = document.getElementById("password").value;
	var phone = document.getElementById("phone").value;
	var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	var checkphone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
	if (!password.match(passw)) {
		event.preventDefault();
		alert("MẬT KHẨU PHẢI CÓ 6-20 KÍ TỰ, CHỨA 1 KÍ TỰ IN HOA, 1 KÍ TỰ THƯỜNG");
	}else if(!phone.match(checkphone)){
		event.preventDefault();
		alert("SỐ ĐIỆN THOẠI KHÔNG HỢP LỆ");
	}
}
