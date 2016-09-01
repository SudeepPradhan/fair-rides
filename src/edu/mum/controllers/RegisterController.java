package edu.mum.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import edu.mum.models.User;
import edu.mum.services.UserService;
import edu.mum.utils.GeneralUtil;

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

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email != null && password != null) {

			User userCheck = userService.checkUser(email,
					GeneralUtil.getEncryptedPassword(password));
			if (null != userCheck) {
				Map<String, String> map = new HashMap<>();
				map.put("error", "Exist");
				map.put("message",
						"Sorry your provided information already exist");
				ObjectWriter ow = new ObjectMapper().writer()
						.withDefaultPrettyPrinter();
				String json = ow.writeValueAsString(map);
				response.getWriter().println(json);
			} else {
				User user = new User();
				user.setFullname(request.getParameter("fullname"));
				user.setEmail(email);
				user.setGender(Integer.valueOf(request.getParameter("gender")));
				user.setBirthyear(Integer.valueOf(request
						.getParameter("birthyear")));
				user.setStreet(request.getParameter("street"));
				user.setCity(request.getParameter("city"));
				user.setState(request.getParameter("state"));
				user.setZipcode(Integer.valueOf(request.getParameter("zipcode")));
				user.setPassword(GeneralUtil.getEncryptedPassword(password));

				User user2 = userService.saveUser(user);

				HttpSession session = request.getSession();
				session.setAttribute("userid", user2.getUserid());
				session.setAttribute("email", user2.getEmail());
				session.setAttribute("fullname", user2.getFullname());

				response.addCookie(new Cookie("userid", String.valueOf(user2
						.getUserid())));
				response.addCookie(new Cookie("email", user2.getEmail()));
				response.addCookie(new Cookie("fullname", user2
						.getFullname()));

				user.setPassword("");
				
				if (user2.getUserid() > 0) {
					request.setAttribute("message", "");
					ObjectWriter ow = new ObjectMapper().writer()
							.withDefaultPrettyPrinter();
					String json = ow.writeValueAsString(user2);
					response.getWriter().println(json);
				}
			}
		}
	}
}
