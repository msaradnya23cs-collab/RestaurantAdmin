package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String action = req.getParameter("action");
        String msg = "";

        try (Connection con = DBConnection.getConn()) {
            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO staff(name, role) VALUES(?, ?)"
                );
                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("role"));
                ps.executeUpdate();
                msg = "Staff added successfully";

            } else if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE staff SET name=?, role=? WHERE id=?"
                );
                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("role"));
                ps.setInt(3, Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                msg = "Staff updated successfully";
            }

        } catch(Exception e) {
            e.printStackTrace();
            msg = "Operation failed: " + e.getMessage();
        }

        res.sendRedirect("staff.jsp?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String msg = "";
        try (Connection con = DBConnection.getConn()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM staff WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
            msg = "Staff deleted successfully";
        } catch(Exception e) {
            e.printStackTrace();
            msg = "Delete failed: " + e.getMessage();
        }

        res.sendRedirect("staff.jsp?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
    }
}
