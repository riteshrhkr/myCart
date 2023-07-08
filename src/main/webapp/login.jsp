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
				<!-- Card -->
				<div class="card">
					<!-- card header -->
					<div class="card-header mb-0">
						<img src="img/login1.png" alt="">
						<h3 class="text-center my-3 mt-0 pt-0 d-inline">Login</h3>
					</div>
					<!-- card body -->
					<div class="card-body mt-0">
						<!-- Message if user had just registered -->
						<%@ include file="components/message.jsp"%>

						<form action="LoginServlet" method="post">
							<!-- Email-id -->
							<div class="mb-2">
								<label for="userEmail" class="form-label">Email address</label>
								<input type="email" class="form-control" id="userEmail"
									name="userEmail" aria-describedby="emailHelp"
									placeholder="Enter Email-id" required>
								<div id="emailHelp" class="form-text"></div>
							</div>
							<!-- Password -->
							<div class="mb-2">
								<label for="userPassword" class="form-label">Password</label> <input
									type="password" class="form-control" id="userPassword"
									name="userPassword" placeholder="Enter Password" required>
							</div>
							<!-- forget password -->
							<div>
								<a href="forgetPassword.jsp"
									class="link-underline-success text-success">Forget my
									Password</a>
							</div>
							<div class="container text-center">

								<button type="submit" class="btn btn-outline-success">
									<img style="height: 20px; width: 20px;" class="me-1"
										src="img/login2.gif">login
								</button>
								<a class="btn btn-outline-success" href="register.jsp">Register</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="js/commonJs.jsp"%>
</body>