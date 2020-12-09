<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/style1.css">

</head>
<body>
	<div class="login">
		<h1 style="margin-left: 70px">KHÁCH HÀNG ĐĂNG NHẬP</h1>
		<form method="post" action="loginCustomer">
			<div style="color: red; text-align: center;">
				<h7>${message }</h7>
			</div>
			<input required="required" type="text" name="username"
				placeholder="USERNAME"> <input required="required"
				type="password" name="password" placeholder="PASSWORD"> <input
				type="submit" value="ĐĂNG NHẬP">
		</form>
	</div>
	<div class="line">
		<a href="./signupCustomer.jsp">
			<button class="signup">CHƯA CÓ TÀI KHOẢN? ĐĂNG KÍ</button>
		</a>
	</div>

</body>
</html>