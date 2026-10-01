<%--
    Document   : viewVisitors
    Created on : 26 Aug, 2026, 7:12:12 PM
    Author     : shravani soundalakar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.visitor.Visitor"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Visitor> visitorList =
            (List<Visitor>) request.getAttribute("visitorList");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Visitor Records - Visitor Management System</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<!-- NAVIGATION -->

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


<!-- MAIN CONTENT -->

<div class="dashboard">

    <div class="page-header">

        <h1>Visitor Records</h1>

        <p>
            View and manage all registered visitors.
        </p>

    </div>


    <div class="content-card">


        <!-- TABLE HEADER -->

        <div class="visitor-list-header">

            <div>

                <h2>
                    All Visitors
                </h2>

                <p>
                    Complete visitor registration and visit information.
                </p>

            </div>

            <div>

                <a href="addVisitor.jsp">

                    <button class="btn btn-primary">
                        + Add Visitor
                    </button>

                </a>

            </div>

        </div>


        <!-- TABLE -->

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

                        <th>Check In</th>

                        <th>Check Out</th>

                        <th>Status</th>

                        <th>Actions</th>

                    </tr>

                </thead>


                <tbody>

                <%

                    if (visitorList != null
                            && !visitorList.isEmpty()) {

                        for (Visitor v : visitorList) {

                            String status =
                                    v.getStatus();

                            if (status == null ||
                                status.trim().isEmpty()) {

                                status = "PENDING";

                            }

                            String statusClass =
                                    "status-pending";

                            if ("APPROVED".equalsIgnoreCase(status)) {

                                statusClass =
                                        "status-approved";

                            }
                            else if ("REJECTED".equalsIgnoreCase(status)) {

                                statusClass =
                                        "status-rejected";

                            }
                            else if ("CHECKED_IN".equalsIgnoreCase(status)) {

                                statusClass =
                                        "status-checked-in";

                            }
                            else if ("CHECKED_OUT".equalsIgnoreCase(status)) {

                                statusClass =
                                        "status-checked-out";

                            }

                %>


                    <tr>

                        <!-- ID -->

                        <td>

                            <span class="visitor-id">
                                #<%= v.getId() %>
                            </span>

                        </td>


                        <!-- NAME -->

                        <td>

                            <div class="visitor-name">

                                <strong>
                                    <%= v.getName() %>
                                </strong>

                            </div>

                        </td>


                        <!-- MOBILE -->

                        <td>

                            <%= v.getMobile() != null
                                ? v.getMobile()
                                : "-" %>

                        </td>


                        <!-- PERSON TO MEET -->

                        <td>

                            <%= v.getPersonToMeet() != null
                                ? v.getPersonToMeet()
                                : "-" %>

                        </td>


                        <!-- DEPARTMENT -->

                        <td>

                            <%= v.getDepartment() != null
                                ? v.getDepartment()
                                : "-" %>

                        </td>


                        <!-- PURPOSE -->

                        <td>

                            <span class="purpose-text">

                                <%= v.getPurpose() != null
                                    ? v.getPurpose()
                                    : "-" %>

                            </span>

                        </td>


                        <!-- CHECK IN -->

                        <td>

                            <%= v.getCheckIn() != null
                                ? v.getCheckIn()
                                : "-" %>

                        </td>


                        <!-- CHECK OUT -->

                        <td>

                            <%= v.getCheckOut() != null
                                ? v.getCheckOut()
                                : "-" %>

                        </td>


                        <!-- STATUS -->

                        <td>

                            <span class="status-badge <%= statusClass %>">

                                <%= status.replace("_", " ") %>

                            </span>

                        </td>


                        <!-- ACTIONS -->

                        <td>

                            <div class="table-actions">


                                <!-- EDIT -->

                                <a href="EditVisitorServlet?id=<%= v.getId() %>">

                                    <button
                                        type="button"
                                        class="btn btn-small">

                                        Edit

                                    </button>

                                </a>


                                <%

                                    if ("CHECKED_IN"
                                            .equalsIgnoreCase(status)) {

                                %>


                                <!-- CHECK OUT -->

                                <a href="CheckOutServlet?id=<%= v.getId() %>">

                                    <button
                                        type="button"
                                        class="btn btn-checkout">

                                        Check Out

                                    </button>

                                </a>


                                <%

                                    }

                                %>


                                <!-- DELETE -->

                                <a
                                    href="DeleteVisitorServlet?id=<%= v.getId() %>"
                                    onclick="return confirm('Are you sure you want to delete this visitor?');">

                                    <button
                                        type="button"
                                        class="btn btn-delete">

                                        Delete

                                    </button>

                                </a>


                            </div>

                        </td>

                    </tr>


                <%

                        }

                    } else {

                %>


                    <tr>

                        <td
                            colspan="10"
                            class="no-data">

                            <div class="empty-state">

                                <div class="empty-icon">
                                    👥
                                </div>

                                <h3>
                                    No Visitor Records
                                </h3>

                                <p>
                                    No visitors have been registered yet.
                                </p>

                                <a href="addVisitor.jsp">

                                    <button class="btn btn-primary">
                                        + Register First Visitor
                                    </button>

                                </a>

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


<!-- FOOTER -->

<footer class="footer">

    Visitor Management System © 2026

</footer>


</body>

</html>