package com.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.PhotoOperation;

/**
 * Servlet implementation class Test
 */
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {

		String path = request.getServletContext().getRealPath("\\img") + File.separator + "products\\newDir10";
		System.out.println(path);
		PhotoOperation pOperation = new PhotoOperation();
		if (pOperation.createDirectory(path)) {
			System.out.println("Created Successfully");
			//			System.out.println(System.getProperty("user.dir"));
		} else {
			System.out.println("Faild to create");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
