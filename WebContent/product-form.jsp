<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>ADMIN</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato"></nav>
	</header>
	<br>

	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">


				<caption>
					<h2 style="text-align: center">
						<c:if test="${add!=null }">
							ADD PRODUCT
						</c:if>
						<c:if test="${add==null }">
							EDIT PRODUCT
						</c:if>
					</h2>
				</caption>
				<form method="post" action="admin">
					<c:if test="${add==null }">
						<input type="hidden" name="id" value="${product.id }">

					</c:if>

					<fieldset class="form-group">
						<label>Tên sản phẩm</label> <input type="text"
							value="${product.name}" class="form-control" name="name"
							required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Ảnh sản phẩm</label> <input type="file"
							accept="image/png, image/jpeg" class="form-control"
							style="height: 70px" name="image" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Thương hiệu</label> <select class="form-control"
							name="brand">
							<c:forEach var="brand" items="${brands }">
								<c:if test="${product.brand==brand.brand }">
									<option selected="selected" value="${brand.brand }">${brand.brand }</option>

								</c:if>
								<c:if test="${product.brand!=brand.brand }">
									<option value="${brand.brand }">${brand.brand }</option>

								</c:if>

							</c:forEach>

						</select>
					</fieldset>
					<fieldset class="form-group">
						<label>Thể loại</label> <select class="form-control" name="type">
							<c:forEach var="type" items="${types }">
								<c:if test="${product.type==type.type }">
									<option selected="selected" value="${type.type }">${type.type }</option>

								</c:if>
								<c:if test="${product.type!=type.type }">
									<option value="${type.type }">${type.type }</option>

								</c:if>

							</c:forEach>

						</select>
					</fieldset>

					<fieldset class="form-group">
						<label>Mô tả</label>
						<textarea style="height: 150px;" class="form-control"
							name="description">
                             	${product.description}
                             </textarea>
					</fieldset>

					<fieldset class="form-group">
						<label>Số lượng</label> <input type="number"
							value="${product.quantity}" class="form-control" name="quantity">
					</fieldset>

					<fieldset class="form-group">
						<label>Giá tiền</label> <input type="number"
							value="${product.money}" class="form-control" name="price">
					</fieldset>

					<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
