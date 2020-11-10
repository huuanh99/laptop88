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
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<jsp:include page="header.jsp"/>
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="product__details__pic">

						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<img data-hash="product-1" class="product__big__img"
									src="img/product/${product.image }" alt="">

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h3>${product.name }
							<h5>Brand: ${product.brand }</h5>
						</h3>
						
						<span class="badge badge-warning">
							<h2>${product.price }</h2>

						</span>
						<p>${product.description }</p>
						<div class="product__details__button">
							<div class="quantity">
								<span>Quantity: ${product.quantity } chiếc</span>

							</div>
							<form action="cart" method="post">
								<div class="pro-qty">
									<input type="number" name="quantity" value="1">
								</div>
								<input type="hidden" name="id" value="${product.id }">												
								<button type="submit" class="cart-btn">ADD TO CART</button>

							</form>

							
						</div>
						<div class="product__details__widget">
							<ul>
								<li><span>Availability:</span>
									<div class="stock__checkbox">
										<label for="stockin"> In Stock <input type="checkbox"
											id="stockin"> <span class="checkmark"></span>
										</label>
									</div></li>


								<li><span>Promotions:</span>
									<p>Free shipping</p></li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Instagram Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 p-0">
					<img style="width: 100%" alt="" src="img/instagram/insta-4.jpg">
				</div>
			</div>

		</div>

	</section>
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 p-0">
					<img style="width: 100%" alt="" src="img/instagram/insta-5.jpg">
				</div>
			</div>

		</div>

	</section>

	<!-- Instagram End -->

	<jsp:include page="footer.jsp"/>
	

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