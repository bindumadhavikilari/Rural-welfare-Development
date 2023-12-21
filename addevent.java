package com.vds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddEvent
 */
public class AddEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PortalsSingleton singleton = PortalsSingleton.getInstance();
		HttpSession session = request.getSession();
		String user_id = singleton.get_user_id(session.getAttribute("email").toString());
		String name = request.getParameter("eventName");
		String place = request.getParameter("eventPlace");
		String date = request.getParameter("eventDate");
		String time = request.getParameter("eventSlot");
		System.out.println(user_id+","+name+","+place+","+date+","+time);
		date = date+" "+time+":00";
		singleton.add_event(name, date, place, user_id);
		response.sendRedirect("dashboard.jsp");
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
