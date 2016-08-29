package edu.mum.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.User;
import edu.mum.services.UserService;
import edu.mum.utils.HibernateUtil;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		UserService userService = new UserService();
		

		if (request.getParameter("email") != null
				&& request.getParameter("password") != null) {
			User user = new User();
			user.setFullname(request.getParameter("fullname"));
			user.setEmail(request.getParameter("email"));
			user.setGender(Integer.valueOf(request.getParameter("gender")));
			user.setBirthyear(Integer.valueOf(request.getParameter("birthyear")));
			user.setStreet(request.getParameter("street"));
			user.setCity(request.getParameter("city"));
			user.setState(request.getParameter("state"));
			user.setZip(Integer.valueOf(request.getParameter("zip")));
			user.setPassword(HibernateUtil.getEncryptedPassword(request
					.getParameter("password")));

			User user2 = userService.saveUser(user);

			if (user2.getUserid() > 0) {
				request.setAttribute("message", "");
				ObjectWriter ow = new ObjectMapper().writer()
						.withDefaultPrettyPrinter();
				String json = ow.writeValueAsString(user);
				response.getWriter().println(json);
			}
		}
	}
}
