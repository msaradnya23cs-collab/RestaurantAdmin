package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String action = req.getParameter("action");
        String msg = "";

        try {
            Connection con = DBConnection.getConn();

            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO customers(name, phone) VALUES(?, ?)"
                );
                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("phone"));
                ps.executeUpdate();
                msg = "Customer Added Successfully";
            }
            else if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE customers SET name=?, phone=? WHERE id=?"
                );
                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("phone"));
                ps.setInt(3, Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                msg = "Customer Updated Successfully";
            }
            res.sendRedirect("customers.jsp?msg=" + msg);

        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("customers.jsp?msg=Operation+Failed");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Connection con = DBConnection.getConn();
            PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
            res.sendRedirect("customers.jsp?msg=Customer+Deleted+Successfully");
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("customers.jsp?msg=Delete+Failed");
        }
    }
}
