package edu.mum.controllers;

import java.io.IOException;

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
import edu.mum.utils.HibernateUtil;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		if(email != null && pass != null){
			
			if(userService.checkUser(email,HibernateUtil.getEncryptedPassword(pass))){
				User user = userService.getUser(email,HibernateUtil.getEncryptedPassword(pass));
				
				HttpSession session = request.getSession();
				session.setAttribute("userId", user.getUserid());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("fullname", user.getFullname());
				
				
				response.addCookie(new Cookie("userId",String.valueOf(user.getUserid())));
				response.addCookie(new Cookie("email",user.getEmail()));
				response.addCookie(new Cookie("fullname",user.getFullname()));
				
				
				ObjectWriter ow = new ObjectMapper().writer()
						.withDefaultPrettyPrinter();
				String json = ow.writeValueAsString(user);
				response.getWriter().println(json);
			}
			
		}

	}

}
