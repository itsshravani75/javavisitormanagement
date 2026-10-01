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

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {

            response.sendRedirect("error.jsp");
            return;
        }

        String sql =
                "UPDATE VISITORS "
                + "SET CHECK_OUT = ?, "
                + "STATUS = 'CHECKED_OUT' "
                + "WHERE ID = ? "
                + "AND STATUS = 'CHECKED_IN' "
                + "AND CHECK_OUT IS NULL";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            Timestamp checkOutTime =
                    Timestamp.valueOf(
                        LocalDateTime.now()
                    );

            ps.setTimestamp(1, checkOutTime);

            ps.setInt(
                    2,
                    Integer.parseInt(id)
            );

            int result =
                    ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        "checkOutVisitors.jsp"
                );

            } else {

                response.sendRedirect(
                        "error.jsp"
                );
            }

        } catch (SQLException |
                 NumberFormatException e) {


            response.sendRedirect(
                    "error.jsp"
            );
        }
    }
}