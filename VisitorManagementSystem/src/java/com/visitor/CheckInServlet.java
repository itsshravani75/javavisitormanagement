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

@WebServlet("/CheckInServlet")
public class CheckInServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("checkInVisitors.jsp");
            return;
        }

        String sql =
                "UPDATE VISITORS "
                + "SET CHECK_IN = ?, "
                + "STATUS = 'CHECKED_IN' "
                + "WHERE ID = ? "
                + "AND REQUEST_STATUS = 'APPROVED' "
                + "AND STATUS = 'APPROVED' "
                + "AND CHECK_IN IS NULL";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            Timestamp checkInTime =
                    Timestamp.valueOf(LocalDateTime.now());

            ps.setTimestamp(1, checkInTime);
            ps.setInt(2, Integer.parseInt(id));

            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        "checkInVisitors.jsp"
                );

            } else {

                response.sendRedirect(
                        "error.jsp"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "error.jsp"
            );
        }
    }
}