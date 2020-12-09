<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

	<!-- Categories Section Begin -->

	<img style="width: 100%" alt="" src="img/categories/laptop1.png">

	<!-- Categories Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
	
		<div class="col-12">
			<h2>HỌC TẬP VĂN PHÒNG</h2>
			<c:forEach var="product" items="${listProduct1 }">
				<div class="col-6">
					<a href="info?id=${product.id }"> <img alt=""
						src="img/product/${product.image }">

						<h3>${product.name }</h3>

						<h2>${product.price }</h2>

					</a>
				</div>

			</c:forEach>


		</div>
		<div class="col-12">
				<h2>LAPTOP CŨ</h2>
			<c:forEach var="product" items="${listProduct4 }">
				<div class="col-6">

					<a href="info?id=${product.id }"> <img alt=""
						src="img/product/${product.image }">

						<h3>${product.name }</h3>

						<h2>${product.price }</h2>

					</a>
				</div>

			</c:forEach>


		</div>
		<div class="col-12">
			<h2>ĐỒ HỌA KỸ THUẬT</h2>
			


			<c:forEach var="product" items="${listProduct2 }">
				<div class="col-6">

					<a href="info?id=${product.id }"> <img alt=""
						src="img/product/${product.image }">

						<h3>${product.name }</h3>

						<h2>${product.price }</h2>

					</a>
				</div>
			</c:forEach>


		</div>
		<div class="col-12">
				<h2>LAPTOP GAMING</h2>


			<c:forEach var="product" items="${listProduct3 }">
				<a href="info?id=${product.id }">

					<div class="col-6">
						<img alt="" src="img/product/${product.image }">

						<h3>${product.name }</h3>

						<h2>${product.price }</h2>

					</div>
				</a>
			</c:forEach>


		</div>
		<div class="container">
			<div class="col-12">
				<h2>CAO CẤP SANG TRỌNG</h2>
				<c:forEach var="product" items="${listProduct5 }">
					<div class="col-6">

						<a href="info?id=${product.id }"> <img alt=""
							src="img/product/${product.image }">

							<h3>${product.name }</h3>
							<h2>${product.price }</h2>

						</a>
					</div>

				</c:forEach>

			</div>



		</div>
	</section>
	<!-- Product Section End -->
=




	
</body>

</html>