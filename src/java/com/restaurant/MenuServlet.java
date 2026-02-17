package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String action = req.getParameter("action");
        String msg = "";

        try (Connection con = DBConnection.getConn()) {
            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO menu(name, price) VALUES(?, ?)"
                );
                ps.setString(1, req.getParameter("name"));
                ps.setDouble(2, Double.parseDouble(req.getParameter("price")));
                ps.executeUpdate();
                msg = "Menu item added successfully";

            } else if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE menu SET name=?, price=? WHERE id=?"
                );
                ps.setString(1, req.getParameter("name"));
                ps.setDouble(2, Double.parseDouble(req.getParameter("price")));
                ps.setInt(3, Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                msg = "Menu item updated successfully";
            }

        } catch(Exception e) {
            e.printStackTrace();
            msg = "Operation failed: " + e.getMessage();
        }

        res.sendRedirect("menu.jsp?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String msg = "";
        try (Connection con = DBConnection.getConn()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM menu WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
            msg = "Menu item deleted successfully";
        } catch(Exception e) {
            e.printStackTrace();
            msg = "Delete failed: " + e.getMessage();
        }

        res.sendRedirect("menu.jsp?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
    }
}
