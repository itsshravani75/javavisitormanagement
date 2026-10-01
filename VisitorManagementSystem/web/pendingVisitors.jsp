
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <title>Pending Requests - Visitor Management System</title>

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

        <h1>Pending Visitor Requests</h1>

        <p>
            Review visitor registrations and approve or reject requests.
        </p>

    </div>


    <div class="content-card">

        <div class="visitor-list-header">

            <div>

                <h2>
                    Requests Awaiting Approval
                </h2>

                <p>
                    Review the visitor's information before making a decision.
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
                        <th>Purpose</th>
                        <th>Registration Time</th>
                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>

                <%
                    boolean hasPendingVisitors = false;

                    String sql =
                            "SELECT ID, NAME, MOBILE, PERSON_TO_MEET, "
                            + "DEPARTMENT, PURPOSE, REGISTRATION_TIME "
                            + "FROM VISITORS "
                            + "WHERE REQUEST_STATUS = 'PENDING' "
                            + "ORDER BY ID DESC";

                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {

                        con = DBConnection.getConnection();
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();

                        while (rs.next()) {

                            hasPendingVisitors = true;
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

                            <span class="purpose-text">

                                <%= rs.getString("PURPOSE") != null
                                    ? rs.getString("PURPOSE")
                                    : "-" %>

                            </span>

                        </td>


                        <td>

                            <%= rs.getTimestamp("REGISTRATION_TIME") != null
                                ? rs.getTimestamp("REGISTRATION_TIME")
                                : "-" %>

                        </td>


                        <td>

                            <div class="table-actions">

                                <a
                                    href="ApproveVisitorServlet?id=<%= rs.getInt("ID") %>"
                                    onclick="return confirm('Approve this visitor request?');">

                                    <button
                                        type="button"
                                        class="btn btn-approve">

                                        ✓ Approve

                                    </button>

                                </a>


                                <a
                                    href="RejectVisitorServlet?id=<%= rs.getInt("ID") %>"
                                    onclick="return confirm('Reject this visitor request?');">

                                    <button
                                        type="button"
                                        class="btn btn-delete">

                                        ✕ Reject

                                    </button>

                                </a>

                            </div>

                        </td>

                    </tr>

                <%
                        }

                %>

                <%
                    } catch (SQLException e) {

                        e.printStackTrace();
                %>

                    <tr>

                        <td
                            colspan="8"
                            class="no-data">

                            Unable to load pending requests.

                        </td>

                    </tr>

                <%
                    } finally {

                        try {

                            if (rs != null) {
                                rs.close();
                            }

                            if (ps != null) {
                                ps.close();
                            }

                            if (con != null) {
                                con.close();
                            }

                        } catch (SQLException e) {

                            e.printStackTrace();

                        }
                    }

                    if (!hasPendingVisitors) {
                %>

                    <tr>

                        <td
                            colspan="8"
                            class="no-data">

                            <div class="empty-state">

                                <div class="empty-icon">
                                    ✓
                                </div>

                                <h3>
                                    No Pending Requests
                                </h3>

                                <p>
                                    There are currently no visitor requests waiting for approval.
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

