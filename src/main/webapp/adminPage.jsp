<%@page import="com.dao.ProductDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	session.setAttribute("message", "This is an Admin page. Your have to login first");
	session.setAttribute("messageColor", "warning");
	response.sendRedirect("login.jsp");
	return;
} else if (!user.getUserType().equals("admin")) {
	response.sendRedirect("index.jsp");
	return;
}

int usersNo = new UserDao().getUsersNo();
int productNo = new ProductDao().getProductsNo();
int categoriesNo = new CategoryDao().getcategoiesNo();
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin: Home</title>
<!-- Importing CSS file -->
<%@include file="css/commonCss.jsp"%>

<style>
img {
	max-width: 5rem;
	max-height: 5rem;
}
</style>
</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container mt-3 admin">
	<%@ include file="components/message.jsp"%>
	
		<!-- First row -->
		<div class="row">
			<!-- First box Users-->
			<div class="col-md-4">
				<div class="card">
					<div class="container text-center">
						<img class="img-fluid mt-2 " src="img/users.png"
							alt="user's Image">
					</div>
					<div class="card-body text-center">
						<h3><%=usersNo%></h3>
						<h4 class="text-muted">Total Users</h4>
						<a href="#" class=" btn btn-primary">More</a>
					</div>
				</div>
			</div>
			<!-- Second box Categories -->
			<div class="col-md-4">
				<div class="card">
					<div class="container text-center">
						<img class="img-fluid mt-2 " src="img/Categories.png"
							alt="user's Image">
					</div>
					<div class="card-body text-center">
						<h3><%=categoriesNo %></h3>
						<h4 class="text-muted">No. of Categories</h4>
						<a href="#" class=" btn btn-primary">Show</a>
					</div>
				</div>
			</div>
			<!-- Third Box products -->
			<div class="col-md-4">
				<div class="card">
					<div class="container text-center">
						<img class="img-fluid mt-2 " src="img/products.png"
							alt="user's Image">
					</div>
					<div class="card-body text-center">
						<h3><%=productNo %></h3>
						<h4 class="text-muted">Total Products</h4>
						<a href="#" class=" btn btn-primary">Show</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Second row -->
		<div class="row mt-2 ">
			<!-- first column add categories -->
			<div class="col-md-4 offset-2" data-bs-toggle="modal"
				data-bs-target="#addCategory">
				<div class="card">
					<div class="container text-center">
						<img class="img-fluid mt-2 " src="img/addCategories.png"
							alt="user's Image">
					</div>
					<div class="card-body text-center">
						<h4 class="text-muted">Add Categories</h4>
						<!-- <a href="#" class=" btn btn-primary">Add</a> -->
					</div>
				</div>
			</div>
			<!-- Second column add products -->
			<div class="col-md-4" data-bs-toggle="modal"
				data-bs-target="#addProduct">
				<div class="card">
					<div class="container text-center">
						<img class="img-fluid " src="img/addProduct.png"
							alt="user's Image">
					</div>
					<div class="card-body text-center">
						<h4 class="text-muted">Add Products</h4>
						<!-- <a href="#" class=" btn btn-primary">Add</a> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="addCategory.jsp"%>
	<%@include file="addProduct.jsp"%>

	<!-- Importing Java Script file -->
	<%@ include file="js/commonJs.jsp"%>
</body>

</html>