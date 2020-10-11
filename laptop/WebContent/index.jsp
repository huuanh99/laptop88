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
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<img style="width: 100%" alt="" src="img/categories/laptop1.png">
				</div>
			</div>

		</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h4>HỌC TẬP VĂN PHÒNG</h4>
					</div>
				</div>

			</div>
			<div class="row property__gallery">

				<c:forEach var="product" items="${listProduct1 }">
					<a href="info?id=${product.id }">
						<div class="col-lg-6 col-md-6  mix women">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="img/product/${product.image }"></div>
								<div class="product__item__text">
									<h6>
										<a href="#"> ${product.name } </a>
									</h6>

									<span class="badge badge-warning">
										<h2>${product.price }</h2>

									</span>
								</div>
							</div>
						</div>
					</a>

				</c:forEach>


			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h4>LAPTOP CŨ</h4>
					</div>
				</div>

			</div>
			<div class="row property__gallery">

				<c:forEach var="product" items="${listProduct4 }">
					<a href="info?id=${product.id }">

						<div class="col-lg-6 col-md-6 mix women">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="img/product/${product.image }"></div>
								<div class="product__item__text">
									<h6>
										<a href="#">${product.name }</a>
									</h6>

									<span class="badge badge-warning">
										<h2>${product.price }</h2>

									</span>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>


			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h4>ĐỒ HỌA KỸ THUẬT</h4>
					</div>
				</div>

			</div>
			<div class="row property__gallery">

				<c:forEach var="product" items="${listProduct2 }">
					<a href="info?id=${product.id }">

						<div class="col-lg-6 col-md-6 mix women">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="img/product/${product.image }"></div>
								<div class="product__item__text">
									<h6>
										<a href="#">${product.name }</a>
									</h6>

									<span class="badge badge-warning">
										<h2>${product.price }</h2>

									</span>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>


			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h4>LAPTOP GAMING</h4>
					</div>
				</div>

			</div>
			<div class="row property__gallery">

				<c:forEach var="product" items="${listProduct3 }">
					<a href="info?id=${product.id }">

						<div class="col-lg-6 col-md-6 mix women">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="img/product/${product.image }"></div>
								<div class="product__item__text">
									<h6>
										<a href="#">${product.name }</a>
									</h6>

									<span class="badge badge-warning">
										<h2>${product.price }</h2>

									</span>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>


			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h4>CAO CẤP SANG TRỌNG</h4>
					</div>
				</div>

			</div>
			<div class="row property__gallery">

				<c:forEach var="product" items="${listProduct5 }">
					<a href="info?id=${product.id }">

						<div class="col-lg-6 col-md-6 mix women">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="img/product/${product.image }"></div>
								<div class="product__item__text">
									<h6>
										<a href="#">${product.name }</a>
									</h6>

									<span class="badge badge-warning">
										<h2>${product.price }</h2>

									</span>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>


			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Banner Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 p-0">
					<img style="width: 100%" alt="" src="img/banner2.png">
				</div>
			</div>

		</div>

	</section>


	<!-- Banner Section End -->

	<!-- Trend Section Begin -->

	<!-- Trend Section End -->

	<!-- Discount Section Begin -->
	<section class="discount">
		<div class="container">
			<div class="row">
				<div class="col-12 p-0">
					<div class="discount__pic">
						<img src="img/banner1.jpg" alt="">
					</div>
				</div>
				<div class="col-12 p-0">
					<div class="discount__text">
						<div class="discount__text__title">
							<span>Discount</span>
							<h2>Winter 2020</h2>
							<h5>
								<span>Sale</span> 50%
							</h5>
						</div>
						<div class="discount__countdown" id="countdown-time">
							<div class="countdown__item">
								<span>22</span>
								<p>Days</p>
							</div>
							<div class="countdown__item">
								<span>18</span>
								<p>Hour</p>
							</div>
							<div class="countdown__item">
								<span>46</span>
								<p>Min</p>
							</div>
							<div class="countdown__item">
								<span>05</span>
								<p>Sec</p>
							</div>
						</div>
						<a href="#">Shop now</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Discount Section End -->

	<!-- Services Section Begin -->
	<section class="services spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-car"></i>
						<h6>Free Shipping</h6>
						<p>For all oder over $88</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-money"></i>
						<h6>Money Back Guarantee</h6>
						<p>If good have Problems</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-support"></i>
						<h6>Online Support 24/7</h6>
						<p>Dedicated support</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-headphones"></i>
						<h6>Payment Secure</h6>
						<p>100% secure payment</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Services Section End -->

	<!-- Instagram Begin -->
	<div class="instagram">

		<section class="categories">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 p-0">
						<img style="width: 100%" alt="" src="img/instagram/insta-3.png">
					</div>
				</div>

			</div>
	</div>
	</section>
	</div>
	<!-- Instagram End -->

	<jsp:include page="footer.jsp" />

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>