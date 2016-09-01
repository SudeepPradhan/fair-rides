package edu.mum.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.Comment;
import edu.mum.models.Like;
import edu.mum.models.Post;
import edu.mum.services.CommentService;
import edu.mum.services.LikeService;
import edu.mum.services.PostService;

@WebServlet("/notification")
public class NotificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PostService ps = new PostService();
		CommentService cs = new CommentService();
		LikeService ls = new LikeService();

		Post post = ps.getLastPost(1); // 1 offer
		Post post2 = ps.getLastPost(2); // 2 ask
		Comment comment = cs.getLastComment();
		Like like = ls.getLastLike();
		if (post != null && post2 != null) {
			Map<String, String> map = new HashMap<>();
			map.put("lo", String.valueOf(post.getPostid()));
			map.put("la", String.valueOf(post2.getPostid()));
			if (comment != null) {
				map.put("lc", String.valueOf(comment.getCommentid()));
			}
			if (like != null) {
				map.put("ll", String.valueOf(like.getLikeid()));
			}

			ObjectWriter ow = new ObjectMapper().writer()
					.withDefaultPrettyPrinter();
			String json = ow.writeValueAsString(map);
			response.getWriter().println(json);
		}

	}

}
