<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="laptop.management.dao.LaptopDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="laptop.model.item"%>
<%@page import="java.util.List"%>
<%@page import="laptop.model.order"%>
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
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Shop Cart</title>

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
	<jsp:include page="header.jsp"></jsp:include>



	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shop__cart__table">
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>

								<%
								order order = (order) session.getAttribute("order");
								List<item> listItem=new ArrayList();
								if(order!=null){
									listItem = order.getListItem();
								}
								int total = 0;
								int i;
								Locale locale = new Locale("vi", "VN");
								NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
								if(listItem.size()>0){
								for (i = 0; i < listItem.size(); i++) {
								%>
								<tr>
									<td class="cart__product__item"><img
										style="width: 100px; height: 100px"
										src="img/product/<%out.print(listItem.get(i).getProduct().getImage());%>"
										alt="product"> <%
 	out.print(listItem.get(i).getProduct().getName());
 %></td>

									<td class="cart__price">
										<%
											out.print(listItem.get(i).getProduct().getPrice());
										%>
									</td>
									<form method="post" action="update">
										<td class="cart__quantity">
										<div class="pro-qty">
											<input type="number" name="number" min="1" max="<%out.print(listItem.get(i).getProduct().getQuantity()); %>"
												value="<%out.print(listItem.get(i).getQuantity());%>">
											<input type="hidden" name="id" value="<%out.print(i); %>">
										</div>
									</td>
									<td class="cart__total">
										<%
											int price = listItem.get(i).getProduct().getMoney() * listItem.get(i).getQuantity();
										total += price;
										out.print(numberFormat.format(price));
										%>
									</td>
									<td>
										<button type="submit" class="btn btn-success">UPDATE</button>
									</td>
									</form>
									
									<td>
										<a href="cart?id=<%out.print(i); %>&delete=true">
											<button class="btn btn-danger">DELETE</button>
										</a>
									</td>
								</tr>
								<%
									}}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="cart__btn">
						<a href="home">Continue Shopping</a>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="discount__content">
						<h6>Discount codes</h6>
						<form action="#">
							<input type="text" placeholder="Enter your coupon code">
							<button type="submit" class="site-btn">Apply</button>
						</form>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-2">
					<div class="cart__total__procced">
						<h6>Cart total</h6>
						<ul>
							<li>Total <span> <%
 	out.print(numberFormat.format(total));
 %>
							</span></li>
						</ul>
						<a href="checkout" class="primary-btn">Proceed to checkout</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Cart Section End -->



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