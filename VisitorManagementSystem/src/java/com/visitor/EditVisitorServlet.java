package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditVisitorServlet")
public class EditVisitorServlet extends HttpServlet {

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
                "SELECT * FROM VISITORS "
                + "WHERE ID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, Integer.parseInt(id));

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

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
                            "address",
                            rs.getString("ADDRESS")
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

                    request.getRequestDispatcher(
                            "editVisitor.jsp"
                    ).forward(request, response);

                } else {

                    response.sendRedirect(
                            "ViewVisitorServlet"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "error.jsp"
            );
        }
    }
}