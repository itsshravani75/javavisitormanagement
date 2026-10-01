package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewVisitorServlet")
public class ViewVisitorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Visitor> visitorList =
                new ArrayList<Visitor>();

        String sql =
                "SELECT * FROM VISITORS "
                + "ORDER BY ID DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Visitor visitor =
                        new Visitor();

                // Visitor ID
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

                    visitor.setStatus("PENDING");

                } else {

                    visitor.setStatus(status);

                }


                visitorList.add(visitor);
            }


            // Send visitor list to JSP
            request.setAttribute(
                    "visitorList",
                    visitorList
            );


            // Open visitor list page
            request.getRequestDispatcher(
                    "viewVisitors.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "error.jsp"
            );
        }
    }
}