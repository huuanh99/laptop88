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
		<h1 style="margin-left: 100px">ADMIN ĐĂNG NHẬP</h1>
		<form method="post" action="login">
			<div style="color: red; text-align: center;">
				<h7>${message }</h7>
			</div>
			<input required="required" type="text" name="username"
				placeholder="UserName"> <input required="required"
				type="password" name="password" placeholder="Password"> <input
				type="submit" value="ĐĂNG NHẬP">
		</form>
	</div>
</body>
</html>