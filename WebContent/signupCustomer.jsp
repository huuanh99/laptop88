<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/style1.css">
<script type="text/javascript" src="js/main.js"></script>
</head>
<body>
	<div class="login">
		<h1 style="margin-left: 70px">KHÁCH HÀNG ĐĂNG KÍ</h1>
		<form method="post" action="signupCustomer" style="margin-right: 300px">
			<div style="color: red; text-align: center;">
				<h7>${message }</h7>
			</div>
			<input required="required" type="text" name="username"
				placeholder="USERNAME"> <input required="required"
				type="password" name="password" id="password" placeholder="PASSWORD"> <input
				required="required" type="text" name="fullname"
				placeholder="HỌ TÊN KHÁCH HÀNG"> <input required="required"
				type="text" name="address" placeholder="ĐỊA CHỈ"> <input
				required="required" type="text" name="phone" id="phone"
				placeholder="SỐ ĐIỆN THOẠI"> <input type="submit"
				value="ĐĂNG KÍ" id="submit" onclick="check()">
		</form>
	</div>
</body>
</html>