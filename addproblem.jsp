<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Problem Report Form</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<%@ page import="com.vds.PortalsSingleton" %>
<%@ page import="java.sql.ResultSet" %>

<%PortalsSingleton singleton = PortalsSingleton.getInstance();
ResultSet rs =  singleton.get_sectors();%>
<body>
    <div class="container mt-4">
        <h2>Problem Report Form</h2>
        <form action="/Portals/AddProblem" method="POST">
            <div class="form-group">
                <label for="problemSector">Problem Sector:</label>
                <select class="form-control" id="problemSector" name="problemSector">
               		<%
               			if(!rs.next()){
               				out.println("No Sectors added, please contact admin");
               			}else{
               				do{
               					out.println("<option value=\"" + rs.getString("sector_name")+"\">"+rs.getString("sector_name")+"</option>\"");
               				}while(rs.next());
               			}
               		%>
                    <!-- Add more options as needed -->
                </select>
            </div>
            <div class="form-group">
                <label for="problemDescription">Detailed Problem Description:</label>
                <textarea class="form-control" id="problemDescription" name="problemDescription" rows="5"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

