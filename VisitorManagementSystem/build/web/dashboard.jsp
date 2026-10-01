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
    <title>Admin Dashboard - Visitor Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<nav class="navbar">

    <div class="logo">
        <div class="logo-icon">🏢</div>
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


<div class="dashboard">

    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>Admin Dashboard</h1>

        <p>
            Monitor and manage office visitor activities.
        </p>

    </div>


    <!-- STATISTICS -->

    <div class="stats-grid">

        <div class="stat-card">

            <div class="stat-icon">
                👥
            </div>

            <div class="stat-info">

                <h3>
                    <%= request.getAttribute("totalVisitors") != null
                        ? request.getAttribute("totalVisitors")
                        : 0 %>
                </h3>

                <p>Total Visitors</p>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                ⏳
            </div>

            <div class="stat-info">

                <h3>
                    <%= request.getAttribute("pendingVisitors") != null
                        ? request.getAttribute("pendingVisitors")
                        : 0 %>
                </h3>

                <p>Pending Requests</p>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                ✅
            </div>

            <div class="stat-info">

                <h3>
                    <%= request.getAttribute("approvedVisitors") != null
                        ? request.getAttribute("approvedVisitors")
                        : 0 %>
                </h3>

                <p>Approved Visitors</p>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                🚪
            </div>

            <div class="stat-info">

                <h3>
                    <%= request.getAttribute("checkedInVisitors") != null
                        ? request.getAttribute("checkedInVisitors")
                        : 0 %>
                </h3>

                <p>Currently Checked-In</p>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                🏁
            </div>

            <div class="stat-info">

                <h3>
                    <%= request.getAttribute("completedVisits") != null
                        ? request.getAttribute("completedVisits")
                        : 0 %>
                </h3>

                <p>Completed Visits</p>

            </div>

        </div>

    </div>


    <!-- MANAGEMENT CARDS -->

    <div class="dashboard-cards">


        <a href="addVisitor.jsp">

            <div class="dashboard-card">

                <div class="card-icon">
                    ➕
                </div>

                <h3>
                    Add Visitor
                </h3>

                <p>
                    Register a new visitor manually.
                </p>

            </div>

        </a>


        <a href="ViewVisitorServlet">

            <div class="dashboard-card">

                <div class="card-icon">
                    👥
                </div>

                <h3>
                    View Visitors
                </h3>

                <p>
                    View all visitor records.
                </p>

            </div>

        </a>


        <a href="searchVisitor.jsp">

            <div class="dashboard-card">

                <div class="card-icon">
                    🔍
                </div>

                <h3>
                    Search Visitor
                </h3>

                <p>
                    Search visitor records quickly.
                </p>

            </div>

        </a>


        <a href="pendingVisitors.jsp">

            <div class="dashboard-card">

                <div class="card-icon">
                    📋
                </div>

                <h3>
                    Pending Requests
                </h3>

                <p>
                    Review and manage visitor requests.
                </p>

            </div>

        </a>


        <a href="checkInVisitors.jsp">

            <div class="dashboard-card">

                <div class="card-icon">
                    🚪
                </div>

                <h3>
                    Visitor Check-In
                </h3>

                <p>
                    Check in approved visitors.
                </p>

            </div>

        </a>


        <a href="checkOutVisitors.jsp">

            <div class="dashboard-card">

                <div class="card-icon">
                    🏁
                </div>

                <h3>
                    Visitor Check-Out
                </h3>

                <p>
                    Record visitor check-outs.
                </p>

            </div>

        </a>

    </div>


    <!-- QUICK ACTIONS -->

    <div class="content-card">

        <h2>
            Quick Actions
        </h2>

        <div class="action-buttons">

            <a href="addVisitor.jsp">

                <button class="btn btn-primary">
                    + Register Visitor
                </button>

            </a>


            <a href="pendingVisitors.jsp">

                <button class="btn btn-secondary">
                    Review Requests
                </button>

            </a>


            <a href="ViewVisitorServlet">

                <button class="btn btn-secondary">
                    View Visitor List
                </button>

            </a>

        </div>

    </div>

</div>


<footer class="footer">

    Visitor Management System © 2026

</footer>


</body>
</html>