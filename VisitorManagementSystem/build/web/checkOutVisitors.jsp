<%-- 
    Document   : checkOutVisitors
    Created on : 1 Sep, 2026, 7:27:29 PM
    Author     : shravani soundalakar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
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

    <title>Visitor Check-Out - Visitor Management System</title>

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

        <a href="DashboardStatsServlet">
            <button class="btn btn-secondary">
                Dashboard
            </button>
        </a>

        <a href="LogoutServlet">
            <button class="btn btn-secondary">
                Logout
            </button>
        </a>

    </div>

</nav>


<div class="dashboard">

    <div class="page-header">

        <h1>Visitor Check-Out</h1>

        <p>
            Record the departure of visitors currently inside the office.
        </p>

    </div>


    <div class="content-card">

        <div class="visitor-list-header">

            <div>

                <h2>
                    Currently Checked-In Visitors
                </h2>

                <p>
                    Visitors shown below are currently inside the office.
                </p>

            </div>

        </div>


        <div class="table-container">

            <table class="visitor-table">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Visitor</th>
                        <th>Mobile</th>
                        <th>Person To Meet</th>
                        <th>Department</th>
                        <th>Check-In Time</th>
                        <th>Status</th>
                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>

               <%
    boolean hasVisitors = false;

    String sql =
            "SELECT ID, NAME, MOBILE, PERSON_TO_MEET, "
            + "DEPARTMENT, CHECK_IN, STATUS "
            + "FROM VISITORS "
            + "WHERE STATUS = 'CHECKED_IN' "
            + "AND CHECK_OUT IS NULL "
            + "ORDER BY CHECK_IN DESC";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        con = DBConnection.getConnection();

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        while (rs.next()) {

            hasVisitors = true;
%>

                    <tr>

                        <td>

                            <span class="visitor-id">
                                #<%= rs.getInt("ID") %>
                            </span>

                        </td>


                        <td>

                            <div class="visitor-name">

                                <strong>
                                    <%= rs.getString("NAME") %>
                                </strong>

                            </div>

                        </td>


                        <td>

                            <%= rs.getString("MOBILE") != null
                                ? rs.getString("MOBILE")
                                : "-" %>

                        </td>


                        <td>

                            <%= rs.getString("PERSON_TO_MEET") != null
                                ? rs.getString("PERSON_TO_MEET")
                                : "-" %>

                        </td>


                        <td>

                            <%= rs.getString("DEPARTMENT") != null
                                ? rs.getString("DEPARTMENT")
                                : "-" %>

                        </td>


                        <td>

                            <%= rs.getTimestamp("CHECK_IN") != null
                                ? rs.getTimestamp("CHECK_IN")
                                : "-" %>

                        </td>


                        <td>

                            <span class="status-badge status-checked-in">
                                CHECKED IN
                            </span>

                        </td>


                        <td>

                            <div class="table-actions">

                                <a
                                    href="CheckOutServlet?id=<%= rs.getInt("ID") %>"
                                    onclick="return confirm('Record check-out for this visitor?');">

                                    <button
                                        type="button"
                                        class="btn btn-checkout">

                                        🏁 Check Out

                                    </button>

                                </a>

                            </div>

                        </td>

                    </tr>

                <%
        }

    } catch (SQLException e) {

        e.printStackTrace();
%>

                    <tr>

                        <td colspan="8" class="no-data">

                            Unable to load checked-in visitors.

                        </td>

                    </tr>

                <%
                    }

                    if (!hasVisitors) {
                %>

                    <tr>

                        <td colspan="8" class="no-data">

                            <div class="empty-state">

                                <div class="empty-icon">
                                    ✓
                                </div>

                                <h3>
                                    No Visitors Currently Checked In
                                </h3>

                                <p>
                                    There are no visitors currently inside the office.
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


<footer class="footer">

    Visitor Management System © 2026

</footer>

</body>

</html>