package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session = FactoryProvider.getFactory().openSession();
		response.getWriter().println(session);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String userName = request.getParameter("userName").trim();
			String userPhone = request.getParameter("userPhone").trim();
			String userEmail = request.getParameter("userEmail").trim();
			String userPassword = request.getParameter("userPassword");
			String userAddress = request.getParameter("userAddress").trim();
			HttpSession session = request.getSession();

			// Creating user object and storing data
			User user = new User(userName, userPhone, userEmail, userPassword, userAddress);

			//			Storing 
			UserDao userDao = new UserDao();

			if (userDao.userExist(userEmail)) {
				//				Storing registration successful message in session
				session.setAttribute("message", "This email-id already exist!");
				session.setAttribute("messageColor", "warning");

				response.sendRedirect("register.jsp");
			}

			else if (userDao.addUser(user)) {
				//			Storing registration successful message in session
				session.setAttribute("message", "Registration Successful");
				session.setAttribute("messageColor", "success");

				//			Redirecting to Login page
				response.sendRedirect("login.jsp");
			} else {
				session.setAttribute("message", "Some problem occurs! Please try again.");
				session.setAttribute("messageColor", "danger");

				//			Redirecting to Login page
				response.sendRedirect("register.jsp");

			}
		} catch (Exception e) {
			System.out.println("Error while storing registration data");
			e.printStackTrace();
		}
	}

}
