<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>ADMIN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/style1.css" type="text/css">
	
</head>

<body>
		<div class="container">
					<a href="home">
						<button class="success">BACK</button>
					</a> <a href="admin?add=true">
						<button class="danger">ADD</button>
					</a>
					<a href="admin?logout=true">
						<button class="warning">LOG OUT</button>
					</a>
					<h3 style="color: white;text-align: center;margin-bottom: 20px">${message }</h3>
					<table id="customers">
						<thead>
							<tr class="table100-head">
								<th class="column1">STT</th>
								<th class="column2">Tên sản phẩm</th>
								<th class="column3">Số lượng</th>
								<th class="column4">Gía tiền</th>
								<th class="column5">Thương hiệu</th>
								<th class="column6">Update</th>
								<th class="column6">Delete</th>

							</tr>
						</thead>
						<tbody>
							<%
								int count = 1;
							%>
							<c:forEach var="product" items="${listProduct }">
								<tr>
									<td class="column1">
										<%
											out.print(count++);
										%>
									</td>
									<td class="column2">${product.name }</td>
									<td class="column3">${product.quantity }</td>
									<td class="column4">${product.price }</td>
									<td class="column5">${product.brand }</td>
									<td class="column6"><a href="admin?update=true&id=${product.id }">
											<button class="success">UPDATE</button>

										</a></td>
									<td class="column6"><a href="admin?delete=true&id=${product.id }">
											<button id="delete" class="danger">DELETE</button>

										</a></td>

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
</body>

</html>