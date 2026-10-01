<%--
    Document   : searchVisitor
    Created on : 27 Aug, 2026, 7:46:38 AM
    Author     : shravani soundalakar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.visitor.Visitor"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Visitor visitor =
            (Visitor) request.getAttribute("visitor");

    String searchedMobile =
            request.getParameter("mobile");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Search Visitor - Visitor Management System</title>

    <link rel="stylesheet"
          href="css/style.css">

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

        <h1>Search Visitor</h1>

        <p>
            Find visitor records using their mobile number.
        </p>

    </div>


    <!-- SEARCH FORM -->

    <div class="content-card">

        <h2>
            Search Visitor Record
        </h2>

        <p class="form-description">
            Enter the registered mobile number to view the visitor's details.
        </p>


        <form action="SearchVisitorServlet"
              method="get">


            <div class="search-box">

                <input
                    type="text"
                    name="mobile"
                    class="form-control"
                    placeholder="Enter mobile number"
                    value="<%= searchedMobile != null
                            ? searchedMobile : "" %>"
                    required>


                <button
                    type="submit"
                    class="btn btn-primary">

                    🔍 Search

                </button>

            </div>

        </form>

    </div>


    <!-- SEARCH RESULT -->

    <%

        if (searchedMobile != null) {

            if (visitor != null) {


                String status =
                        visitor.getStatus();

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


    <div class="content-card">


        <!-- RESULT HEADER -->

        <div class="result-header">

            <div>

                <h2>
                    Visitor Details
                </h2>

                <p>
                    Registration ID #<%= visitor.getId() %>
                </p>

            </div>


            <span class="status-badge <%= statusClass %>">

                <%= status.replace("_", " ") %>

            </span>

        </div>


        <!-- DETAILS -->

        <div class="visitor-details">


            <div class="detail-item">

                <span class="detail-label">
                    Visitor ID
                </span>

                <strong>
                    #<%= visitor.getId() %>
                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Full Name
                </span>

                <strong>
                    <%= visitor.getName() %>
                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Mobile Number
                </span>

                <strong>
                    <%= visitor.getMobile() %>
                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Email
                </span>

                <strong>

                    <%= visitor.getEmail() != null
                        ? visitor.getEmail()
                        : "-" %>

                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Person To Meet
                </span>

                <strong>
                    <%= visitor.getPersonToMeet() != null
                        ? visitor.getPersonToMeet()
                        : "-" %>
                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Department
                </span>

                <strong>

                    <%= visitor.getDepartment() != null
                        ? visitor.getDepartment()
                        : "-" %>

                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Purpose of Visit
                </span>

                <strong>

                    <%= visitor.getPurpose() != null
                        ? visitor.getPurpose()
                        : "-" %>

                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Address
                </span>

                <strong>

                    <%= visitor.getAddress() != null
                        ? visitor.getAddress()
                        : "-" %>

                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Check-In Time
                </span>

                <strong>

                    <%= visitor.getCheckIn() != null
                        ? visitor.getCheckIn()
                        : "-" %>

                </strong>

            </div>


            <div class="detail-item">

                <span class="detail-label">
                    Check-Out Time
                </span>

                <strong>

                    <%= visitor.getCheckOut() != null
                        ? visitor.getCheckOut()
                        : "-" %>

                </strong>

            </div>


        </div>


        <!-- ACTIONS -->

        <div class="form-actions">


            <%

                if ("CHECKED_IN"
                        .equalsIgnoreCase(status)) {

            %>


            <a href="CheckOutServlet?id=<%= visitor.getId() %>">

                <button
                    type="button"
                    class="btn btn-checkout">

                    🏁 Check Out Visitor

                </button>

            </a>


            <%

                }

            %>


            <a href="EditVisitorServlet?id=<%= visitor.getId() %>">

                <button
                    type="button"
                    class="btn btn-small">

                    ✏️ Edit Visitor

                </button>

            </a>


            <a href="SearchVisitorServlet?mobile=<%= visitor.getMobile() %>">

                <button
                    type="button"
                    class="btn btn-secondary">

                    🔄 Refresh

                </button>

            </a>


        </div>


    </div>


    <%

            } else {

    %>


    <!-- NO RESULT -->

    <div class="alert alert-error">

        <strong>
            No visitor found.
        </strong>

        <br>

        No visitor record was found with mobile number:

        <strong>
            <%= searchedMobile %>
        </strong>

        <br><br>

        Please check the mobile number and try again.

    </div>


    <%

            }

        }

    %>


</div>


<!-- FOOTER -->

<footer class="footer">

    Visitor Management System © 2026

</footer>


</body>

</html>