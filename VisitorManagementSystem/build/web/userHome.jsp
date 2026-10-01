<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Visitor Portal - Visitor Management System</title>

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

        <a href="index.jsp">
            <button class="btn btn-secondary">
                Home
            </button>
        </a>

        <a href="login.jsp">
            <button class="btn btn-secondary">
                Admin Login
            </button>
        </a>

    </div>

</nav>


<div class="visitor-portal">

    <!-- HERO SECTION -->

    <div class="portal-hero">

        <div class="portal-icon">
            👋
        </div>

        <h1>
            Welcome to the Visitor Portal
        </h1>

        <p>
            Register your visit, track your request,
            and complete your office visit with ease.
        </p>

    </div>


    <!-- MAIN ACTIONS -->

    <div class="portal-actions">

        <a href="visitorRegistration.jsp"
           class="portal-action-link">

            <div class="portal-action-card">

                <div class="portal-action-icon">
                    📝
                </div>

                <h2>
                    Register Your Visit
                </h2>

                <p>
                    Submit your visitor details and
                    request access to the office.
                </p>

                <span class="portal-arrow">
                    Get Started →
                </span>

            </div>

        </a>


        <a href="checkStatus.jsp"
           class="portal-action-link">

            <div class="portal-action-card">

                <div class="portal-action-icon">
                    🔎
                </div>

                <h2>
                    Check Registration Status
                </h2>

                <p>
                    Enter your Visitor Code to see
                    whether your request is pending,
                    approved, or rejected.
                </p>

                <span class="portal-arrow">
                    Check Status →
                </span>

            </div>

        </a>

    </div>


    <!-- HOW IT WORKS -->

    <div class="content-card portal-process">

        <div class="portal-section-title">

            <h2>
                How It Works
            </h2>

            <p>
                Follow these simple steps to complete your visit.
            </p>

        </div>


        <div class="process-grid">


            <div class="process-step">

                <div class="process-number">
                    1
                </div>

                <div class="process-icon">
                    📝
                </div>

                <h3>
                    Register
                </h3>

                <p>
                    Submit your personal details and
                    purpose of visit.
                </p>

            </div>


            <div class="process-step">

                <div class="process-number">
                    2
                </div>

                <div class="process-icon">
                    ⏳
                </div>

                <h3>
                    Wait for Approval
                </h3>

                <p>
                    Your request is reviewed by
                    the office administrator.
                </p>

            </div>


            <div class="process-step">

                <div class="process-number">
                    3
                </div>

                <div class="process-icon">
                    ✅
                </div>

                <h3>
                    Get Approved
                </h3>

                <p>
                    Check your Visitor Code to
                    view your registration status.
                </p>

            </div>


            <div class="process-step">

                <div class="process-number">
                    4
                </div>

                <div class="process-icon">
                    🚪
                </div>

                <h3>
                    Visit the Office
                </h3>

                <p>
                    Complete your check-in and
                    check-out at the reception.
                </p>

            </div>

        </div>

    </div>


    <!-- INFORMATION -->

    <div class="portal-info">

        <div class="portal-info-card">

            <div class="portal-info-icon">
                🔐
            </div>

            <div>

                <h3>
                    Keep Your Visitor Code Safe
                </h3>

                <p>
                    Your Visitor Code is used to
                    check the status of your registration.
                    Keep it available until your visit is completed.
                </p>

            </div>

        </div>


        <div class="portal-info-card">

            <div class="portal-info-icon">
                ℹ️
            </div>

            <div>

                <h3>
                    Need Assistance?
                </h3>

                <p>
                    Contact the office reception or
                    administration department if you
                    need help with your registration.
                </p>

            </div>

        </div>

    </div>

</div>


<footer class="footer">

    Visitor Management System © 2026

</footer>


</body>

</html>