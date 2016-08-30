package edu.mum.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.Post;
import edu.mum.services.PostService;
 

@WebServlet("/postride")
public class PostRideController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("post_ride.jsp").forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService postService = new PostService();
		

		if (request.getParameter("fromSource") != null
				&& request.getParameter("toDestination") != null) {
			Post post = new Post();
			post.setFromSource(request.getParameter("fromSource"));
			post.setToDestination(request.getParameter("toDestination"));
			post.setDescription(request.getParameter("note"));
			post.setDateTime(request.getParameter("dateTime"));
			post.setSeats(request.getParameter("seats"));
			post.setNonSmoking(Boolean.parseBoolean(request.getParameter("nonSmoking")));
			
			Post post2 = postService.savePost(post);
			
			if (post2.getPostid() > 0) {
				request.setAttribute("message", "");
				ObjectWriter ow = new ObjectMapper().writer()
						.withDefaultPrettyPrinter();
				String json = ow.writeValueAsString(post);
				response.getWriter().println(json);
			}
		}
	}
}
