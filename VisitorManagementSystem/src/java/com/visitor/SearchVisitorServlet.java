package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchVisitorServlet")
public class SearchVisitorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String mobile =
                request.getParameter("mobile");


        // Validate mobile number
        if (mobile == null ||
            mobile.trim().isEmpty()) {

            response.sendRedirect("searchVisitor.jsp");
            return;
        }

        mobile = mobile.trim();


        Visitor visitor = null;


        String sql =
                "SELECT * FROM VISITORS "
                + "WHERE MOBILE = ? "
                + "ORDER BY ID DESC";


        try (
            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setString(1, mobile);


            try (ResultSet rs =
                    ps.executeQuery()) {


                if (rs.next()) {

                    visitor =
                            new Visitor();


                    // ID

                    visitor.setId(
                            rs.getInt("ID")
                    );


                    // Basic details

                    visitor.setName(
                            rs.getString("NAME")
                    );

                    visitor.setMobile(
                            rs.getString("MOBILE")
                    );

                    visitor.setEmail(
                            rs.getString("EMAIL")
                    );

                    visitor.setAddress(
                            rs.getString("ADDRESS")
                    );


                    // Visit details

                    visitor.setPersonToMeet(
                            rs.getString("PERSON_TO_MEET")
                    );

                    visitor.setDepartment(
                            rs.getString("DEPARTMENT")
                    );

                    visitor.setPurpose(
                            rs.getString("PURPOSE")
                    );


                    // Check-In

                    Timestamp checkIn =
                            rs.getTimestamp("CHECK_IN");


                    if (checkIn != null) {

                        visitor.setCheckIn(
                                checkIn.toString()
                        );

                    } else {

                        visitor.setCheckIn("-");

                    }


                    // Check-Out

                    Timestamp checkOut =
                            rs.getTimestamp("CHECK_OUT");


                    if (checkOut != null) {

                        visitor.setCheckOut(
                                checkOut.toString()
                        );

                    } else {

                        visitor.setCheckOut("-");

                    }


                    // Status

                    String status =
                            rs.getString("STATUS");


                    if (status == null ||
                        status.trim().isEmpty()) {

                        status = "PENDING";

                    }


                    visitor.setStatus(
                            status
                    );
                }
            }


            // Send visitor object to JSP

            request.setAttribute(
                    "visitor",
                    visitor
            );


            // Display search page with result

            request.getRequestDispatcher(
                    "searchVisitor.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "error.jsp"
            );
        }
    }
}