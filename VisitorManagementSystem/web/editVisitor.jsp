<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Object visitorId = request.getAttribute("id");

    if (visitorId == null) {
        response.sendRedirect("ViewVisitorServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Visitor - Visitor Management System</title>

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

        <a href="ViewVisitorServlet">
            <button type="button" class="btn btn-secondary">
                Back to Visitors
            </button>
        </a>

        <a href="LogoutServlet">
            <button type="button" class="btn btn-secondary">
                Logout
            </button>
        </a>

    </div>

</nav>


<div class="dashboard">

    <div class="page-header">

        <h1>Edit Visitor</h1>

        <p>
            Update the registered visitor's information.
        </p>

    </div>


    <div class="form-card edit-form-card">

        <div class="edit-header">

            <div class="edit-icon">
                ✏️
            </div>

            <div>

                <h2>
                    Visitor Information
                </h2>

                <p>
                    Registration ID:
                    <strong>#<%= visitorId %></strong>
                </p>

            </div>

        </div>


        <form action="UpdateVisitorServlet"
              method="post">

            <input
                type="hidden"
                name="id"
                value="<%= visitorId %>">


            <div class="form-grid">


                <!-- Full Name -->

                <div class="form-group">

                    <label for="name">
                        Full Name *
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        class="form-control"
                        value="<%= request.getAttribute("name") != null
                                ? request.getAttribute("name")
                                : "" %>"
                        placeholder="Enter visitor's full name"
                        required>

                </div>


                <!-- Mobile -->

                <div class="form-group">

                    <label for="mobile">
                        Mobile Number *
                    </label>

                    <input
                        type="tel"
                        id="mobile"
                        name="mobile"
                        class="form-control"
                        value="<%= request.getAttribute("mobile") != null
                                ? request.getAttribute("mobile")
                                : "" %>"
                        placeholder="Enter mobile number"
                        required>

                </div>


                <!-- Email -->

                <div class="form-group">

                    <label for="email">
                        Email
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-control"
                        value="<%= request.getAttribute("email") != null
                                ? request.getAttribute("email")
                                : "" %>"
                        placeholder="Enter email address">

                </div>


                <!-- Person To Meet -->

                <div class="form-group">

                    <label for="personToMeet">
                        Person to Meet *
                    </label>

                    <input
                        type="text"
                        id="personToMeet"
                        name="person_to_meet"
                        class="form-control"
                        value="<%= request.getAttribute("personToMeet") != null
                                ? request.getAttribute("personToMeet")
                                : "" %>"
                        placeholder="Employee you want to meet"
                        required>

                </div>


                <!-- Department -->

                <div class="form-group">

                    <label for="department">
                        Department
                    </label>

                    <select
                        id="department"
                        name="department"
                        class="form-control">

                        <option value="">
                            Select Department
                        </option>

                        <option value="Human Resources"
                            <%= "Human Resources".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            Human Resources
                        </option>

                        <option value="Finance"
                            <%= "Finance".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            Finance
                        </option>

                        <option value="IT"
                            <%= "IT".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            IT
                        </option>

                        <option value="Marketing"
                            <%= "Marketing".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            Marketing
                        </option>

                        <option value="Administration"
                            <%= "Administration".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            Administration
                        </option>

                        <option value="Management"
                            <%= "Management".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            Management
                        </option>

                        <option value="Other"
                            <%= "Other".equals(
                                request.getAttribute("department"))
                                ? "selected" : "" %>>
                            Other
                        </option>

                    </select>

                </div>


                <!-- Address -->

                <div class="form-group">

                    <label for="address">
                        Address
                    </label>

                    <input
                        type="text"
                        id="address"
                        name="address"
                        class="form-control"
                        value="<%= request.getAttribute("address") != null
                                ? request.getAttribute("address")
                                : "" %>"
                        placeholder="Enter visitor's address">

                </div>


                <!-- Purpose -->

                <div class="form-group form-full">

                    <label for="purpose">
                        Purpose of Visit *
                    </label>

                    <textarea
                        id="purpose"
                        name="purpose"
                        class="form-control"
                        placeholder="Enter purpose of visit"
                        required><%= request.getAttribute("purpose") != null
                                ? request.getAttribute("purpose")
                                : "" %></textarea>

                </div>

            </div>


            <div class="form-actions">

                <a href="ViewVisitorServlet">

                    <button
                        type="button"
                        class="btn btn-secondary">

                        Cancel

                    </button>

                </a>


                <button
                    type="submit"
                    class="btn btn-primary">

                    💾 Save Changes

                </button>

            </div>

        </form>

    </div>

</div>


<footer class="footer">

    Visitor Management System © 2026

</footer>


</body>

</html>