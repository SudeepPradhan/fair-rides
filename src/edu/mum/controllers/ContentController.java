package edu.mum.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.mum.services.ContentService;

@WebServlet("/content")
public class ContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ContentService contentService = new ContentService();
		request.setAttribute("posts", contentService.getPosts(1, 25)); //1 = offer
		request.setAttribute("asks", contentService.getPosts(2, 25));  //2 = request

		request.getRequestDispatcher("contentpage.jsp").forward(request,
				response);
	}

}
