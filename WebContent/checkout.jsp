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

<!-- Css Styles -->

<link rel="stylesheet" href="css/style1.css" type="text/css">
</head>

<body>
	<jsp:include page="header.jsp" />



	<!-- Checkout Section Begin -->
	<div class="col-6">
		<h3 style="text-align: center; color: red; margin-bottom: 20px">${message }</h3>
		<h2 style="text-align: center">Customer Information</h2>

		<form action="checkout" method="post">
			<div class="col-12">

				<input type="text" name="name" required="required"
					placeholder="Name" value="${fullname }">
			</div>

			<div class="col-12">


				<input type="text" placeholder="Street Address" name="address"
					required="required" value="${address }">
			</div>
			<div class="col-12">

				<input type="text" name="phone" required="required"
					placeholder="Phone" value="${phone }">
			</div>
	</div>
	<div class="checkout">
		<h2>Your order</h2>
		<h2>Sản phẩm</h2>

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
		<div class="col-12">
			<%
				out.print(listItem.get(i).getProduct().getName());
			%>
			<%
				int price = listItem.get(i).getProduct().getMoney() * listItem.get(i).getQuantity();
			total += price;
			out.print(numberFormat.format(price));
			%>
		</div>

		<br>
		<%
			}
		}
		%>
		<h2>
			Total
			<%
			out.print(numberFormat.format(total));
		%>
		</h2>

		<br>

		<button type="submit" class="success">Place oder</button>
		<input type="hidden" name="total" value="<%out.print(total);%>">
	</div>

	</form>

	<!-- Checkout Section End -->

</body>

</html>