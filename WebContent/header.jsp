<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style1.css" type="text/css">



</head>
<body>


	<!-- Header Section Begin -->
	<header>


		<div class="menu">
			<a href="home">Home</a> <a href="./shop-cart.jsp">Giỏ hàng</a>

			<form action="search" method="post">
				<input type="search" placeholder="Tìm kiếm" required="required"
					name="name">
				<button type="submit" class="btn btn-success"
					aria-label="Left Align">TÌM</button>
			</form>
			<a href="login">
				ADMIN
			</a>
			<a href="./loginCustomer.jsp">
				${fullname }
			</a>
		</div>


		</div>
	</header>
	<!-- Header Section End -->
	
</body>

</html>