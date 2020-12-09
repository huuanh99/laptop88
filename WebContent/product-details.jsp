<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>LAPTOP 88</title>

<!-- Google Font -->

<!-- Css Styles -->
<link rel="stylesheet" href="css/style1.css" type="text/css">
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Product Details Section Begin -->
	<div class="col-12">
		<div class="col-6">
			<img src="img/product/${product.image }" alt="">

		</div>

		<div class="col-6">
			<h3>${product.name }
				<h5>Brand: ${product.brand }</h5>
			</h3>

			<h2>${product.price }</h2>
			<p>${product.description }</p>

			<p>Quantity: ${product.quantity } chiếc</p>
			<form style="margin-left: 35%" action="cart" method="post">
				<div class="pro-qty">
					<input type="number" name="quantity" value="1">
				</div>
				<input type="hidden" name="id" value="${product.id }">
				<button type="submit" class="cart-btn">ADD TO CART</button>
			</form>
		</div>
	</div>

</body>

</html>