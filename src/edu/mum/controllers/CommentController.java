package edu.mum.controllers;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.Comment;
import edu.mum.models.Post;
import edu.mum.models.User;
import edu.mum.services.CommentService;
import edu.mum.services.PostService;
import edu.mum.services.UserService;

@WebServlet("/comment")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UserService us = new UserService();
		PostService ps = new PostService();
		CommentService cs = new CommentService();
		Comment comment = null;
		HttpSession session = request.getSession();

		int userId = (int) session.getAttribute("userid");
		int postid = Integer.valueOf(request.getParameter("postid"));
		
 		
		User user = us.getUserByUserId(userId);
		Post post = ps.getPost(postid);
		if (comment == null) {
			comment = new Comment();
			comment.setComment(request.getParameter("comment"));
			comment.setDatecreated(new Date());
			comment.setUser(user);
			comment.setPost(post);
		}

		Comment comment2 = cs.saveComment(comment);

		if (comment2.getCommentid() > 0) {
			Map<String, String> map = new HashMap<>();
			map.put("error", "");
			map.put("lc", String.valueOf(comment2.getCommentid()));
			map.put("message", "Successfully saved comment");
			ObjectWriter ow = new ObjectMapper().writer()
					.withDefaultPrettyPrinter();
			String json = ow.writeValueAsString(map);
			response.getWriter().println(json);
	 
		}

	}

}
