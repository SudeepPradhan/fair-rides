package edu.mum.controllers;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("post_ride.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PostService postService = new PostService();
		UserService userService = new UserService();
		HttpSession session = request.getSession();

		int userId = (int) session.getAttribute("userid");
		User user = userService.getUserByUserId(userId);
		Post post = null;

		Object postId = request.getAttribute("postid");
		if (postId != null)
			post = postService.getPost((int) postId);

		if (post == null) {
			post = new Post();
			post.setPostid(new Random().nextInt(50));
			post.setUser(user);
			post.setPosttype(1); // 1 means offer
			post.setDatecreated(new Date());
		}

		post.setPost(request.getParameter("post"));
		post.setDateupdated(new Date());

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
