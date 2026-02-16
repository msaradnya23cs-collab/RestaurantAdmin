package com.restaurant;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConn();

            if (con == null) {
                response.getWriter().println("DB Connection Failed!");
                return;
            }

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("user", username);

                // SUCCESS → dashboard
                response.sendRedirect("dashboard.jsp");

            } else {

                // FAILURE → login.jsp (NOT index.jsp)
response.sendRedirect("index.jsp?error=Invalid Username or Password");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("Login Error: " + e.getMessage());

        }
    }
}
