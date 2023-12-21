package com.vds;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PortalsSingleton singleton = PortalsSingleton.getInstance();
		// TODO Auto-generated method stub
		int form_type = Integer.parseInt(request.getParameter("type"));
		if(form_type == 1) {
			ResultSet rs = singleton.login(request.getParameter("username"),request.getParameter("password"));
			try {
				if(!rs.next()) {
					System.out.println("No matching credentials");
				}else {
					System.out.println("Welcome : "+rs.getString("username"));
					HttpSession session = request.getSession();
					session.setAttribute("uname",rs.getString("username"));
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("role",rs.getString("role"));
					response.sendRedirect("dashboard.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}else {
			String username = request.getParameter("first_name") +" "+request.getParameter("last_name");
			String pass = request.getParameter("password");
			String email = request.getParameter("email");
			String role = request.getParameter("role");
			String phone_number = request.getParameter("phone");
			singleton.register(username,pass,email,role,phone_number);
			HttpSession session = request.getSession();
			session.setAttribute("uname",username);
			session.setAttribute("email", email);
			session.setAttribute("role",role);
			response.sendRedirect("dashboard.jsp");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
