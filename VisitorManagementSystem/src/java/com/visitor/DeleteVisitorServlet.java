package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteVisitorServlet")
public class DeleteVisitorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("ViewVisitorServlet");
            return;
        }

        String sql =
                "DELETE FROM VISITORS "
                + "WHERE ID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, Integer.parseInt(id));

            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        "ViewVisitorServlet"
                );

            } else {

                response.sendRedirect(
                        "ViewVisitorServlet"
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