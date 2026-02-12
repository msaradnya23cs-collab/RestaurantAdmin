package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

    res.setContentType("text/html");
    String username = req.getParameter("username");
    String password = req.getParameter("password");

    if(username == null || password == null || username.isEmpty() || password.isEmpty()) {
        res.getWriter().println("Please enter username and password.");
        return;
    }

    try (Connection c = DBConnection.getConn()) {

        PreparedStatement ps = c.prepareStatement(
            "SELECT * FROM users WHERE username=? AND password=?"
        );
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            req.getSession().setAttribute("user", username);
            res.getWriter().println("Login successful! <a href='dashboard.jsp'>Go to Dashboard</a>");
        } else {
            res.getWriter().println("Invalid username or password.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        res.getWriter().println("<h3>Database connection failed!</h3>");
        res.getWriter().println("<pre>" + e.getMessage() + "</pre>");
    }
}
}