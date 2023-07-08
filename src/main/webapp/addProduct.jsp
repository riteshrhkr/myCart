<!-- Classes to triger model
data-bs-toggle="modal" data-bs-target="#exampleModal"
Here #exampleModel is ID to  trigger the model who have this ID
    Open Scrollable Modal
</button> -->

<!-- Scrollable Modal -->
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>

<!-- Modal -->
<div class="modal fade" id="addProduct" tabindex="-1" aria-labelledby="addProductLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="addProduct">Add Product</h1>
         
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div style="max-height: 300px; overflow-y: auto;">
                <!-- This is the part that will show  -->
                <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                    <!-- Category Title -->
                    <div class="mb-1">
                        <label for="categoryTitle" class="form-label">Select Category</label>
                        <Select name="categoryId" class="form-control" required>
                        <% List<Category> list = new CategoryDao().getCategories();
                        for(Category category:list){
                            %>
                            <option value="<%=category.getCategoryId()%>"><%=category.getCategoryTitle()%></option>
                            <%
                        }
                        %>
                        </Select>
                    </div>
                    <!-- Product Title -->
                    <div class="mb-1">
                        <label for="pName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="pName" name="pName" autocomplete="off"
                            placeholder="Enter product name" required>
                    </div>
                    <!-- Product Description -->
                    <div class="mb-1">
                        <label for="pDesc" class="form-label">Description</label>
                        <textarea name="pDesc" class="form-control" style="height: 5rem;"></textarea>
                    </div>
                    <!-- Product Photo -->

                    <!-- Product Price -->
                    <div class="mb-1">
                        <label for="pPrice" class="form-label"> Price</label>
                        <input type="number" class="form-control" id="pPrice" name="pPrice" autocomplete="off"
                            placeholder="Enter product price" required>
                    </div>

                    <!-- Product Discount -->
                    <div class="mb-1">
                        <label for="pDiscount" class="form-label"> Discount</label>
                        <input type="number" class="form-control" id="pDiscount" name="pDiscount"
                            autocomplete="off" placeholder="Enter product discount">
                    </div>

                    <!-- Product quantity -->
                    <div class="mb-1">
                        <label for="pQuantity" class="form-label"> Quantity</label>
                        <input type="number" class="form-control" id="pQuantity" name="pQuantity"
                            autocomplete="off" placeholder="Enter product Quantity" required>
                    </div>
                    <!-- Product image -->
                    <div class="mb-1">
                        <label for="pPhoto" class="form-label">Chose Product Image</label>
                        <input type="file" class="form-control" id="pPhoto" name="pPhoto" >
                    </div>

                    <!-- Buttons -->
                    <div class="modal-footer text-start">
                        <button type="submit" class="btn btn-outline-success">Add</button>
                        <!-- Button to dismis model -->
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancle</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer"> <div>If product already exist with same name in same category then it will be updated and product quantity will increased</div></div>
      </div> 
    </div>
  </div>