package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MenuActionServlet")
public class MenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String action = req.getParameter("action");  
        String msg = "";

        try {
            Connection c = DBConnection.getConn();

            if ("add".equals(action)) {
                PreparedStatement ps = c.prepareStatement("INSERT INTO menu(name, price) VALUES(?, ?)");
                ps.setString(1, req.getParameter("name"));
                ps.setDouble(2, Double.parseDouble(req.getParameter("price")));
                ps.executeUpdate();
                msg = "Added Successfully";
            }

            else if ("update".equals(action)) {
                PreparedStatement ps = c.prepareStatement("UPDATE menu SET name=?, price=? WHERE id=?");
                ps.setString(1, req.getParameter("name"));
                ps.setDouble(2, Double.parseDouble(req.getParameter("price")));
                ps.setInt(3, Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                msg = "Updated Successfully";
            }

            res.sendRedirect("menu.jsp?msg=" + msg);

        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("menu.jsp?msg=Operation+Failed");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        // handle delete
        try {
            Connection c = DBConnection.getConn();
            PreparedStatement ps = c.prepareStatement("DELETE FROM menu WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
            res.sendRedirect("menu.jsp?msg=Deleted+Successfully");
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("menu.jsp?msg=Delete+Failed");
        }
    }
}
