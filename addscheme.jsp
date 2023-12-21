<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Bootstrap Form</title>
</head>
<body>
<%@ page import="com.vds.PortalsSingleton" %>
<%@ page import="java.sql.ResultSet" %>
<%
PortalsSingleton singleton = PortalsSingleton.getInstance();
%>
    <div class="container">
        <h1>Create a Scheme</h1>
        <form action="/Portals/AddScheme"  method="POST">
            <!-- Scheme Description -->
            <div class="form-group">
                <label for="schemeName">Scheme Name:</label>
                <input type="text" class="form-control" id="schemeName" name="schemeName" placeholder="Enter scheme name">
            </div>
            <div class="form-group">
                <label for="schemeDescription">Scheme Description</label>
                <textarea class="form-control" id="schemeDescription" name="schemeDescription" rows="3" placeholder="Enter scheme description"></textarea>
            </div>

            <!-- Dropdown to Select Event -->
            
            <div class="form-group">
                <label for="selectEvent">Select Event</label>
                <select class="form-control" id="selectEvent" name="selectEvent">
                	<%ResultSet rse =  singleton.get_allevents();
                		if(!rse.next()){
                        	out.println("<h1>Event List Empty!</h1>");
                        }else{
                        	do{
                        		out.print("<option value=\"");out.print(rse.getString("event_id"));out.print("\">");
                        		out.print(rse.getString("event_name"));out.println("</option>");
                        	}while(rse.next());
                        }
                	%>
                    
                    <!-- Add more options as needed -->
                </select>
            </div>

            <!-- Checklist -->
            <div class="form-group">
                <label>Problems open</label>
                <%ResultSet rs =  singleton.get_allprobs();
                if(!rs.next()){
                	out.println("<h1>User List Empty!</h1>");
                }else{
                do{
                out.print("<div class=");out.print("\"form-check\">");
                    out.println("<input class=\"form-check-input\" type=\"checkbox\" id=\"checklistItem1\" name=\"checklistItem\">");
                    out.print("<input  name=\"checklistItemLabel\" value=\"");out.print(rs.getString("problem_id"));out.println("\">");
                    out.print("<label class=\"form-check-label\" for=\"");out.print(rs.getString("problem_description"));
                    		out.print("\">");out.print(rs.getString("problem_description"));out.print("</label>");
                out.println("</div>");}while(rs.next());
                }%>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
