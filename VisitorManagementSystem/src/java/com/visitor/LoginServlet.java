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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sql =
                "SELECT * FROM ADMIN WHERE USERNAME = ? AND PASSWORD = ?";
        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) 
        {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
               response.sendRedirect("DashboardStatsServlet");
            } 
            else {
                response.sendRedirect("login.jsp?error=invalid");
            }
        } 
        catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
    }
}