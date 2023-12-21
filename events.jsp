<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Table</title>
    <style>
    body{
    background-image:url("villagehome.jpg");
    }
    </style>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
</head>
<body>
<a href="/Portals/addevent.jsp">
        <button class="btn btn-primary float-right" <%if(session.getAttribute("role").toString().equals("user")){
                	out.print("style=\"display: none;\"");}
                %>>Add</button>
        </a>
<%@ page import="com.vds.PortalsSingleton" %>
<%@ page import="java.sql.ResultSet" %>

<%PortalsSingleton singleton = PortalsSingleton.getInstance();
ResultSet rs =  singleton.get_allevents();
if(!rs.next()){
	out.println("<h1>Events List Empty!</h1>");
}else{
%>

    <div class="container mt-4">
        <h1>Events List</h1>
        
        <table class="table">
            <thead>
                <tr>
                    <th>Event Id</th>
                    <th>Event Name</th>
                    <th>Event date</th>
                    <th>Event Place</th>
                    <th>Organizer</th>
                </tr>
            </thead>
            <tbody>
                	
                <%
                do{
                	out.println("<tr>");
                	out.println(String.format("<td>%s</td>",rs.getString("event_id")));
                	out.println(String.format("<td>%s</td>",rs.getString("event_name")));
                	out.println(String.format("<td>%s</td>",rs.getString("event_date")));
                    out.println(String.format("<td>%s</td>",rs.getString("event_place")));
                    out.println(String.format("<td>%s</td>",rs.getString("organizer_id")));
                	out.println("</tr>");
                }while(rs.next());
}
                %>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


