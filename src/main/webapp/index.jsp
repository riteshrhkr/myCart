<%@page import="com.entities.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="javax.enterprise.inject.New"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.helper.IndexHelper"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY CART : Home</title>
<!-- Importing CSS  -->
<%@include file="css/commonCss.jsp"%>

</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid mt-5">
		<div class="row">
			<%
			CategoryDao cDao = new CategoryDao();
			List<Category> cList = cDao.getCategories();

			String categoryIdS = request.getParameter("categoryId");
			ProductDao pDao = new ProductDao();
			List<Product> pList = null;

			if (categoryIdS == null) {
				pList = pDao.getProducts();
			} else {
				try {
					int categoryId = Integer.parseInt(categoryIdS.trim());
					pList = pDao.getProductsByCategoryId(categoryId);
				} catch (Exception e) {
					response.sendRedirect("index.jsp");
				}
			}
			%>
			<!-- For Categories -->
			<div class="col-md-2">
				<!-- List item -->
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action nav-bg"
						aria-current="true">Categories</a> <a href="index.jsp"
						class="list-group-item list-group-item-action">All</a>
					<%
					for (Category category : cList) {
					%>
					<a href="index.jsp?categoryId=<%=category.getCategoryId()%>"
						class="list-group-item list-group-item-action"> <%=category.getCategoryTitle()%>
					</a>
					<%
					}
					%>

				</div>
			</div>

			<!-- For Products -->
			<div class="col-md-10">
				<!-- To arrange all products in 4 columns -->
				<div class="row row-cols-md-2">
					<!-- Loop to print each card for product -->
					<%
					for (Product p : pList) {
					%>
					<div class="col m-1 mt-2" style="max-width: 21rem;">
						<div class="card text-center pt-2">
							<!-- Product image maintain -->
							<div class="container-fluid text-center" style="height: 10rem;">
								<img
									src="img/products/<%=p.getPCategory().getCategoryTitle()%>/<%=p.getpPhoto()%>"
									style="max-height: 10rem; max-width: auto;"
									alt="img/default.png">

							</div>
							<div class="card-title">
								<%=p.getpName()%>
							</div>
							<div class="card-body">
								<%=IndexHelper.get50Char(p.getpDesc())%>
							</div>
							<%-- <div class="card-body"><%=p.getpDesc()%></div> --%>
							<div class="card-footer">
								<a class="btn btn-primary"
									onclick="addToCart(<%=p.getPid()%>, '<%=p.getpName()%>', <%=IndexHelper.getDiscountedPrice(p.getpPrice(), p.getpDiscount())%>)">Add
									to Cart</a>
								<button class=" btn btn-outline-success border rounded-2">
									&#8377;<%=IndexHelper.getDiscountedPrice(p.getpPrice(), p.getpDiscount())%>/
									<span class="real-price">&#8377;<%=p.getpPrice()%></span> <span
										class="discount-label"> <%=p.getpDiscount()%>% off
									</span>
								</button>
							</div>
						</div>
					</div>
					<%
					} // Closing for each loop
					if (pList.size() == 0) {
					out.println("<h3> No item in this category.</3>");
					}
					%>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="js/commonJs.jsp"%>
</body>

</html>