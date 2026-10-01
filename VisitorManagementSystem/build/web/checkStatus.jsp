<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Check Registration Status</title>

    <link rel="stylesheet" href="css/style.css">

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="logo">

        <div class="logo-icon">
            🏢
        </div>

        <h2>
            Visitor Management
        </h2>

    </div>


    <div class="nav-user">

        <a href="userHome.jsp">

            <button class="btn btn-secondary">
                Back
            </button>

        </a>

    </div>

</nav>



<!-- ================= STATUS CONTAINER ================= -->

<div class="status-container">


    <div class="status-card">


        <div class="login-logo">
            🔎
        </div>


        <h1>
            Check Registration Status
        </h1>


        <p class="subtitle">
            Enter your Visitor Code to check the
            current status of your registration.
        </p>


        <!-- ================= FORM ================= -->

        <form action="UserStatusServlet"
              method="post">


            <div class="form-group">


                <label for="visitorCode">
                    Visitor Code
                </label>


                <input
                    type="text"
                    id="visitorCode"
                    name="visitorCode"
                    class="form-control"
                    placeholder="Example: VIS123456"
                    required>


            </div>


            <button
                type="submit"
                class="btn btn-primary btn-block">

                Check Status

            </button>


        </form>


        <br>


        <a href="userHome.jsp">

            <button
                type="button"
                class="btn btn-secondary btn-block">

                Back to Visitor Portal

            </button>

        </a>


    </div>

</div>



<!-- ================= FOOTER ================= -->

<footer class="footer">

    Visitor Management System © 2026

</footer>


</body>

</html>