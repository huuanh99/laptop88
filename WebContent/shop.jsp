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


<!-- Css Styles -->

<link rel="stylesheet" href="css/style1.css" type="text/css">
</head>

<body>
	<jsp:include page="header.jsp" />
	<!-- Shop Section Begin -->
	<div class="container">

		<div class="col-12">
			<c:forEach var="product" items="${products }">
				<a href="info?id=${product.id }"> <img alt=""
					src="img/product/${product.image }">
					<h2>${product.name }</h2>
					<h2>${product.price }</h2>
				</a>
			</c:forEach>
		</div>
	</div>

</body>

</html>