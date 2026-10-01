<%-- 
    Document   : login
    Created on : 26 Aug, 2026, 7:10:42 PM
    Author     : shravani soundalakar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="login-page">
    <div class="login-card">
        <div class="login-logo">
            🏢
        </div>
        <h1>Visitor Management</h1>

        <p class="subtitle">
            Admin Login
        </p>

        <%
            String error = request.getParameter("error");

            if ("invalid".equals(error)) {
        %>

        <div class="alert alert-error">
            Invalid username or password.
        </div>

        <%
            }
        %>

        <form action="LoginServlet" method="post">

            <div class="form-group">

                <label>Username</label>

                <input
                    type="text"
                    name="username"
                    class="form-control"
                    placeholder="Enter username"
                    required>

            </div>


            <div class="form-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    class="form-control"
                    placeholder="Enter password"
                    required>

            </div>
            
            <button
                type="submit"
                class="btn btn-primary btn-block">

                Login
            </button>
        </form>
    </div>
</div>
</body>
</html>