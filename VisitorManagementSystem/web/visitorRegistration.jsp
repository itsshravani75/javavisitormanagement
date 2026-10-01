<%-- 
    Document   : visitorRegistration
    Created on : 27 Aug, 2026, 10:27:07 AM
    Author     : shravani soundalakar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Register Visit</title>

    <link rel="stylesheet"
          href="css/style.css">

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

        <a href="userHome.jsp">

            <button class="btn btn-secondary">
                Back
            </button>

        </a>

    </div>

</nav>


<div class="form-card">

    <h2>Register Your Visit</h2>

    <p class="form-description">

        Please provide your details and the purpose
        of your visit.

    </p>


    <%-- Display validation error from servlet --%>

    <%
        String errorMessage =
                (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="alert alert-error">

            <strong>Registration Error:</strong>

            <%= errorMessage %>

        </div>

    <%
        }
    %>


    <form action="UserRegistrationServlet"
          method="post">

        <div class="form-grid">


            <div class="form-group">

                <label>Full Name *</label>

                <input
                    type="text"
                    name="name"
                    class="form-control"
                    placeholder="Enter your full name"
                    required>

            </div>


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


            <div class="form-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                    placeholder="Enter email">

            </div>


            <div class="form-group">

                <label>Person to Meet *</label>

                <input
                    type="text"
                    name="person_to_meet"
                    class="form-control"
                    placeholder="Employee you want to meet"
                    required>

            </div>


            <div class="form-group">

                <label>Department</label>

                <select name="department"
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


            <div class="form-group">

                <label>Address</label>

                <input
                    type="text"
                    name="address"
                    class="form-control"
                    placeholder="Enter your address">

            </div>


            <div class="form-group form-full">

                <label>Purpose of Visit *</label>

                <textarea
                    name="purpose"
                    class="form-control"
                    placeholder="Why are you visiting?"
                    required></textarea>

            </div>

        </div>


        <div class="form-actions">

            <a href="userHome.jsp">

                <button
                    type="button"
                    class="btn btn-secondary">

                    Cancel

                </button>

            </a>


            <button
                type="submit"
                class="btn btn-primary">

                Submit Registration

            </button>

        </div>

    </form>

</div>


<footer class="footer">

    Visitor Management System © 2026

</footer>

</body>

</html>