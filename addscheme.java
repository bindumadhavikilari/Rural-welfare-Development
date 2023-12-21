package com.vds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddScheme
 */
public class AddScheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddScheme() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PortalsSingleton singleton = PortalsSingleton.getInstance();
		HttpSession session = request.getSession();
		String user_id = singleton.get_user_id(session.getAttribute("email").toString());
		String scheme = request.getParameter("schemeName");
		String event = request.getParameter("selectEvent");
		String desc = request.getParameter("schemeDescription");
		String[] probs = request.getParameterValues("checklistItem");
		String[] knobs = request.getParameterValues("checklistItemLabel");
		//System.out.println("Probs are : ===> ");
		System.out.println(scheme);
		String probs_json = "[";
		if(probs!=null)
		{
			int i=0;
			for(String prob : probs) {
				System.out.println(prob+" : "+knobs[i]);
				probs_json= probs_json+knobs[i]+",";
				i++;
			}
			i=0;
			probs_json = probs_json.substring(0, probs_json.length() - 1);
			probs_json = probs_json+"]";
		}
		else
		{
			probs_json=probs_json+"]";
		}
		
		System.out.println(probs_json);
		
		singleton.add_scheme(desc,scheme, user_id, event,probs_json);
		response.sendRedirect("dashboard.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
