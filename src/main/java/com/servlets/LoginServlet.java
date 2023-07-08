package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Getting data from login.jsp
			String userEmail = request.getParameter("userEmail").trim();
			String userPassword = request.getParameter("userPassword");

			// validate user
			UserDao userDao = new UserDao();
			User user = userDao.getUser(userEmail, userPassword);

			if (user == null) {
				HttpSession session = request.getSession();
				session.setAttribute("message", "Invalid user! Check Email-ID or Password");
				session.setAttribute("mesageColor", "danger");
				response.sendRedirect("login.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);

				if (user.getUserType().equalsIgnoreCase("admin")) {

					response.sendRedirect("adminPage.jsp");
				} else {
					response.sendRedirect("index.jsp");
				}
			}
		} catch (Exception e) {
			System.out.println("Error in LoginServlet");
			e.printStackTrace();
		}
	}

}
