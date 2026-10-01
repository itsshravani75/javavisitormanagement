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

@WebServlet("/DashboardStatsServlet")
public class DashboardStatsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int totalVisitors = 0;
        int pendingVisitors = 0;
        int approvedVisitors = 0;
        int checkedInVisitors = 0;
        int completedVisits = 0;

        String totalSql =
                "SELECT COUNT(*) FROM VISITORS";

        String pendingSql =
                "SELECT COUNT(*) FROM VISITORS "
                + "WHERE REQUEST_STATUS = 'PENDING'";

        String approvedSql =
                "SELECT COUNT(*) FROM VISITORS "
                + "WHERE REQUEST_STATUS = 'APPROVED'";

        String checkedInSql =
                "SELECT COUNT(*) FROM VISITORS "
                + "WHERE STATUS = 'CHECKED_IN'";

        String completedSql =
                "SELECT COUNT(*) FROM VISITORS "
                + "WHERE STATUS = 'CHECKED_OUT'";

        try (Connection con = DBConnection.getConnection()) {

            try (PreparedStatement ps =
                    con.prepareStatement(totalSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    totalVisitors = rs.getInt(1);
                }
            }

            try (PreparedStatement ps =
                    con.prepareStatement(pendingSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    pendingVisitors = rs.getInt(1);
                }
            }

            try (PreparedStatement ps =
                    con.prepareStatement(approvedSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    approvedVisitors = rs.getInt(1);
                }
            }

            try (PreparedStatement ps =
                    con.prepareStatement(checkedInSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    checkedInVisitors = rs.getInt(1);
                }
            }

            try (PreparedStatement ps =
                    con.prepareStatement(completedSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    completedVisits = rs.getInt(1);
                }
            }

            request.setAttribute(
                    "totalVisitors",
                    totalVisitors
            );

            request.setAttribute(
                    "pendingVisitors",
                    pendingVisitors
            );

            request.setAttribute(
                    "approvedVisitors",
                    approvedVisitors
            );

            request.setAttribute(
                    "checkedInVisitors",
                    checkedInVisitors
            );

            request.setAttribute(
                    "completedVisits",
                    completedVisits
            );

            request.getRequestDispatcher(
                    "dashboard.jsp"
            ).forward(request, response);

        } catch (SQLException e) {

            e.printStackTrace();

            response.sendRedirect("error.jsp");
        }
    }
}