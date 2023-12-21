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
<a href="/Portals/addproblem.jsp">
        <button class="btn btn-primary float-right">Add</button>
        </a>
<%@ page import="com.vds.PortalsSingleton" %>
<%@ page import="java.sql.ResultSet" %>

<%PortalsSingleton singleton = PortalsSingleton.getInstance();
ResultSet rs =  singleton.get_allprobs();
if(!rs.next()){
	out.println("<h1>Problems List Empty!</h1>");
}else{
%>

    <div class="container mt-4">
        <h1>Problems List</h1>
        
        <table class="table">
            <thead>
                <tr>
                    <th>Problem</th>
                    <th>Problem Sector</th>
                    <th>Reported on</th>
                    <th>Resolved?</th>
                </tr>
            </thead>
            <tbody>
                	
                <%
                do{
                	String resolved = (rs.getString("is_resolved").equals("0")) ? "False" : "True";  
                	out.println("<tr>");
                	out.println(String.format("<td>%s</td>",rs.getString("problem_description")));
                	out.println(String.format("<td>%s</td>",rs.getString("problem_sector")));
                    out.println(String.format("<td>%s</td>",rs.getString("created_timestamp")));
                    out.println(String.format("<td>%s</td>",resolved));
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


    
