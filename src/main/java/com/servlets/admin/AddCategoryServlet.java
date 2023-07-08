package com.servlets.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryDao;
import com.entities.Category;
import com.helper.PhotoOperation;

/**
 * Servlet implementation class AddCategoryServlet
 */
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("categoryTitle").trim();
		String description = request.getParameter("categoryDescription").trim();
		HttpSession session = request.getSession();
		Category category = new Category(title, description);

		CategoryDao cDao = new CategoryDao();

		//		If category already exist
		if (cDao.categoryExist(title)) {
			session.setAttribute("message", "Category already exist!");
			session.setAttribute("messageColor", "warning");
			response.sendRedirect("adminPage.jsp");
		} else {

			//				Creating new directory for category
			String path = request.getServletContext().getRealPath("\\img") + File.separator + "products"
					+ File.separator + title;
			PhotoOperation pOperation = new PhotoOperation();
			if (pOperation.createDirectory(path)) {
				System.out.println(title + " directory Created Successfully");
				//			System.out.println(System.getProperty("user.dir"));
			} else {
				System.out.println("Faild to create");
				session.setAttribute("message", "Faild to create new category!");
				session.setAttribute("messageColor", "warning");
				response.sendRedirect("adminPage.jsp");
			}

			//			IF category not exist already and directory is successfully created then add category to the database
			if (cDao.addCategory(category)) {

				session.setAttribute("message", title + " category added successfully");
				session.setAttribute("messageColor", "success");
				response.sendRedirect("adminPage.jsp");
			} else {
				session.setAttribute("message", "Faild to save new Category!");
				session.setAttribute("messageColor", "danger");
				response.sendRedirect("adminPage.jsp");

			}
		}

	}

}
