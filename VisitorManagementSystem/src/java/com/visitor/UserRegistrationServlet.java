package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String personToMeet = request.getParameter("person_to_meet");
        String department = request.getParameter("department");
        String purpose = request.getParameter("purpose");


        // ==========================================
        // BASIC REQUIRED FIELD VALIDATION
        // ==========================================

        if (name == null || name.trim().isEmpty()
                || mobile == null || mobile.trim().isEmpty()
                || personToMeet == null || personToMeet.trim().isEmpty()
                || purpose == null || purpose.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please fill in all required fields."
            );

            request.getRequestDispatcher(
                    "visitorRegistration.jsp"
            ).forward(request, response);

            return;
        }


        // ==========================================
        // MOBILE NUMBER VALIDATION
        // ==========================================

        mobile = mobile.trim();

        if (!mobile.matches("[6-9][0-9]{9}")) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter a valid 10-digit mobile number starting with 6, 7, 8 or 9."
            );

            request.getRequestDispatcher(
                    "visitorRegistration.jsp"
            ).forward(request, response);

            return;
        }


        // ==========================================
        // GENERATE VISITOR CODE
        // ==========================================

        String visitorCode =
                "VIS" + (System.currentTimeMillis() % 1000000);


        // ==========================================
        // REGISTRATION TIME
        // ==========================================

        Timestamp registrationTime =
                Timestamp.valueOf(LocalDateTime.now());


        // ==========================================
        // INSERT QUERY
        // ==========================================

        String sql =
                "INSERT INTO VISITORS "
                + "(NAME, MOBILE, EMAIL, ADDRESS, "
                + "PERSON_TO_MEET, DEPARTMENT, PURPOSE, "
                + "REGISTRATION_TIME, CHECK_IN, CHECK_OUT, "
                + "STATUS, REQUEST_STATUS, VISITOR_CODE) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, "
                + "NULL, NULL, ?, ?, ?)";


        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, name.trim());

            ps.setString(2, mobile);

            ps.setString(
                    3,
                    email != null && !email.trim().isEmpty()
                    ? email.trim()
                    : null
            );

            ps.setString(
                    4,
                    address != null && !address.trim().isEmpty()
                    ? address.trim()
                    : null
            );

            ps.setString(
                    5,
                    personToMeet.trim()
            );

            ps.setString(
                    6,
                    department != null && !department.trim().isEmpty()
                    ? department.trim()
                    : null
            );

            ps.setString(
                    7,
                    purpose.trim()
            );

            ps.setTimestamp(
                    8,
                    registrationTime
            );

            ps.setString(
                    9,
                    "PENDING"
            );

            ps.setString(
                    10,
                    "PENDING"
            );

            ps.setString(
                    11,
                    visitorCode
            );


            int result =
                    ps.executeUpdate();


            if (result > 0) {

                response.sendRedirect(
                        "registrationSuccess.jsp?code="
                        + visitorCode
                );

            } else {

                request.setAttribute(
                        "errorMessage",
                        "Registration could not be completed. Please try again."
                );

                request.getRequestDispatcher(
                        "visitorRegistration.jsp"
                ).forward(request, response);
            }


        } catch (SQLException e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to save your registration. Please try again later."
            );

            request.getRequestDispatcher(
                    "visitorRegistration.jsp"
            ).forward(request, response);
        }
    }
}