package edu.mum.controllers;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.Post;
import edu.mum.services.PostService;
import edu.mum.utils.PostType;
 

@WebServlet("/postride")
public class PostRideController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("post_ride.jsp").forward(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService postService = new PostService();
		
		int userId = (int)request.getAttribute("userId");
		
		Post post = null;
		
		Object postId = request.getAttribute("postId");
		if( postId != null)
			post = postService.getPost((int)postId);
			
		if(post == null) {
			post = new Post(); 
			post.setPostid(new Random().nextInt(50));
			post.setUserId(userId);
			post.setPostType(PostType.Offer);
			post.setDateCreated(new Date());
		}
		
		post.setPost(request.getParameter("post"));
		post.setDateUpdated(new Date());

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
