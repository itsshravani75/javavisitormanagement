<%-- 
    Document   : addVisitor
    Created on : 26 Aug, 2026, 7:11:23 PM
    Author     : shravani soundalakar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Visitor</title>
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

    <div class="nav-user">

        <span>
            Welcome,
            <%= session.getAttribute("username") %>
        </span>

        <a href="LogoutServlet">
            <button class="btn btn-secondary">
                Logout
            </button>
        </a>
    </div>
</nav>

<div class="form-card">

    <h2>Register New Visitor</h2>

    <p class="form-description">
        Enter the visitor details below.
    </p>

    <!-- Display validation error -->
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="alert alert-error">
            <strong>Error:</strong>
            <%= errorMessage %>
        </div>

    <%
        }
    %>

    <form action="AddVisitorServlet" method="post">

        <div class="form-grid">

            <!-- Visitor Name -->
            <div class="form-group">

                <label>Visitor Name *</label>

                <input
                    type="text"
                    name="name"
                    class="form-control"
                    placeholder="Enter visitor name"
                    required>

            </div>

            <!-- Mobile -->
            <div class="form-group">

                <label>Mobile Number *</label>

                <input
                    type="tel"
                    name="mobile"
                    class="form-control"
                    placeholder="Enter 10-digit mobile number"
                    pattern="[6-9][0-9]{9}"
                    minlength="10"
                    maxlength="10"
                    inputmode="numeric"
                    title="Please enter a valid 10-digit mobile number starting with 6, 7, 8 or 9"
                    required>

            </div>

            <!-- Email -->
            <div class="form-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                    placeholder="Enter email address">

            </div>

            <!-- Person to Meet -->
            <div class="form-group">

                <label>Person to Meet *</label>

                <input
                    type="text"
                    name="person_to_meet"
                    class="form-control"
                    placeholder="Employee name"
                    required>

            </div>

            <!-- Department -->
            <div class="form-group">

                <label>Department</label>

                <select
                    name="department"
                    class="form-control">

                    <option value="">
                        Select Department
                    </option>

                    <option>Human Resources</option>
                    <option>Finance</option>
                    <option>IT</option>
                    <option>Marketing</option>
                    <option>Administration</option>
                    <option>Management</option>
                    <option>Other</option>

                </select>

            </div>

            <!-- Address -->
            <div class="form-group">

                <label>Address</label>

                <input
                    type="text"
                    name="address"
                    class="form-control"
                    placeholder="Enter address">

            </div>

            <!-- Purpose -->
            <div class="form-group form-full">

                <label>Purpose of Visit</label>

                <textarea
                    name="purpose"
                    class="form-control"
                    placeholder="Enter purpose of visit"></textarea>

            </div>

        </div>

        <div class="form-actions">

            <a href="DashboardStatsServlet">

                <button
                    type="button"
                    class="btn btn-secondary">

                    Cancel

                </button>

            </a>

            <button
                type="submit"
                class="btn btn-primary">

                Register Visitor

            </button>

        </div>

    </form>

</div>

<footer class="footer">
    Visitor Management System © 2026
</footer>

</body>
</html>