<%@page import="com.entities.User"%>
<%
User currentUser = (User) session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg nav-bg ">
	<div class="container">
		<a class="navbar-brand text-white " href="#">MY CART</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ">
				<li class="nav-item"><a class="nav-link active text-white "
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-white"
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false">Categories</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item text-white" href="#">Action</a></li>
						<li><a class="dropdown-item text-white" href="#">Another
								action</a></li>
						<li><a class="dropdown-item text-white" href="#">Something
								else here</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item text-white" href="#">Separated
								link</a></li>
					</ul></li>

				<li class="nav-item"><a class="nav-link text-white" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link text-white" href="#">Pricing</a></li>
			</ul>

			<div class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav">
					<li class="nav-item">
					<a
						class="nav-link btn text-white">
						<i class="fa-solid fa-cart-plus fs-3" data-bs-toggle="modal" data-bs-target="#cartViewModel" ></i>
						<span id="noOfCartItems">(0)</span>
					</a>
					</li>
					<!-- If user is not log in -->
					<%
					if (currentUser == null) {
					%>
					<li class="nav-item"><a
						class="nav-link btn btn-outline-success text-white"
						href="login.jsp">Login</a></li>
					<li class="nav-item"><a
						class="nav-link btn btn-outline-success text-white"
						href="register.jsp">Register</a></li>

					<!--if user is log in  -->
					<%
					} else {
					%>
					<li class="nav-item"><a
						class="nav-link btn btn-outline-success text-white" href="<%=currentUser.getUserName().equals("admin")?"adminPage.jsp":"index.jsp"%>"><%=currentUser.getUserName()%></a>
					</li>
					<li class="nav-item "><a
						class="nav-link btn btn-outline-warning text-white" href="LogOut">Log Out</a></li>
					<%
					}
					%>

				</ul>
			</div>
		</div>
	</div>
</nav>

<%@ include file="cartViewModel.jsp"%>