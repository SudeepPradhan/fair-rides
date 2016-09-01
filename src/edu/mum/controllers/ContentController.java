package edu.mum.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.services.ContentService;

@WebServlet("/content")
public class ContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		int userId = (int)session.getAttribute("userid");
//		if(userId != null)
		int offset = 0, posttype1=1,size=25;
		String page   = request.getParameter("page");
		String posttype = request.getParameter("posttype");
		if(null != page){
			 offset = Integer.valueOf(page);
			 if(offset>0){
				 offset = (offset*size);
			 }
		}
		if(null != posttype){
			posttype1=Integer.valueOf(posttype);
		}
		ContentService contentService = new ContentService();

		if(offset>0){
			response.setContentType("application/json");
			ObjectWriter ow = new ObjectMapper().writer()
					.withDefaultPrettyPrinter();
			String json = ow.writeValueAsString(contentService.getPosts(1,offset, size));
			response.getWriter().println(json);
		 }else{
 				request.setAttribute("posts", contentService.getPosts(1,offset, size)); //1 = offer
				request.setAttribute("asks", contentService.getPosts(2,offset, size));  //2 = request

			 request.getRequestDispatcher("contentpage.jsp").forward(request,response);
		 }

	}
}

