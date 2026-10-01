<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String visitorCode = request.getParameter("code");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Registration Successful</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<nav class="navbar">

    <div class="logo">

        <div class="logo-icon">
            🏢
        </div>

        <h2>Visitor Management</h2>

    </div>

</nav>


<div class="status-container">

    <div class="status-card">

        <div class="success-icon">
            ✓
        </div>

        <h1>Registration Successful!</h1>

        <p class="subtitle">
            Your visitor registration has been submitted
            successfully.
        </p>


        <div class="visitor-code-box">

            <p>Your Visitor Code</p>

            <h2>
               <%= visitorCode %>
            </h2>

            <p>
                Please save this code to check your
                registration status later.
            </p>

        </div>


        <br>


        <a href="checkStatus.jsp">

            <button class="btn btn-primary">
                Check Registration Status
            </button>

        </a>


        <a href="userHome.jsp">

            <button class="btn btn-secondary">
                Back to Visitor Portal
            </button>

        </a>

    </div>

</div>


<footer class="footer">

    Visitor Management System © 2026

</footer>

</body>

</html>