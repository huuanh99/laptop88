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
							<span>Brand: ${product.brand }</span>
						</h3>
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i>
						</div>
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

							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
							</ul>
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
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab">Description</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab">Specification</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab">Reviews ( 2 )</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<h6>Description</h6>
								<p>${product.description }</p>

							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<h6>Specification</h6>
								<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur
									aut odit aut loret fugit, sed quia consequuntur magni dolores
									eos qui ratione voluptatem sequi nesciunt loret. Neque porro
									lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim
									ipsam voluptatem quia voluptas sit aspernatur aut odit aut
									loret fugit, sed quia ipsu consequuntur magni dolores eos qui
									ratione voluptatem sequi nesciunt. Nulla consequat massa quis
									enim.</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem.</p>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<h6>Reviews ( 2 )</h6>
								<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur
									aut odit aut loret fugit, sed quia consequuntur magni dolores
									eos qui ratione voluptatem sequi nesciunt loret. Neque porro
									lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim
									ipsam voluptatem quia voluptas sit aspernatur aut odit aut
									loret fugit, sed quia ipsu consequuntur magni dolores eos qui
									ratione voluptatem sequi nesciunt. Nulla consequat massa quis
									enim.</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5>RELATED PRODUCTS</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/related/rp-1.jpg">
							<div class="label new">New</div>
							<ul class="product__hover">
								<li><a href="img/product/related/rp-1.jpg"
									class="image-popup"><span class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_bag_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Buttons tweed blazer</a>
							</h6>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<div class="product__price">$ 59.0</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/related/rp-2.jpg">
							<ul class="product__hover">
								<li><a href="img/product/related/rp-2.jpg"
									class="image-popup"><span class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_bag_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Flowy striped skirt</a>
							</h6>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<div class="product__price">$ 49.0</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/related/rp-3.jpg">
							<div class="label stockout">out of stock</div>
							<ul class="product__hover">
								<li><a href="img/product/related/rp-3.jpg"
									class="image-popup"><span class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_bag_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Cotton T-Shirt</a>
							</h6>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<div class="product__price">$ 59.0</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/related/rp-4.jpg">
							<ul class="product__hover">
								<li><a href="img/product/related/rp-4.jpg"
									class="image-popup"><span class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_bag_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Slim striped pocket shirt</a>
							</h6>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<div class="product__price">$ 59.0</div>
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