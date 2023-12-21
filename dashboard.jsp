<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Navigation Tabs</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%

if(session.getAttribute("uname")==null){
	response.sendRedirect("index.jsp");
}
%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <ul class="nav nav-tabs" id="myTabs">
                <li class="nav-item">
                	<a class="nav-link" href="#" onclick="loadPage('home_tab.jsp', 'content-container')">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" onclick="loadPage('all_users.jsp', 'content-container')">All Users</a>
                  
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="loadPage('events.jsp', 'content-container')">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="loadPage('schemes.jsp', 'content-container')">Schemes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="loadPage('problems_registered.jsp', 'content-container')">Problems Registered</a>
                </li>
            </ul>
            
            <!-- Username on top right -->
            <span class="navbar-text ml-auto">
                <strong>
                <%out.println(session.getAttribute("uname").toString());%>
                </strong>
                <br>
                <small> (<%out.println(session.getAttribute("role").toString());%>) </small>
                <small><a href="/Portals/Logout">Logout</a></small>
            </span>
        </div>
    </nav>

    <div class="container mt-4">
        <div id="content-container">
            <!-- Content will be loaded here -->
        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Function to load a page into a container
        function loadPage(pageUrl, containerId) {
            $.ajax({
                url: pageUrl,
                dataType: 'html',
                success: function (data) {
                    $('#' + containerId).html(data);
                }
            });
        }

        // Load the Home page by default
        loadPage('home_tab.jsp', 'content-container');
    </script>
</body>
</html>
