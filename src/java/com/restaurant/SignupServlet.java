package com.restaurant;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConn();

            String sql = "INSERT INTO users(username,password) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, req.getParameter("username"));
            ps.setString(2, req.getParameter("password"));

            ps.executeUpdate();

            ps.close();
            con.close();

            res.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Signup Error: " + e.getMessage());
        }
    }
}
