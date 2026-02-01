package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Connection c = DBConnection.getConn();
            PreparedStatement ps = c.prepareStatement("INSERT INTO users(username,password) VALUES(?,?)");
            ps.setString(1, req.getParameter("username"));
            ps.setString(2, req.getParameter("password"));
            ps.executeUpdate();
            res.sendRedirect("login.jsp");
        } catch(Exception e) { e.printStackTrace(); }
    }
}
