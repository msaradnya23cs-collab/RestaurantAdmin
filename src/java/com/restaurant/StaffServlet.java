package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/StaffActionServlet")
public class StaffServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String action = req.getParameter("action");
        String msg = "";
        try {
            Connection con = DBConnection.getConn();

            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO staff(name, role) VALUES(?, ?)");
                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("role"));
                ps.executeUpdate();
                msg = "Staff Added Successfully";
            } else if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement("UPDATE staff SET name=?, role=? WHERE id=?");
                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("role"));
                ps.setInt(3, Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                msg = "Staff Updated Successfully";
            }
            res.sendRedirect("staff.jsp?msg=" + msg);
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("staff.jsp?msg=Operation+Failed");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Connection con = DBConnection.getConn();
            PreparedStatement ps = con.prepareStatement("DELETE FROM staff WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
            res.sendRedirect("staff.jsp?msg=Staff+Deleted+Successfully");
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("staff.jsp?msg=Delete+Failed");
        }
    }
}
