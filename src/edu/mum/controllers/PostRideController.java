package edu.mum.controllers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.Post;
import edu.mum.models.User;
import edu.mum.services.PostService;
import edu.mum.services.UserService;

 
@WebServlet("/postride")
public class PostRideController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("post_ride.jsp").forward(request,response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		PostService postService = new PostService();
		HttpSession session = request.getSession();

		int userId=(int) session.getAttribute("userid");
 		 
		User user = userService.getUserByUserId(userId);
		Post post = null;
 
		if (post == null) {
			post = new Post();
			post.setUser(user);
			post.setPosttype(1); // 1 means request
			post.setDatecreated(new Date());
			post.setPost(request.getParameter("post"));
			post.setDateupdated(new Date());
		}

 

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
