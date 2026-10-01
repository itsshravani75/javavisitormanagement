package com.visitor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateVisitorServlet")
public class UpdateVisitorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String personToMeet = request.getParameter("person_to_meet");
        String department = request.getParameter("department");
        String purpose = request.getParameter("purpose");

        // Validate required fields
        if (id == null || id.trim().isEmpty()
                || name == null || name.trim().isEmpty()
                || mobile == null || mobile.trim().isEmpty()
                || personToMeet == null || personToMeet.trim().isEmpty()
                || purpose == null || purpose.trim().isEmpty()) {

            response.sendRedirect("error.jsp");
            return;
        }

        String sql =
                "UPDATE VISITORS SET "
                + "NAME = ?, "
                + "MOBILE = ?, "
                + "EMAIL = ?, "
                + "ADDRESS = ?, "
                + "PERSON_TO_MEET = ?, "
                + "DEPARTMENT = ?, "
                + "PURPOSE = ? "
                + "WHERE ID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, name.trim());
            ps.setString(2, mobile.trim());
            ps.setString(3,
                    email != null && !email.trim().isEmpty()
                    ? email.trim()
                    : null);

            ps.setString(4,
                    address != null && !address.trim().isEmpty()
                    ? address.trim()
                    : null);

            ps.setString(5, personToMeet.trim());

            ps.setString(6,
                    department != null && !department.trim().isEmpty()
                    ? department.trim()
                    : null);

            ps.setString(7, purpose.trim());

            ps.setInt(8, Integer.parseInt(id));

            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        "ViewVisitorServlet"
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