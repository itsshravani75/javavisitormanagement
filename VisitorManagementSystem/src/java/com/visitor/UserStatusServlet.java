package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserStatusServlet")
public class UserStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String visitorCode =
                request.getParameter("visitorCode");

        // Check whether Visitor Code was entered
        if (visitorCode == null ||
            visitorCode.trim().isEmpty()) {

            response.sendRedirect("checkStatus.jsp");
            return;
        }

        visitorCode = visitorCode.trim();

        String sql =
                "SELECT ID, NAME, MOBILE, EMAIL, "
                + "PERSON_TO_MEET, DEPARTMENT, PURPOSE, "
                + "REGISTRATION_TIME, CHECK_IN, CHECK_OUT, "
                + "STATUS, REQUEST_STATUS, VISITOR_CODE "
                + "FROM VISITORS "
                + "WHERE VISITOR_CODE = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, visitorCode);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    // Store visitor information in request
                    request.setAttribute(
                            "id",
                            rs.getInt("ID")
                    );

                    request.setAttribute(
                            "name",
                            rs.getString("NAME")
                    );

                    request.setAttribute(
                            "mobile",
                            rs.getString("MOBILE")
                    );

                    request.setAttribute(
                            "email",
                            rs.getString("EMAIL")
                    );

                    request.setAttribute(
                            "personToMeet",
                            rs.getString("PERSON_TO_MEET")
                    );

                    request.setAttribute(
                            "department",
                            rs.getString("DEPARTMENT")
                    );

                    request.setAttribute(
                            "purpose",
                            rs.getString("PURPOSE")
                    );

                    request.setAttribute(
                            "registrationTime",
                            rs.getTimestamp("REGISTRATION_TIME")
                    );

                    request.setAttribute(
                            "checkIn",
                            rs.getTimestamp("CHECK_IN")
                    );

                    request.setAttribute(
                            "checkOut",
                            rs.getTimestamp("CHECK_OUT")
                    );

                    request.setAttribute(
                            "status",
                            rs.getString("STATUS")
                    );

                    request.setAttribute(
                            "requestStatus",
                            rs.getString("REQUEST_STATUS")
                    );

                    request.setAttribute(
                            "visitorCode",
                            rs.getString("VISITOR_CODE")
                    );


                    // Open result page
                    request.getRequestDispatcher(
                            "statusResult.jsp"
                    ).forward(request, response);

                } else {

                    // Visitor code not found
                    request.setAttribute(
                            "errorMessage",
                            "No visitor registration found with this Visitor Code."
                    );

                    request.getRequestDispatcher(
                            "statusResult.jsp"
                    ).forward(request, response);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to connect to the database. Please try again."
            );

            request.getRequestDispatcher(
                    "statusResult.jsp"
            ).forward(request, response);
        }
    }
}