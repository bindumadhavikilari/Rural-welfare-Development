<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login and Registration Page</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <style>
            body {
                background-image:url("villagehome.jpg");
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }

            .container {
                margin-top: 100px;
            }

            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                background-color: #007bff;
                color: #fff;
                text-align: center;
                border-radius: 10px 10px 0 0;
            }

            .card-body {
                padding: 20px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .btn-register {
                background-color: #28a745;
                color: #fff;
            }

            .btn-register:hover {
                background-color: #218838;
            }

            .btn-login {
                background-color: #007bff;
                color: #fff;
            }

            .btn-login:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
    <%

if(session.getAttribute("uname")!=null){
	response.sendRedirect("dashboard.jsp");
}
%>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <!-- Login Form -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <h3>Login</h3>
                        </div>
                        <div class="card-body">
                            <form action="Login" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="username" placeholder="Email/Phone" required />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Password" required />
                                </div>
                                <input type="hidden" name="type" value="1" />
                                <div class="form-group">
                                    <button type="submit" class="btn btn-block btn-login">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Registration Form -->
                    <div class="card">
                        <div class="card-header">
                            <h3>Register</h3>
                        </div>
                        <div class="card-body">
                            <form action="Login" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="first_name" placeholder="First Name" required />
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="last_name" placeholder="Last Name" required />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" placeholder="Email" required />
                                </div>
                                <div class="form-group">
                                    <select class="form-control" id="roleDropdown" name="role">
                                        <option value="admin">Admin</option>
                                        <option value="volunteer">Volunteer</option>
                                        <option value="user">User</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" name="phone" placeholder="Phone Number" required />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Password" required />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required />
                                    <input type="hidden" name="type" value="2" />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-block btn-register">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include Bootstrap JS and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
