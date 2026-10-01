package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApproveVisitorServlet")
public class ApproveVisitorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("pendingVisitors.jsp");
            return;
        }

        String sql =
                "UPDATE VISITORS "
                + "SET REQUEST_STATUS = 'APPROVED', "
                + "STATUS = 'APPROVED' "
                + "WHERE ID = ? "
                + "AND REQUEST_STATUS = 'PENDING'";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, Integer.parseInt(id));

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("pendingVisitors.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("error.jsp");
        }
    }
}