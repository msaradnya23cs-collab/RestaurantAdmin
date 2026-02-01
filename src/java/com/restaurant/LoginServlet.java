package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Connection c = DBConnection.getConn();
            PreparedStatement ps = c.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, req.getParameter("username"));
            ps.setString(2, req.getParameter("password"));
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("user", req.getParameter("username"));
                res.sendRedirect("dashboard.jsp");
            } else {
                res.sendRedirect("login.jsp?error=Invalid+Credentials");
            }
        } catch(Exception e){ e.printStackTrace(); }
    }
}
