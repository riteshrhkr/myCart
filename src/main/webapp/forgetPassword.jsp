<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Importing CSS  -->
<%@include file="css/commonCss.jsp"%>

<title>Retrive your account</title>

</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
        <!-- Picture to show forget password -->
		<div class="row mt-5">
			<div class="col-md-3 offset-md-1">
                <div>
                    <img src="img/forgetPassword.jpg" alt=""
					style="width: 16rem; height: 16rem;">
                </div>
				<h4 class="text-center my-3 mt-0 pt-0 d-inline">Forget your password?</h4>
			</div>
			<div class="col-md-5 ">
				<!-- Card -->
				<div class="card mt-5">


					<!-- card body -->
					<div class="card-body mt-2">
						<!-- Message if user had if user does'nt exist -->
						<%@ include file="components/message.jsp"%>

						<form action="ForgetPasswordServlet" method="post">
							<!-- Email-id -->
							<div class="mb-2">
								<label for="userEmail" class="form-label">Email address</label>
								<input type="email" class="form-control" id="userEmail"
									name="userEmail" aria-describedby="emailHelp"
									placeholder="Enter Email-id" required>
								<div id="emailHelp" class="form-text"></div>
							</div>

							<div class="container text-center">

								<button type="submit" class="btn btn-outline-success">
									<!-- <img style="height: 20px; width: 20px;" class="me-1"
										src="img/login2.gif"> -->
									Check
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