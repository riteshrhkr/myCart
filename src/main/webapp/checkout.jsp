<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	session.setAttribute("message", "Your have to login first");
	session.setAttribute("messageColor", "warning");
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Checkout selected items</title>
	<!-- Importing CSS file -->
	<%@include file="css/commonCss.jsp"%>

</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid mt-5">
		<div class="row">
			<div class="col-md-6">
				<div class="card ">
					<h3 class="card-title text-center text-info">Your selected
						items</h3>
					<hr>
					<div class="cart-body"></div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- card body -->
				<div class="card-body px-5">

					<form action="CheckoutServlet" method="post">
						<!-- UserName -->
						<div class="mb-2">
							<label for="userName" class="form-label">*Name:</label> <input type="text"
								class="form-control" id="userName" name="userName" placeholder="Enter userName here"
							value="<%=user.getUserName()%>"	required>
						</div>
						<!-- userPhone -->
						<div class="mb-2">
							<label for="userPhone" class="form-label">*Phone No:</label> <input type="text"
								class="form-control" id="userPhone" name="userPhone"
								placeholder="Enter phone number here" value="<%=user.getUserPhone()%>" required>
						</div>

						<!-- User Email -->
						<div class="mb-2">
							<label for="userEmail" class="form-label">*Email ID:
							</label> <input type="email" class="form-control" id="userEmail" name="userEmail"
								aria-describedby="emailHelp" placeholder="Enter your Email-ID here" required
								value="<%=user.getUserEmail()%>">
						</div>

						<!-- Address -->
						<div class="mb-2">
							<label for="userAddress" class="form-label">*Address: </label>
							<textarea name="userAddress" id="userAddress" cols="30" rows="10" class="form-control"
								placeholder="Enter your Address here" style="height: 100px;"><%=user.getUserAddress()%></textarea>
						</div>
						<!-- pincode -->
						<div class="mb-2">
							<label for="userPhone" class="form-label">*Pin Code:</label> <input type="number"
								class="form-control" id="pincode" name="pincode"
								placeholder="Enter phone number here" required>
						</div>

						<div class="container text-center">
							<button type="submit" id="registerButton" class="btn btn-outline-success" >Order</button>
							<a href="index.jsp" class="btn btn-outline-success ms-2">Buy More</a>
						</div>
						<!-- <button type="reset" class="btn btn-outline-warning me-5">Reset</button> -->
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Importing Java Script file -->
	<%@ include file="js/commonJs.jsp"%>

	
</body>

</html>