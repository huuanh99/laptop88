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

<!-- Css Styles -->

<link rel="stylesheet" href="css/style1.css" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Shop Cart Section Begin -->
	<div class="container">
		<div class="shop__cart__table">
			<table id="customers">
				<thead>
					<tr>
						<th>Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Update</th>
						<th>Delete</th>

					</tr>
				</thead>
				<tbody>

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
									<input type="number" name="number" min="1"
										max="<%out.print(listItem.get(i).getProduct().getQuantity());%>"
										value="<%out.print(listItem.get(i).getQuantity());%>">
									<input type="hidden" name="id" value="<%out.print(i);%>">
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

						<td><a href="cart?id=<%out.print(i);%>&delete=true">
								<button class="btn btn-danger">DELETE</button>
						</a></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-6">
		<h2>
			<a href="home">Continue Shopping</a>

		</h2>
		<h2>
			<a href="checkout" class="primary-btn">Proceed to checkout</a>
		</h2>
	</div>
	<div class="col-6">
		<h2>
			Cart total : <%
			out.print(numberFormat.format(total));
		%>
		</h2>
	</div>


</body>

</html>