package edu.mum.controllers;

import java.io.IOException;
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

import edu.mum.models.User;
import edu.mum.services.UserService;

@WebServlet("/auth")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		UserService us = new UserService();
		
		
		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("userId"));
		String email = String.valueOf(session.getAttribute("email"));
		if (userId != null && email != null) {
			User user = us.getUserByEmail(email);
			ObjectWriter ow = new ObjectMapper().writer()
					.withDefaultPrettyPrinter();
			String json = ow.writeValueAsString(user);
			response.getWriter().println(json);
		} else {
			Map<String,String> map = new HashMap<>();
			map.put("error","Unauthorized");
			map.put("message","Sorry you are not authorized to access this application");
			ObjectWriter ow = new ObjectMapper().writer()
					.withDefaultPrettyPrinter();
			String json = ow.writeValueAsString(map);
			response.getWriter().println(json);
		}
	}

}
