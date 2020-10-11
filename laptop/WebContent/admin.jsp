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
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="img/iconAdmin/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/admin/css/util.css">
<link rel="stylesheet" type="text/css" href="css/admin/css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<a href="home">
						<button class="btn btn-success">BACK</button>
					</a> <a href="admin?add=true">
						<button class="btn btn-danger">ADD</button>
					</a>
					<h3 style="color: white;text-align: center;margin-bottom: 20px">${message }</h3>
					<table>
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
									<td class="column6"><a
										href="admin?update=true&id=${product.id }">
											<button class="btn btn-success">UPDATE</button>

									</a></td>
									<td class="column6"><a
										href="admin?delete=true&id=${product.id }">
											<button onclick="myFunction()" class="btn btn-danger delete">DELETE</button>

									</a></td>

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>




	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script>
		$(document).ready(function(){
			$(".delete").click(function(e){
				var r = confirm("Bạn có chắc chắn muốn xóa sản phẩm này không\nBạn sẽ không thể hoàn tác lại hành động này");
				if (r == false) {
				  e.preventDefault();
				} 
			})
		})
	</script>
</body>
</html>