<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Status</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<nav class="navbar">

    <div class="logo">
        <div class="logo-icon">🏢</div>
        <h2>Visitor Management</h2>
    </div>

    <div class="nav-user">
        <a href="userHome.jsp">
            <button class="btn btn-secondary">Back</button>
        </a>
    </div>

</nav>


<div class="status-container">

    <%
        String errorMessage =
                (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <!-- ERROR -->
        <div class="status-card">

            <div class="login-logo">⚠️</div>

            <h1>Registration Not Found</h1>

            <p class="subtitle">
                <%= errorMessage %>
            </p>

            <br>

            <a href="checkStatus.jsp">
                <button class="btn btn-primary">
                    Try Again
                </button>
            </a>

            <a href="userHome.jsp">
                <button class="btn btn-secondary">
                    Back to Visitor Portal
                </button>
            </a>

        </div>

    <%
        } else {

            String status =
                    (String) request.getAttribute("status");

            String requestStatus =
                    (String) request.getAttribute("requestStatus");

            String displayStatus = status;

            if (displayStatus == null || displayStatus.trim().isEmpty()) {
                displayStatus = requestStatus;
            }

            String statusClass = "status-pending";

            if ("APPROVED".equalsIgnoreCase(displayStatus)) {
                statusClass = "status-approved";
            }
            else if ("REJECTED".equalsIgnoreCase(displayStatus)) {
                statusClass = "status-rejected";
            }
            else if ("CHECKED_IN".equalsIgnoreCase(displayStatus)) {
                statusClass = "status-checked-in";
            }
            else if ("CHECKED_OUT".equalsIgnoreCase(displayStatus)) {
                statusClass = "status-checked-out";
            }
    %>

        <!-- SUCCESS -->
        <div class="status-card status-result-card">

            <div class="success-icon">✓</div>

            <h1>Registration Status</h1>

            <p class="subtitle">
                Here are the details of your visitor registration.
            </p>


            <!-- STATUS -->
            <div class="visitor-status-box">

                <p>Current Status</p>

                <span class="status-badge <%= statusClass %>">
                    <%= displayStatus %>
                </span>

            </div>


            <!-- VISITOR CODE -->
            <div class="visitor-code-box">

                <p>Your Visitor Code</p>

                <h2>
                    <%= request.getAttribute("visitorCode") %>
                </h2>

            </div>


            <!-- VISITOR DETAILS -->
            <div class="details-section">

                <h2>Visitor Details</h2>

                <div class="details-grid">

                    <div class="detail-item">
                        <span class="detail-label">
                            Full Name
                        </span>

                        <span class="detail-value">
                            <%= request.getAttribute("name") %>
                        </span>
                    </div>


                    <div class="detail-item">
                        <span class="detail-label">
                            Mobile Number
                        </span>

                        <span class="detail-value">
                            <%= request.getAttribute("mobile") %>
                        </span>
                    </div>


                    <div class="detail-item">
                        <span class="detail-label">
                            Email
                        </span>

                        <span class="detail-value">
                            <%= request.getAttribute("email") != null
                                ? request.getAttribute("email")
                                : "Not provided" %>
                        </span>
                    </div>


                    <div class="detail-item">
                        <span class="detail-label">
                            Person to Meet
                        </span>

                        <span class="detail-value">
                            <%= request.getAttribute("personToMeet") %>
                        </span>
                    </div>


                    <div class="detail-item">
                        <span class="detail-label">
                            Department
                        </span>

                        <span class="detail-value">
                            <%= request.getAttribute("department") != null
                                ? request.getAttribute("department")
                                : "Not specified" %>
                        </span>
                    </div>


                    <div class="detail-item">
                        <span class="detail-label">
                            Purpose
                        </span>

                        <span class="detail-value">
                            <%= request.getAttribute("purpose") %>
                        </span>
                    </div>

                </div>

            </div>


            <!-- VISIT TIMELINE -->
            <div class="details-section">

                <h2>Visit Timeline</h2>

                <div class="timeline">

                    <div class="timeline-item">

                        <div class="timeline-icon">
                            📝
                        </div>

                        <div>
                            <strong>Registration Submitted</strong>

                            <p>
                                <%= request.getAttribute("registrationTime") %>
                            </p>
                        </div>

                    </div>


                    <div class="timeline-item">

                        <div class="timeline-icon">
                            🚪
                        </div>

                        <div>
                            <strong>Check-In</strong>

                            <p>
                                <%
                                    Object checkIn =
                                            request.getAttribute("checkIn");

                                    if (checkIn != null) {
                                %>

                                    <%= checkIn %>

                                <%
                                    } else {
                                %>

                                    Not checked in yet

                                <%
                                    }
                                %>
                            </p>

                        </div>

                    </div>


                    <div class="timeline-item">

                        <div class="timeline-icon">
                            🏁
                        </div>

                        <div>
                            <strong>Check-Out</strong>

                            <p>
                                <%
                                    Object checkOut =
                                            request.getAttribute("checkOut");

                                    if (checkOut != null) {
                                %>

                                    <%= checkOut %>

                                <%
                                    } else {
                                %>

                                    Not checked out yet

                                <%
                                    }
                                %>
                            </p>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ACTIONS -->
            <div class="form-actions">

                <a href="checkStatus.jsp">
                    <button type="button"
                            class="btn btn-primary">
                        Check Another Code
                    </button>
                </a>

                <a href="userHome.jsp">
                    <button type="button"
                            class="btn btn-secondary">
                        Visitor Portal
                    </button>
                </a>

            </div>

        </div>

    <%
        }
    %>

</div>


<footer class="footer">
    Visitor Management System © 2026
</footer>

</body>
</html>