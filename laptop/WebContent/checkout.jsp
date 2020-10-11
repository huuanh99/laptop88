<%@page import="laptop.model.order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="laptop.management.dao.LaptopDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="laptop.model.item"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Ashion | Template</title>

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
	<jsp:include page="header.jsp" />



	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<h3 style="text-align: center;color: red;margin-bottom: 20px">${message }</h3>
			<form action="checkout" class="checkout__form" method="post">
				<div class="row">
					<div class="col-lg-8">
						<h5>Customer Information</h5>
						<div class="row">
							<div class="col-lg-12">
								<div class="checkout__form__input">
									<p>
										Name <span>*</span>
									</p>
									<input type="text" name="name" required="required">
								</div>
							</div>

							<div class="col-lg-12">

								<div class="checkout__form__input">
									<p>
										Address <span>*</span>
									</p>
									<input type="text" placeholder="Street Address" name="address" required="required">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="checkout__form__input">
									<p>
										Phone <span>*</span>
									</p>
									<input type="text" name="phone" required="required">
								</div>
							</div>


						</div>
					</div>
					<div class="col-lg-4">
						<div class="checkout__order">
							<h5>Your order</h5>
							<div class="checkout__order__product">
								<ul>
									<li><span class="top__text">Product</span> <span
										class="top__text__right">Total</span></li>

									<%
										order order = (order) session.getAttribute("order");
									List<item> listItem = new ArrayList();
									if (order != null) {
										listItem = order.getListItem();
									}
									int total = 0;
									int i;
									Locale locale = new Locale("vi", "VN");
									NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
									if (listItem.size() > 0) {
										for (i = 0; i < listItem.size(); i++) {
									%>

									<li>
										<%
											out.print(listItem.get(i).getProduct().getName());
										%> <span> <%
 	int price = listItem.get(i).getProduct().getMoney() * listItem.get(i).getQuantity();
 total += price;
 out.print(numberFormat.format(price));
 %>
									</span>
									</li>
									<%
										}
									}
									%>
								</ul>
							</div>
							<div class="checkout__order__total">
								<ul>
									<li>Total <span> <%
 	out.print(numberFormat.format(total));
 %>
									</span></li>
								</ul>
							</div>

							<button type="submit" class="site-btn">Place oder</button>
						</div>
					</div>
				</div>
				<input type="hidden" name="total" value="<%out.print(total);%>">
			</form>
		</div>
	</section>
	<!-- Checkout Section End -->


	<jsp:include page="footer.jsp"></jsp:include>


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