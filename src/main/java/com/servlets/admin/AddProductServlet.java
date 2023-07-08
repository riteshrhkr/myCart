package com.servlets.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.PhotoOperation;

/**
 * Servlet implementation class AddProductServlet
 */

@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pName = request.getParameter("pName").trim();
		String pDesc = request.getParameter("pDesc").trim();
		int pPrice = Integer.parseInt(request.getParameter("pPrice").trim());
		int pDiscount = Integer.parseInt(request.getParameter("pDiscount").trim());
		int pQuantity = Integer.parseInt(request.getParameter("pQuantity").trim());
		HttpSession session = request.getSession();

		//		getting product photo and its name
		Part part = request.getPart("pPhoto");
		String photoName = part.getSubmittedFileName();

		//		Getting category
		int cId = Integer.parseInt(request.getParameter("categoryId").trim());
		Category category = new CategoryDao().getCategoryById(cId);

		Product product = new Product(pName, pDesc, pPrice, pDiscount, pQuantity);
		product.setpPhoto(photoName);
		product.setPCategory(category);

		ProductDao pDao = new ProductDao();
		if (pDao.addProduct(product)) {
			//			Storing Image of the product
			PhotoOperation operation = new PhotoOperation();
			InputStream iStream = part.getInputStream();
			//			Path to store product image
			String path = request.getServletContext().getRealPath("\\img\\products") + File.separator
					+ category.getCategoryTitle() + File.separator + photoName; // Foe dynamic a/c category
			//			String path = request.getServletContext().getRealPath("\\img\\products") + File.separator + photoName;

			operation.storeProduct(iStream, path);

			session.setAttribute("message", "Product added successfully");
			session.setAttribute("messageColor", "success");
			response.sendRedirect("adminPage.jsp");
		} else {
			session.setAttribute("message", "Faild to save Product!");
			session.setAttribute("messageColor", "danger");
			response.sendRedirect("adminPage.jsp");

		}

	}

}
