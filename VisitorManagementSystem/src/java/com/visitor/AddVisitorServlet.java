package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddVisitorServlet")
public class AddVisitorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get data from the form
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String personToMeet = request.getParameter("person_to_meet");
        String department = request.getParameter("department");
        String purpose = request.getParameter("purpose");

        // Check required fields
        if (name == null || name.trim().isEmpty()
                || mobile == null || mobile.trim().isEmpty()
                || personToMeet == null || personToMeet.trim().isEmpty()) {

            request.setAttribute(
                "errorMessage",
                "Please fill in all required fields."
            );

            request.getRequestDispatcher("addVisitor.jsp")
                   .forward(request, response);

            return;
        }

        // Remove extra spaces
        name = name.trim();
        mobile = mobile.trim();
        personToMeet = personToMeet.trim();

        if (email != null) {
            email = email.trim();
        }

        if (address != null) {
            address = address.trim();
        }

        if (department != null) {
            department = department.trim();
        }

        if (purpose != null) {
            purpose = purpose.trim();
        }

        // Validate mobile number
        // Must be exactly 10 digits and start with 6, 7, 8 or 9
        if (!mobile.matches("[6-9][0-9]{9}")) {

            request.setAttribute(
                "errorMessage",
                "Please enter a valid 10-digit mobile number starting with 6, 7, 8 or 9."
            );

            request.getRequestDispatcher("addVisitor.jsp")
                   .forward(request, response);

            return;
        }

        // SQL query
        String sql =
            "INSERT INTO VISITORS "
            + "(NAME, MOBILE, EMAIL, ADDRESS, "
            + "PERSON_TO_MEET, DEPARTMENT, PURPOSE, "
            + "CHECK_IN, STATUS) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            // Set form values
            ps.setString(1, name);
            ps.setString(2, mobile);

            ps.setString(
                3,
                email != null && !email.isEmpty()
                    ? email
                    : null
            );

            ps.setString(
                4,
                address != null && !address.isEmpty()
                    ? address
                    : null
            );

            ps.setString(5, personToMeet);

            ps.setString(
                6,
                department != null && !department.isEmpty()
                    ? department
                    : null
            );

            ps.setString(
                7,
                purpose != null && !purpose.isEmpty()
                    ? purpose
                    : null
            );

            // Current date and time
            Timestamp currentTime =
                    Timestamp.valueOf(
                        LocalDateTime.now()
                    );

            ps.setTimestamp(8, currentTime);

            // Visitor is currently inside
            ps.setString(9, "IN");

            // Execute INSERT
            int rows = ps.executeUpdate();

            if (rows > 0) {

                response.sendRedirect(
                    "ViewVisitorServlet"
                );

            } else {

                request.setAttribute(
                    "errorMessage",
                    "Unable to register the visitor. Please try again."
                );

                request.getRequestDispatcher("addVisitor.jsp")
                       .forward(request, response);
            }

        } catch (Exception e) {


            request.setAttribute(
                "errorMessage",
                "Unable to register the visitor. Please try again."
            );

            request.getRequestDispatcher("addVisitor.jsp")
                   .forward(request, response);
        }
    }
}