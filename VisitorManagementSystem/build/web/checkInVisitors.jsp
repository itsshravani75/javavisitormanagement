<%-- 
    Document   : checkInVvisitors
    Created on : 31 Aug, 2026, 11:03:34 PM
    Author     : shravani soundalakar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.visitor.DBConnection"%>

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

    <title>Visitor Check-In</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body class="checkin-page">


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="logo">

        <div class="logo-icon">
            🏢
        </div>

        <h2>Visitor Management</h2>

    </div>


    <div class="nav-user">

        <a href="dashboard.jsp"
           class="nav-button">

            Dashboard

        </a>

        <a href="LogoutServlet"
           class="nav-button logout-button">

            Logout

        </a>

    </div>

</nav>


<!-- ================= MAIN CONTENT ================= -->

<div class="checkin-container">


    <!-- HEADER -->

    <div class="checkin-header">

        <h1>
            Approved Visitors
        </h1>

        <p>
            Manage visitors who have been approved
            and are ready to check in.
        </p>

    </div>


    <!-- TABLE CARD -->

    <div class="checkin-card">

        <div class="checkin-table-wrapper">

            <table class="checkin-table">

                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Visitor</th>

                        <th>Mobile</th>

                        <th>Person to Meet</th>

                        <th>Department</th>

                        <th>Purpose</th>

                        <th>Status</th>

                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>

<%

    String sql =
        "SELECT * FROM VISITORS "
        + "WHERE REQUEST_STATUS = 'APPROVED' "
        + "AND CHECK_IN IS NULL "
        + "ORDER BY ID DESC";


    try {

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql);

        ResultSet rs =
                ps.executeQuery();

        boolean found = false;


        while (rs.next()) {

            found = true;

%>

                    <tr>


                        <!-- ID -->

                        <td class="visitor-id">

                            #<%= rs.getInt("ID") %>

                        </td>


                        <!-- NAME -->

                        <td class="visitor-name">

                            <strong>
                                <%= rs.getString("NAME") %>
                            </strong>

                        </td>


                        <!-- MOBILE -->

                        <td class="visitor-mobile">

                            <%= rs.getString("MOBILE") %>

                        </td>


                        <!-- PERSON TO MEET -->

                        <td>

                            <%= rs.getString("PERSON_TO_MEET") %>

                        </td>


                        <!-- DEPARTMENT -->

                        <td>

                            <span class="department-badge">

                                <%= rs.getString("DEPARTMENT") %>

                            </span>

                        </td>


                        <!-- PURPOSE -->

                        <td class="purpose-cell">

                            <%= rs.getString("PURPOSE") %>

                        </td>


                        <!-- STATUS -->

                        <td>

                            <span class="status-badge status-approved">

                                <span class="status-dot"></span>

                                APPROVED

                            </span>

                        </td>


                        <!-- ACTION -->

                        <td>

                            <a
                                href="CheckInServlet?id=<%= rs.getInt("ID") %>"
                                class="action-btn checkin-btn">

                                ✓ Check In

                            </a>

                        </td>


                    </tr>


<%

        }


        if (!found) {

%>

                    <tr>

                        <td colspan="8">

                            <div class="empty-pending">

                                <div class="empty-icon">
                                    👥
                                </div>

                                <h3>
                                    No Visitors Ready for Check-In
                                </h3>

                                <p>
                                    Approved visitors will appear
                                    here when they are ready to check in.
                                </p>

                            </div>

                        </td>

                    </tr>

<%

        }


        rs.close();

        ps.close();

        con.close();


    } catch (Exception e) {

        e.printStackTrace();

%>

                    <tr>

                        <td colspan="8">

                            <div class="empty-pending error-state">

                                <div class="empty-icon">
                                    ⚠️
                                </div>

                                <h3>
                                    Unable to Load Visitors
                                </h3>

                                <p>
                                    Please check the database connection
                                    and try again.
                                </p>

                            </div>

                        </td>

                    </tr>

<%

    }

%>

                </tbody>

            </table>

        </div>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer class="pending-footer">

    Visitor Management System © 2026

</footer>


</body>

</html>
