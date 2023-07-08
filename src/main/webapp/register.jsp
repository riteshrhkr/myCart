<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Importing CSS  -->
<%@include file="css/commonCss.jsp"%>

<title>Register</title>

</head>
 
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<!-- card header -->
					<div class="card-header">
						<div class="container text-center">
							<img src="img/register.png" alt="">
							<h3 class="text-center my-3 mt-0 pt-0">Fill Your Details</h3>
						</div>
					</div>
					<!-- card body -->
					<div class="card-body px-5">
					<%@ include file="components/message.jsp" %>

						<form action="RegisterServlet" method="post">
							<!-- UserName -->
							<div class="mb-2">
								<label for="userName" class="form-label">*UserName:</label> <input
									type="text" class="form-control" id="userName" name="userName"
									placeholder="Enter userName here" required>
							</div>
							<!-- userPhone -->
							<div class="mb-2">
								<label for="userPhone" class="form-label">Phone No:</label> <input
									type="text" class="form-control" id="userPhone"
									name="userPhone" placeholder="Enter phone number here">
							</div>

							<!-- User Email -->
							<div class="mb-2">
								<label for="userEmail" class="form-label">*Email address:
								</label> <input type="email" class="form-control" id="userEmail"
									name="userEmail" aria-describedby="emailHelp"
									placeholder="Enter your Email-ID here" required autocomplete="off">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>

							<!-- Password -->
							<div class="mb-2">
								<label for="userPassword" class="form-label">*Password: </label>
								<input type="password" class="form-control" id="userPassword"
									name="userPassword" placeholder="Keep password strong" required onchange="passwordMatch()">
							</div>
							<!-- Again Password -->
							<div class="mb-2">
								<label for="confirmPassword" class="form-label">*Enter password again: </label> <input type="password" class="form-control"
									id="confirmPassword" placeholder="Enter same password here" required oninput="passwordMatch()">
									<div id="passwordHelp" class="form-text text-danger"></div>
							</div>
							<!-- Address -->
							<div class="mb-2">
								<label for="userAddress" class="form-label">Address: </label>
								<textarea name="userAddress" id="userAddress" cols="30"
									rows="10" class="form-control"
									placeholder="Enter your Address here" style="height: 100px;"></textarea>
							</div>

							<div class="container text-center">
								<button type="submit" id="registerButton" class="btn btn-outline-success">Register</button>
								<a href="login.jsp" class="btn btn-outline-success ms-2">Login</a>
							</div>
							<!-- <button type="reset" class="btn btn-outline-warning me-5">Reset</button> -->
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Importing Java Script file -->
	<%@ include file="js/commonJs.jsp"%>
</body>

</html>