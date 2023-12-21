<%@page import="java.sql.ResultSet"%>
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
<%@ page import="com.vds.PortalsSingleton" %>
<%PortalsSingleton singleton = PortalsSingleton.getInstance();
ResultSet rs =  singleton.get_allusers();
if(!rs.next()){
	out.println("<h1>User List Empty!</h1>");
}else{
%>
    <div class="container mt-4">
        <h1>User List</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
                	
                <%
                do{
                	out.println("<tr>");
                	out.println(String.format("<td>%s</td>",rs.getString("username")));
                	out.println(String.format("<td>%s</td>",rs.getString("email")));
                    out.println(String.format("<td>%s</td>",rs.getString("phone_number")));
                    out.println(String.format("<td>%s</td>",rs.getString("role")));
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

