package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckoutServlet
 */
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rDispatcher = request.getRequestDispatcher("js/commonJs.jsp");
		rDispatcher.include(request, response);
		PrintWriter out = response.getWriter();

		out.println("Hello World");
		out.println("<script>\r\n" + "		console.log(\"Calling order function\");\r\n" + "		order();\r\n"
				+ "	</script>");
		//		try {
		//			Thread.sleep(15000);
		//		} catch (InterruptedException e) {
		//			// TODO Auto-generated catch block
		//			e.printStackTrace();
		//		}
		response.sendRedirect("index.jsp");
	}

}
